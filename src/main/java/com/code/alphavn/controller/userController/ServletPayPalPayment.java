package com.code.alphavn.controller.userController;

import com.code.alphavn.model.Cart;
import com.code.alphavn.model.Customer;
import com.code.alphavn.model.Order;
import com.code.alphavn.model.OrderDetail;
import com.code.alphavn.service.PaymentServices;
import com.code.alphavn.service.UserServiceImpl;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "Servlet paypal payment", value = "/paypalPayment")
public class ServletPayPalPayment extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String isBuyNow = (String) request.getAttribute("isBuyNow");
        if (!Objects.equals(isBuyNow, "true")) isBuyNow="false";
        switch (action) {
            case "receipt":
                handleReceipt(request, response,isBuyNow);
                return;


        }


        Customer customerInf = (Customer) request.getAttribute("customerInf");
        OrderDetail orderDetail = (OrderDetail) request.getAttribute("orderDetail");

        try {
            PaymentServices paymentServices = new PaymentServices();
            String approvalLink = paymentServices.authorizePayment(orderDetail, customerInf);
            response.sendRedirect(approvalLink);
        } catch (PayPalRESTException e) {
            //send error and redirect
            request.setAttribute("errorMessage", "Invalid Payment Details");
            e.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "review":
                handleReview(req, resp);
                break;


        }
    }

    public void handleReview(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");


        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.getPaymentDetails(paymentId);

            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();


            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);
            request.setAttribute("shippingAddress", shippingAddress);


            String url = "/components/userComponents/reviewAndReceipt.jsp?paymentId=" + paymentId + "&PayerID=" + payerId;
            request.getRequestDispatcher(url).forward(request, response);
        } catch (PayPalRESTException e) {
            //send error and redirect to review page
            request.setAttribute("error", "Could not get payment details");
            e.printStackTrace();
            request.getRequestDispatcher("checkout?action=checkout").forward(request, response);
        }
    }

    public void handleReceipt(HttpServletRequest req, HttpServletResponse resp, String isBuyNow) throws ServletException, IOException {
        String paymentId = req.getParameter("paymentId");
        String payerId = req.getParameter("PayerID");

        UserServiceImpl userService = new UserServiceImpl();

        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.executePayment(paymentId, payerId);

            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);


            HttpSession session = req.getSession();
            String isPayNow = (String) session.getAttribute("isPayNow");
            if (isPayNow.equals("true")){
                Order order = (Order) session.getAttribute("order");
                userService.InsertPlaceOrderWithBuyNow(order.getCustomer(), order.getPaymentMethod(), order.getPid(), order.getPrice(), order.getAmount());
            }else {
                            userService.InsertPlaceOrder((Customer) session.getAttribute("customerId"), (List<Cart>) session.getAttribute("carts"), (String) session.getAttribute("payMetthod"));
                            userService.DeleteCartByCusID((Integer) session.getAttribute("cusId"));
            }

            req.setAttribute("payer", payerInfo);
            req.setAttribute("transaction", transaction);
            req.setAttribute("show", "show");
            req.setAttribute("hide", "hide");

            req.getRequestDispatcher("/components/userComponents/reviewAndReceipt.jsp").forward(req, resp);

        } catch (PayPalRESTException | SQLException e) {
            //send error and redirect to some page
            req.setAttribute("error", "Could not execute payment");
            e.printStackTrace();
            req.getRequestDispatcher("checkout?action=checkout").forward(req, resp);
        }
    }
}
