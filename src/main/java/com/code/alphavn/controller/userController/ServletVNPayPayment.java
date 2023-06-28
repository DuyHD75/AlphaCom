package com.code.alphavn.controller.userController;

import com.code.alphavn.model.Cart;
import com.code.alphavn.model.Customer;
import com.code.alphavn.model.Order;
import com.code.alphavn.service.PaymentServices;
import com.code.alphavn.service.userService.UserServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet(name = "ServletVNPayPayment", value = "/ServletVNPayPayment")
public class ServletVNPayPayment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "return":
                try {
                    returnHandle(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "createTransaction":
                createTransaction(req, resp);
        }
    }

    protected void createTransaction(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = (String) request.getAttribute("ordertype");
        long amount = (long) (Double.parseDouble((String) request.getAttribute("amount")) * 100);
        String bankCode = (String) request.getAttribute("bankCode");

        String vnp_TxnRef = PaymentServices.getRandomNumber(8);
        String vnp_IpAddr = PaymentServices.getIpAddress(request);
        String vnp_TmnCode = Constants.vnp_TmnCode;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");

        if (bankCode != null && !bankCode.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bankCode);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = (String) request.getAttribute("language");
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", Constants.vnp_Returnurl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = PaymentServices.hmacSHA512(Constants.vnp_HashSecret, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Constants.vnp_PayUrl + "?" + queryUrl;
        response.sendRedirect(paymentUrl);
    }

    protected void returnHandle(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        //Begin process return from VNPAY
        request.setAttribute("hide", "hide");
        request.setAttribute("show", "hide");
        Map fields = new HashMap();
        for (Enumeration params = request.getParameterNames(); params.hasMoreElements(); ) {
            String fieldName= URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
            if(fieldName.equals("action")) continue;
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
            if ((fieldValue!=null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }

        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }

        String signValue = PaymentServices.hashAllFields(fields);
        if (signValue.equals(vnp_SecureHash)) {

            if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {

                //add to DB
                UserServiceImpl userService = new UserServiceImpl();
                HttpSession session = request.getSession();
                String isPayNow = (String) session.getAttribute("isPayNow");
                Customer account = (Customer) session.getAttribute("acc");
                Customer customer = new Customer(account.getId());
                String exportBillValue = (String) session.getAttribute("exportBillValue");
                if (isPayNow.equals("true")){
                    Order order = (Order) session.getAttribute("order");
                    userService.InsertPlaceOrderWithBuyNow(order.getCustomer(), order.getPaymentMethod(), order.getPid(), order.getPrice(), order.getAmount());
                    List<Order> orders = userService.getOrderByCusId(customer);
                    Order order1 = orders.get(orders.size() - 1);
                    ServletCheckout checkout = new ServletCheckout();
                    if (exportBillValue != null) {
                        checkout.sendBillViaEmail(request, response, order1);
                    }
                }else {
                    userService.InsertPlaceOrder((Customer) session.getAttribute("customerId"), (List<Cart>) session.getAttribute("carts"), (String) session.getAttribute("payMetthod"));
                    userService.DeleteCartByCusID((Integer) session.getAttribute("cusId"));
                    List<Order> orders = userService.getOrderByCusId(customer);
                    Order order = orders.get(orders.size() - 1);
                    ServletCheckout checkout = new ServletCheckout();
                    if (exportBillValue != null) {
                        checkout.sendBillViaEmail(request, response, order);
                    }
                }
                request.setAttribute("paymentStatus", "Success");
                request.setAttribute("hide2","show");
                request.setAttribute("show2", "hide");

            } else {
                request.setAttribute("paymentStatus", "Failed");
                request.setAttribute("hide2","hide");
                request.setAttribute("show2", "show");
            }

        } else {
            request.setAttribute("paymentStatus", "invalid signature");
            request.setAttribute("hide2","hide");
            request.setAttribute("show2", "show");
        }
        request.setAttribute("vnp_TxnRef", request.getParameter("vnp_TxnRef"));
        request.setAttribute("vnp_Amount",request.getParameter("vnp_Amount"));
        request.setAttribute("vnp_OrderInfo", request.getParameter("vnp_OrderInfo"));
        request.setAttribute("vnp_ResponseCode", request.getParameter("vnp_ResponseCode"));
        request.setAttribute("vnp_TransactionNo", request.getParameter("vnp_TransactionNo"));
        request.setAttribute("vnp_BankCode", request.getParameter("vnp_BankCode"));
        request.setAttribute("vnp_PayDate", request.getParameter("vnp_PayDate"));


        ServletContext servletContext = getServletContext();
        RequestDispatcher requestDispatcher = servletContext.getRequestDispatcher("/components/userComponents/reviewAndReceipt.jsp");


        request.setAttribute("show_vnpay", "show");

        requestDispatcher.forward(request,response);

    }
}
