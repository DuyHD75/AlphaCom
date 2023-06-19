package com.code.alphavn.controller.userController;





import com.code.alphavn.model.Customer;
import com.code.alphavn.service.userService.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ServletUserHome", value = "/home")
public class ServletUserHome extends HttpServlet {

    private static UserServiceImpl userService;


    @Override
    public void init() throws ServletException {
        super.init();
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        implementUserHome(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


    public void implementUserHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("products", userService.getNewProducts());
            request.setAttribute("pdLaptop", userService.getProductByCategory("Laptop"));
            request.setAttribute("pdMonitors", userService.getProductByCategory("Monitor"));
            request.setAttribute("pdKeyBoard", userService.getProductByCategory("KeyBoard"));
            request.setAttribute("pdHeadPhone", userService.getProductByCategory("HeadPhone"));
            request.setAttribute("pdDiscount", userService.getProductDiscounts());
          
            HttpSession session = request.getSession();
          
            Customer account = (Customer) session.getAttribute("acc");
          
            if (account != null){
                ServletCart cart = new ServletCart();
                cart.handleViewCartHeader(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/components/userComponents/home.jsp").forward(request, response);
    }
}
