package com.code.alphavn.controller.userController;

import com.code.alphavn.model.Customer;
import com.code.alphavn.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet( name = "ServletLoginCustomer", value = "/loginCustomer" )
public class ServletLoginCustomer extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");

        UserServiceImpl userService = new UserServiceImpl();
        String encodedpass = userService.getBase64Encoded(password);

        Customer customer = new Customer(encodedpass, email);

        Customer account = userService.Login(customer);

        if(account == null){
            request.setAttribute("messLogin", "Wrong username or password.");
            request.getRequestDispatcher("/components/userComponents/login.jsp").forward(request, response);
        }else{
            if(fullname != null){
                request.setAttribute("email", email);
                request.setAttribute("password", password);
                request.getRequestDispatcher("/components/userComponents/login.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("acc", account);
                session.setMaxInactiveInterval(108000);
//                request.getRequestDispatcher("/components/userComponents/home.jsp").forward(request, response);
                response.sendRedirect("home");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/components/userComponents/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}