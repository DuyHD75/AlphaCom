package com.code.alphavn.controller.userController;

import com.code.alphavn.model.Customer;
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
import java.util.Properties;
import java.util.Random;

@WebServlet ( name = "ServletSignupCustomer", value = "/signupCustomer")
public class ServletSignup extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phonenumber = request.getParameter("phonenumber");
        String password = request.getParameter("password");
        String OTP = request.getParameter("otp");

        UserServiceImpl userService = new UserServiceImpl();
        String encodedpass= userService.getBase64Encoded(password);

        Customer customer = new Customer(fullname, encodedpass, email, phonenumber);

        Customer account = userService.getCustomerByEmail(email);

        if(account!=null){
            request.setAttribute("messSignup","Email already exists.");
            request.setAttribute("addClass","right__panel--active right__panel-t-m--active");
            request.getRequestDispatcher("components/userComponents/login.jsp").forward(request, response);
        }else{

            if (OTP.equals("")){
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
                            return new PasswordAuthentication("hdat1502@gmail.com", "ootkbvbsapgibuas");// Put your email

                        }
                    });
                    // compose message
                    try {
                        MimeMessage message = new MimeMessage(session);
                        message.setFrom(new InternetAddress("hdat1502@gmail.com"));// change accordingly
                        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                        message.setSubject("Welcome To Alpha Electro | OTP CODE SIGN UP");
                        message.setText("Hello,\n" +
                                "\n" +
                                "We sincerely greet you when you have successfully registered to our Alpha Electro website system. Congratulations for joining our community!\n" +
                                "\n" +
                                "Your OTP is:\n" + otpvalue +
                                "\n" +
                                "  We sincerely thank you and hope you have a pleasant experience on Alpha Electro.\n" +
                                "\n" +
                                "Best regards,\n" +
                                "Team Alpha Electro");
                        // send message
                        Transport.send(message);
                        System.out.println("message sent successfully");
                    } catch (MessagingException e) {
                        throw new RuntimeException(e);
                    }
                    request.setAttribute("show", "show");
                    request.setAttribute("message1", "OTP has been sent to your email");
                    //request.setAttribute("connection", con);
                    mySession.setAttribute("otp", otpvalue);
                    mySession.setAttribute("email", email);
                    request.setAttribute("fullname", fullname);
                    request.setAttribute("email1", email);
                    request.setAttribute("phonenumber", phonenumber);
                    request.setAttribute("password", password);
                    request.setAttribute("addClass","right__panel--active right__panel-t-m--active");
                    request.getRequestDispatcher("/components/userComponents/login.jsp").forward(request, response);
                }
            } else {
                int value=Integer.parseInt(request.getParameter("otp"));
                HttpSession session=request.getSession();
                int otp=(int)session.getAttribute("otp");

                if (value==otp) {
                    userService.Signup(customer);
                    request.getRequestDispatcher("/loginCustomer").forward(request, response);
                } else {
                    request.setAttribute("messSignup","Wrong OTP");
                    request.setAttribute("hide", "hide");
                    request.setAttribute("show", "show");
                    request.setAttribute("fullname", fullname);
                    request.setAttribute("email1", email);
                    request.setAttribute("phonenumber", phonenumber);
                    request.setAttribute("password", password);
                    request.setAttribute("addClass","right__panel--active right__panel-t-m--active");
                    request.getRequestDispatcher("components/userComponents/login.jsp").forward(request, response);
                }
            }

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("addClass","right__panel--active right__panel-t-m--active");
        request.getRequestDispatcher("components/userComponents/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
