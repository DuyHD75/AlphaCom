package com.code.alphavn.controller.userController;




import com.code.alphavn.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ServletUserHome", value = "/home")
public class ServletUserHome extends HttpServlet {

    private static UserServiceImpl userService;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        userService = new UserServiceImpl();

        try {
            request.setAttribute("products",userService.getProducts());
            request.setAttribute("pdMonitors", userService.getProductByCategory("Monitor"));
            request.setAttribute("pdKeyBoard", userService.getProductByCategory("KeyBoard"));
            request.setAttribute("pdHeadPhone", userService.getProductByCategory("HeadPhone"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/components/userComponents/home.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
