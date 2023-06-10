package com.code.alphavn.controller.userController;

import com.code.alphavn.model.Cart;
import com.code.alphavn.model.Customer;
import com.code.alphavn.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet( name = "ServletProfile", value = "/profileCustomer")
public class ServletProfileCustomer extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        Customer account = (Customer) session.getAttribute("acc");
        UserServiceImpl userService = new UserServiceImpl();

        if(account!=null){

            Customer id = new Customer(account.getId());
            Customer profile = userService.getAccountByCusID(id);

            //thêm cái này vào những trang có header.jsp
            ServletCart cart = new ServletCart();
            cart.handleViewCartHeader(request, response);

            request.setAttribute("infomation", profile);
            request.getRequestDispatcher("components/userComponents/profile.jsp").forward(request, response);
        }else {
            response.sendRedirect("/loginCustomer");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Customer account = (Customer) session.getAttribute("acc");
        UserServiceImpl userService = new UserServiceImpl();

        if(account!=null){
            String name = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phonenumber");
            String address = request.getParameter("address");
            int id= account.getId();
            Customer customer = new Customer(id, name, address, email, phone);
            userService.updateProfile(customer);
            account.setName(name);
            response.sendRedirect("profileCustomer");
//            request.getRequestDispatcher("profile").forward(request, response);

        }else {
            response.sendRedirect("loginCustomer");
        }
    }
}
