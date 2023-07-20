package com.code.alphavn.controller.userController;

import com.code.alphavn.model.*;

import com.code.alphavn.service.PaymentServices;

import org.json.JSONObject;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Transaction;
import com.code.alphavn.model.Cart;
import com.code.alphavn.model.Customer;
import com.code.alphavn.model.ProductDiscount;
import com.code.alphavn.service.userService.UserServiceImpl;


import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;

@WebServlet(name = "ServletCheckout", value = "/checkout")
public class ServletCheckout extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "checkout":
                    handleInformationAndListCart(request, response);
                    break;
                default:
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "placedOrder":
                    handleCheckout(request, response);
                    break;
                case "BuyNow":
                    handleBuyNow(request, response);
                    break;
                default:
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void handleInformationAndListCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        Customer account = (Customer) session.getAttribute("acc");
        session.setAttribute("isPayNow", "false");
        UserServiceImpl userService = new UserServiceImpl();
        if (account != null) {
            Customer cusId = new Customer(account.getId());
            Customer info = userService.getAccountByCusID(cusId);

            //thêm cái này vào những trang có header.jsp
            ServletCart viewcart = new ServletCart();
            viewcart.handleViewCartHeader(request, response);

            request.setAttribute("infomation", info);

            int customerId = account.getId();
            List<Cart> listCart = userService.getCartByCusID(customerId);
            Date currentDate = new Date();
            for (Cart cart : listCart) {
                double price = 0;
                for (ProductDiscount productDiscount : cart.getProductDiscount()) {
                    if (productDiscount.getPid() == cart.getProductInfo().getProduct().getId()) {
                        if (currentDate.before(productDiscount.getEnd_date()) && currentDate.after(productDiscount.getStart_date())) {
                            price = (double) Math.ceil((cart.getProductInfo().getPrice() - (cart.getProductInfo().getPrice() * productDiscount.getDis_amount() / 100)) * 100) / 100;
                            cart.setFinalPrice(price);
                        }
                    }
                }
            }

            request.setAttribute("listCart", listCart);

        } else {
            response.sendRedirect("loginCustomer");
        }
        request.setAttribute("isBuyNow", "false");
        request.getRequestDispatcher("/components/userComponents/checkout.jsp").forward(request, response);
    }

    public void handleCheckout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            //String isBuyNow = request.getParameter("isBuyNow");
            String Pid = request.getParameter("pid");

            String exportBillValue = request.getParameter("ExportBill");

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("number");
            String address = request.getParameter("flat");

            UserServiceImpl userService = new UserServiceImpl();

            HttpSession session = request.getSession();
            Customer account = (Customer) session.getAttribute("acc");

            String payMetthod = request.getParameter("method");
            if (account != null) {
                int cusId = account.getId();
                Customer customerId = new Customer(account.getId());
                Customer info = userService.getAccountByCusID(customerId);
                request.setAttribute("infomation", info);

                List<Cart> carts = userService.getCartByCusID(cusId);
                request.setAttribute("countProductInCart", carts.size());

                if (!Pid.equals("")) { // cho buy now
                    int pid = Integer.parseInt(Pid);
                    Double price = Double.parseDouble(request.getParameter("price"));
                    int amount = Integer.parseInt(request.getParameter("amount"));
                    String lastProductName = request.getParameter("productName");

                    Order order1 = new Order(customerId, payMetthod, pid, price, amount);

                    session.setAttribute("order", order1);
                    session.setMaxInactiveInterval(108000);

                    if (payMetthod.equals("PAYPAL")) {
                        info.setPhone(request.getParameter("number"));
                        info.setEmail(request.getParameter("email"));
                        info.setAddress(request.getParameter("flat"));

                        OrderDetail orderDetail = new OrderDetail(lastProductName, Double.toString(price), "0", "0", Double.toString(price));
                        request.setAttribute("paymentMethod", payMetthod);
                        request.setAttribute("customerInf", info);
                        request.setAttribute("orderDetail", orderDetail);
                        session.setAttribute("exportBillValue", exportBillValue);

                        request.getRequestDispatcher("paypalPayment").forward(request, response);
                    } else if (payMetthod.equals("VNPAY")) {

                        // FOR REALTIME CURRENCY (USD TO VND)
//                            JSONObject jsonObject = PaymentServices.readJsonFromUrl("https://api.currencyapi.com/v3/latest?apikey=R5AaCB7IvKqkY3F3OQhfJAJKD90rp34pTA6uaeLR");
//                            JSONObject jsonData = jsonObject.getJSONObject("data");
//                            JSONObject jsonVND = jsonData.getJSONObject("VND");
//                            float currencyValue = jsonVND.getFloat("value");
//                            System.out.println(currencyValue);

                        // comment bellow line if you want to change realtime to fixed currency
                        float currencyValue = 23525.033F;

                        DecimalFormat df = new DecimalFormat();
                        df.setMaximumFractionDigits(3);
                        df.format(currencyValue);
                        request.setAttribute("ordertype", request.getParameter("ordertype"));
                        request.setAttribute("amount", Double.toString(currencyValue * price));
                        request.setAttribute("bankCode", request.getParameter("bankCode"));
                        request.setAttribute("language", request.getParameter("language"));
                        System.out.println(request.getAttribute("language"));
                        System.out.println(request.getAttribute("bankCode"));
                        session.setAttribute("exportBillValue", exportBillValue);
                        request.getRequestDispatcher("ServletVNPayPayment?action=createTransaction").forward(request, response);

                    } else {
                        userService.InsertPlaceOrderWithBuyNow(customerId, payMetthod, pid, price, amount);
                        List<Order> orders = userService.getOrderByCusId(customerId);
                        Order order = orders.get(orders.size() - 1);
                        if (exportBillValue != null) {
                            sendBillViaEmail(request, response, order);
                        }
                        response.sendRedirect("order?action=viewLastOrder");
                    }
                } else { // mua bang cart
                    if (carts.size() == 0) {
                        request.setAttribute("error", "Your cart is empty, can't placed order. Buy now");
                        request.getRequestDispatcher("/components/userComponents/checkout.jsp").forward(request, response);
                    } else {
                        //calculate total
                        List<Cart> listCart = userService.getCartByCusID(account.getId());
                        String lastProductName = "";
                        double total = 0;
                        Date currentDate = new Date();
                        for (Cart cart : listCart) {
                            lastProductName += cart.getAmount() + "x" + cart.getProductInfo().getProduct().getName() + "\t|\t \n";
                            double price = 0;
                            for (ProductDiscount productDiscount : cart.getProductDiscount()) {
                                if (productDiscount.getPid() == cart.getProductInfo().getProduct().getId()) {
                                    if (currentDate.before(productDiscount.getEnd_date()) && currentDate.after(productDiscount.getStart_date())) {
                                        price += (double) Math.round((cart.getProductInfo().getPrice() - (cart.getProductInfo().getPrice() * productDiscount.getDis_amount())) * 100) / 100;
                                        cart.setFinalPrice(price);
                                    }
                                }
                            }
                            total += cart.getFinalPrice() * cart.getAmount();
                        }
                        session.setAttribute("customerId", customerId);
                        session.setAttribute("carts", carts);
                        session.setAttribute("payMetthod", payMetthod);
                        session.setAttribute("cusId", cusId);
                        if (payMetthod.equals("PAYPAL")) {
                            info.setPhone(request.getParameter("number"));
                            info.setEmail(request.getParameter("email"));
                            info.setAddress(request.getParameter("flat"));

                            OrderDetail orderDetail = new OrderDetail(lastProductName, Double.toString(total), "0", "0", Double.toString(total));
                            request.setAttribute("paymentMethod", payMetthod);
                            request.setAttribute("customerInf", info);
                            request.setAttribute("orderDetail", orderDetail);
                            session.setAttribute("exportBillValue", exportBillValue);

                            request.getRequestDispatcher("paypalPayment").forward(request, response);
                        } else if (payMetthod.equals("VNPAY")) {
                            // FOR REALTIME CURRENCY (USD TO VND)

//                            JSONObject jsonObject = PaymentServices.readJsonFromUrl("https://api.currencyapi.com/v3/latest?apikey=R5AaCB7IvKqkY3F3OQhfJAJKD90rp34pTA6uaeLR");
//                            JSONObject jsonData = jsonObject.getJSONObject("data");
//                            JSONObject jsonVND = jsonData.getJSONObject("VND");
//                            float currencyValue = jsonVND.getFloat("value");


                            // comment bellow line if you want to change realtime to fixed currency
                            float currencyValue = 23525.033F;

                            DecimalFormat df = new DecimalFormat();
                            df.setMaximumFractionDigits(3);
                            df.format(currencyValue);

                            request.setAttribute("ordertype", request.getParameter("ordertype"));
                            request.setAttribute("amount", Double.toString(currencyValue * total));
                            request.setAttribute("bankCode", request.getParameter("bankCode"));
                            request.setAttribute("language", request.getParameter("language"));
                            session.setAttribute("exportBillValue", exportBillValue);
                            request.getRequestDispatcher("ServletVNPayPayment?action=createTransaction").forward(request, response);
                        } else {
                            userService.InsertPlaceOrder(customerId, carts, payMetthod);
                            userService.DeleteCartByCusID(cusId);
                            List<Order> orders = userService.getOrderByCusId(customerId);
                            Order order = orders.get(orders.size() - 1);
                            if (exportBillValue != null) {
                                sendBillViaEmail(request, response, order);
                            }
                            response.sendRedirect("order?action=viewLastOrder");
                        }

                    }
                }
                int id = account.getId();
                Customer customer = new Customer(id, name, address, email, phone);
                userService.updateProfile(customer);
                response.sendRedirect("order?action=viewLastOrder");
            } else {
                response.sendRedirect("loginCustomer");
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void handleBuyNow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();

        Customer account = (Customer) session.getAttribute("acc");

        int pid = Integer.parseInt(request.getParameter("pid"));

        String pname = request.getParameter("name");

        String pimg = request.getParameter("img");

        Double price = Double.parseDouble(request.getParameter("price"));

        int amount = Integer.parseInt(request.getParameter("amount"));

        String pd = request.getParameter("pidDetail");
        int pidDetail = 1;
        if (pd != null) {
            pidDetail = Integer.parseInt(pd);
        }



        UserServiceImpl userService = new UserServiceImpl();

        if (account != null) {
            System.out.println("BUY NOW ACTIVE : ACC");
            Customer cusId = new Customer(account.getId());
            Customer info = userService.getAccountByCusID(cusId);

            //thêm cái này vào những trang có header.jsp
            ServletCart viewcart = new ServletCart();
            viewcart.handleViewCartHeader(request, response);
            ProductInfo productInfo = userService.getProductByID(pid);
            if (amount > productInfo.getProduct().getAmount_remaining()) {
                request.setAttribute("error", "Amount product not available ! Instock " +
                        productInfo.getProduct().getAmount_remaining());

                request.getRequestDispatcher("./view_product?action=view_product&&pid=" + pidDetail).forward(request, response);
                return;
            }
            request.setAttribute("infomation", info);
            Date currentDate = new Date();
            double newPrice = 0;
            for (ProductDiscount productDiscount : userService.getProductDiscounts()) {
                if (productDiscount.getPid() == pid) {
                    if (currentDate.before(productDiscount.getEnd_date()) && currentDate.after(productDiscount.getStart_date())) {
                        newPrice = (double) Math.round((price - (price * productDiscount.getDis_amount() / 100)) * 100) / 100;
                        price = newPrice;
                    }
                }
            }
            request.setAttribute("pid", pid);
            request.setAttribute("pname", pname);
            request.setAttribute("pimg", pimg);
            request.setAttribute("price", price);
            request.setAttribute("amount", amount);
            session.setAttribute("isPayNow", "true");

        } else {
            System.out.println("BUY NOW ACTIVE : NO ACC");
            response.sendRedirect("loginCustomer");
        }
        request.getRequestDispatcher("/components/userComponents/checkout.jsp").forward(request, response);
    }

    public void sendBillViaEmail(HttpServletRequest request, HttpServletResponse response, Order order) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer account = (Customer) session.getAttribute("acc");
        String email = account.getEmail();
        String to = email;// change accordingly
        // Get the session object
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        Session session1 = Session.getDefaultInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("hdat1502@gmail.com", "ootkbvbsapgibuas");// Put your email

            }
        });

        try {
            double total = 0;
            String products = "";
            for (OrderDetail orderDetail : order.getOrderDetail()) {
                String product = "[ " + orderDetail.getProduct().getProduct().getName() +
                        ":" + orderDetail.getPrice() + " x " + orderDetail.getQuantityOrdered() + " ]\n";
                products = products + product;
                total = total + (orderDetail.getPrice() * orderDetail.getQuantityOrdered());
            }
            MimeMessage message = new MimeMessage(session1);
            message.setFrom(new InternetAddress("hdat1502@gmail.com"));// change accordingly
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Shop at Alpha Electro on " + order.getOrderDate());
            message.setContent("Order ID: " + order.getId()
                            + "<br>Placed on: " + order.getOrderDate()
                            + "<br>Customer name: " + order.getCustomer().getName()
                            + "<br>Email: " + order.getCustomer().getEmail()
                            + "<br>Phone: " + order.getCustomer().getPhone()
                            + "<br>Address: " + order.getCustomer().getAddress()
                            + "<br>Payment method: " + order.getPaymentMethod()
                            + "<br>Product: " + products
                            + "<br>Grand Total: " + total
                            + "<br>Status: " + order.getStatus(),
                    "text/html"
            );

            // send message
            Transport.send(message);
            System.out.println("message sent successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

}
