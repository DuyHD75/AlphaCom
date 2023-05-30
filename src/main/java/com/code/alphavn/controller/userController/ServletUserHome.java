package com.code.alphavn.controller.userController;




import com.code.alphavn.model.ProductInfo;
import com.code.alphavn.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

        userService = new UserServiceImpl();

        try {
            request.setAttribute("products",userService.getProducts());
            request.setAttribute("pdLaptop", userService.getProductByCategory("Laptop"));
            request.setAttribute("pdMonitors", userService.getProductByCategory("Monitor"));
            request.setAttribute("pdKeyBoard", userService.getProductByCategory("KeyBoard"));
            request.setAttribute("pdHeadPhone", userService.getProductByCategory("HeadPhone"));
            request.setAttribute("pdDiscount", userService.getProductDiscounts());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/components/userComponents/home.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
