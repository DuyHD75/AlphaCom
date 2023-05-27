package com.code.alphavn.controller.userController;

import com.code.alphavn.model.Customer;
import com.code.alphavn.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet ( name = "ServletSignupCustomer", value = "/signupCustomer")
public class ServletSignupCustomer extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phonenumber = request.getParameter("phonenumber");
        String password = request.getParameter("password");

        UserServiceImpl userService = new UserServiceImpl();
        String encodedpass= userService.getBase64Encoded(password);

        Customer customer = new Customer(fullname, encodedpass, email, phonenumber);


        Customer account = userService.CheckAccountExist(customer);

        if(account==null){

            userService.Signup(customer);
            request.getRequestDispatcher("/loginCustomer").forward(request, response);
        }else{
            request.setAttribute("messSignup","Email already exists.");
            request.setAttribute("addClass","right__panel--active right__panel-t-m--active");
            request.getRequestDispatcher("components/userComponents/login.jsp").forward(request, response);
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
