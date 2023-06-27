package com.code.alphavn.controller.userController;

import com.code.alphavn.model.Customer;
import com.code.alphavn.service.userService.UserServiceImpl;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;

/**
 * Servlet implementation class ForgotPassword
 */
//@WebServlet("/forgotPassword")
@WebServlet(name = "forgotPassword",value = "/forgotPassword")
public class ForgotPassword extends HttpServlet {
    static final String from = "hdat1502@gmail.com";
    static final String password = "ootkbvbsapgibuas";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");

        UserServiceImpl userService = new UserServiceImpl();

        Customer customer = userService.getCustomerByEmail(email);

        if (customer != null) {
            RequestDispatcher dispatcher = null;
            if(customer.getPassword() == null){
                request.setAttribute("mess", "This email is already registered with google. You cannot change the password for this email.");
                request.getRequestDispatcher("/components/userComponents/forgotPassword.jsp").forward(request, response);
            } else {
                int otpvalue = 0;
                HttpSession mySession = request.getSession();
                if (email != null || !email.equals("")) {
                    // sending otp
                    Random rand = new Random();
                    otpvalue = rand.nextInt(1255650);

                    String to = email;// change accordingly
                    // Get the session object
                    Properties props = new Properties();
                    props.put("mail.smtp.host", "smtp.gmail.com");
                    props.put("mail.smtp.socketFactory.port", "465");
                    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.port", "465");
                    Session session = Session.getDefaultInstance(props, new Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication("hdat1502@gmail.com", "ootkbvbsapgibuas");
                            // Put your email

                            // id and
                            // password here
                        }
                    });
                    // compose message
                    try {
                        MimeMessage message = new MimeMessage(session);
                        message.setFrom(new InternetAddress("hdat1502@gmail.com"));// change accordingly
                        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                        message.setSubject("Change password");
                        message.setText("Your OTP is: " + otpvalue);
                        // send message
                        Transport.send(message);
                    } catch (MessagingException e) {
                        throw new RuntimeException(e);
                    }
                    request.setAttribute("hide", "hide");
                    request.setAttribute("show", "show");
                    dispatcher = request.getRequestDispatcher("/components/userComponents/forgotPassword.jsp");
                    request.setAttribute("message1", "OTP has been sent to your email");
                    //request.setAttribute("connection", con);
                    mySession.setAttribute("otp", otpvalue);
                    mySession.setAttribute("email", email);
                    dispatcher.forward(request, response);
                }
            }
        } else {
            request.setAttribute("mess", "Email don't exist!");
            request.getRequestDispatcher("/components/userComponents/forgotPassword.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/components/userComponents/forgotPassword.jsp").forward(request, response);
    }
}

