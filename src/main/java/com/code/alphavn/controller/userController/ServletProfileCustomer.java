package com.code.alphavn.controller.userController;

import com.code.alphavn.model.Cart;
import com.code.alphavn.model.Customer;
import com.code.alphavn.model.ProductInfo;
import com.code.alphavn.service.userService.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet( name = "ServletProfile", value = "/profileCustomer")
public class ServletProfileCustomer extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "viewProfile":
                    handleViewProfile(request, response);
                    break;
                case "changePassword":
                    handleChangePassword(request, response);
                    break;
                default:
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        try {
            switch (action) {
                case "updateProfile":
                    handleUpdateProfile(request, response);
                    break;
                case "changePassword":
                    handleChangePassword(request, response);
                    break;
                default:
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void handleViewProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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

    public void handleUpdateProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
            response.sendRedirect("profileCustomer?action=viewProfile");

        }else {
            response.sendRedirect("loginCustomer");
        }
    }

    public void handleChangePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Customer account = (Customer) session.getAttribute("acc");
        UserServiceImpl userService = new UserServiceImpl();

        if(account!=null){
            String OldPass = request.getParameter("oldpassword");
            String NewPass = request.getParameter("newpassword");

            ServletCart cart = new ServletCart();
            cart.handleViewCartHeader(request, response);
            request.setAttribute("show", "show");
            request.setAttribute("hide", "hide");

            if(OldPass==null){
                request.getRequestDispatcher("components/userComponents/profile.jsp").forward(request, response);
            } else {
                String encodedOldPass = userService.getBase64Encoded(OldPass);
                String encodedNewPass = userService.getBase64Encoded(NewPass);
                if(encodedOldPass.equals(account.getPassword()))
                {
                    int id= account.getId();
                    Customer customer = new Customer(id, account.getName(), encodedNewPass, account.getAddress(), account.getEmail(), account.getPhone(), account.getCreate_At());
                    userService.changePassword(customer);
                    request.setAttribute("success", "Change password success");
                    request.getRequestDispatcher("components/userComponents/profile.jsp").forward(request, response);
                } else {
                    request.setAttribute("msg", "Old password incorrect!");
                    request.getRequestDispatcher("components/userComponents/profile.jsp").forward(request, response);
                }

            }


        }else {
            response.sendRedirect("loginCustomer");
        }
    }
}
