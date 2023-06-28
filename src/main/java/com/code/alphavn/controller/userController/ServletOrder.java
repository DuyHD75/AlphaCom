package com.code.alphavn.controller.userController;

import com.code.alphavn.model.Customer;
import com.code.alphavn.model.Order;
import com.code.alphavn.model.OrderDetail;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

@WebServlet( name = "ServletOrder", value = "/order")
public class ServletOrder extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "viewOrder":
                    handleViewOrder(request, response);
                    break;
                case "cancelOrder":
                    handlecancelOrder(request, response);
                    break;
                case "viewLastOrder":
                        getLastOrder(request, response);
                    break;
                default:
                    break;
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "cancelOrder":
                    handlecancelOrder(request, response);
                    break;
                default:
                    break;
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void handleViewOrder (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserServiceImpl userService = new UserServiceImpl();
        HttpSession session = request.getSession();
        Customer account = (Customer) session.getAttribute("acc");
        if (account != null) {
            ServletCart cart = new ServletCart();
            cart.handleViewCartHeader(request, response);

            Customer customerId = new Customer(account.getId());
            request.setAttribute("orders", userService.getOrderByCusId(customerId));
            request.getRequestDispatcher("/components/userComponents/viewOrder.jsp").forward(request, response);
        } else {
            response.sendRedirect("loginCustomer");
        }
    }


    public void getLastOrder (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserServiceImpl userService = new UserServiceImpl();
        HttpSession session = request.getSession();
        Customer account = (Customer) session.getAttribute("acc");
        if (account != null) {
            ServletCart cart = new ServletCart();
            cart.handleViewCartHeader(request, response);

            Customer customerId = new Customer(account.getId());

            List<Order> orders = userService.getOrderByCusId(customerId);
            Order order = orders.get(orders.size()-1);
            orders = new ArrayList<>();
            orders.add(order);
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("/components/userComponents/viewOrder.jsp").forward(request, response);
        } else {
            response.sendRedirect("loginCustomer");
        }
    }

    public void handlecancelOrder (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserServiceImpl userService = new UserServiceImpl();
        HttpSession session = request.getSession();
        Customer account = (Customer) session.getAttribute("acc");
        int oid = Integer.parseInt(request.getParameter("oid"));
        if (account != null) {
            Customer customerId = new Customer(account.getId());
            Order order = userService.getOrderByOrderId(oid);
            userService.CancelOrder(oid);
            request.setAttribute("success", "Cancel success");
            OrderCancellationNotice(request, response, order);
            request.getRequestDispatcher("order?action=viewOrder").forward(request, response);
        } else {
            response.sendRedirect("loginCustomer");
        }
    }

    public void OrderCancellationNotice ( HttpServletRequest request, HttpServletResponse response, Order order) throws ServletException, IOException {
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
        // compose message
        try {
            double total = 0;
            String products = "";
            for (OrderDetail orderDetail : order.getOrderDetail()) {
                String product = "[ " + orderDetail.getProduct().getProduct().getName() +
                        ":"+ orderDetail.getPrice() + " x " + orderDetail.getQuantityOrdered() + " ]\n";
                products =products + product;
                total = total + ( orderDetail.getPrice() * orderDetail.getQuantityOrdered());
            }
            MimeMessage message = new MimeMessage(session1);
            message.setFrom(new InternetAddress("hdat1502@gmail.com"));// change accordingly
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("You canceled your AE" + order.getId() + "order at Alpha Electro Shop.");
            message.setContent("Order has been canceled."
                            + "<br>Order ID: " + order.getId()
                            + "<br>Placed on: " + order.getOrderDate()
                            + "<br>Customer name: " + order.getCustomer().getName()
                            + "<br>Email: " + order.getCustomer().getEmail()
                            + "<br>Phone: " + order.getCustomer().getPhone()
                            + "<br>Address: " + order.getCustomer().getAddress()
                            + "<br>Payment method: " + order.getPaymentMethod()
                            + "<br>Product: " + products
                            + "<br>Grand Total: " + total
                            + "<br>Status: Cancel",
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
