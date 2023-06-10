package com.code.alphavn.controller.userController;

import com.code.alphavn.model.Cart;

import com.code.alphavn.model.Customer;
import com.code.alphavn.model.ProductInfo;
import com.code.alphavn.model.ProductReview;
import com.code.alphavn.service.UserServiceImpl;

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
import java.util.Date;
import java.util.List;
import java.sql.SQLOutput;
import java.util.Properties;
import java.util.Random;


@WebServlet(name = "ServletViewProduct", value = "/view_product")
public class ServletViewProduct extends HttpServlet {
    private static UserServiceImpl userService;


    @Override
    public void init() throws ServletException {
        super.init();
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        implementViewProduct(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void implementViewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pid = Integer.parseInt(request.getParameter("pid"));
        try {

            HttpSession session = request.getSession();
            Customer account = (Customer) session.getAttribute("acc");
            ProductInfo productInfo = userService.getProductByID(pid);
          
            if(account !=null) {
                ServletCart cart = new ServletCart();
                cart.handleViewCartHeader(request, response);
              
                Customer id = new Customer(account.getId());
                Customer profile = userService.getAccountByAccID(id);
                request.setAttribute("infomation", profile);
            }
          
          request.setAttribute("pdDetail", productInfo);
          request.setAttribute("pdReviews", userService.getProductReviews(pid));
          request.setAttribute("pdCategory", userService.getProductByCategory(productInfo.getProduct().getCategory()));
          request.setAttribute("pdRatingReviews", userService.getProductRatingReviews(pid));
          request.getRequestDispatcher("/components/userComponents/detailProduct.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
  


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        userService = new UserServiceImpl();
        String pdID = request.getParameter("pid");

        if (pdID != null) {

            int pid = Integer.parseInt(pdID);

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String comment = request.getParameter("comment");
            String rating1=request.getParameter("rating");
            String OTP = request.getParameter("otp");

            Customer customer = userService.getCustomerByEmail(email); 

                if (customer != null) {
                    int id_cus = customer.getId();
                    System.out.println("id : " + id_cus);
                    ProductReview product1 = new ProductReview(pid, id_cus, Integer.parseInt(rating1), comment);


                    try {
                        System.out.println(userService.insertReview(product1));

                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    response.sendRedirect("./view_product?pid=" + pid);
                } else {
                    request.setAttribute("messSignup", "Need sign up to review product");
                    request.setAttribute("fullname", name);
                    request.setAttribute("email1", email);
                    request.setAttribute("addClass", "right__panel--active right__panel-t-m--active");
                    request.getRequestDispatcher("/components/userComponents/login.jsp").forward(request, response);
                }


        }
        else {
            response.getWriter().println("He");
        }
    }
