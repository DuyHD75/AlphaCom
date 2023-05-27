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

@WebServlet(name = "ServletViewProduct", value = "/view_product")
public class ServletViewProduct extends HttpServlet {
    private static UserServiceImpl userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        userService = new UserServiceImpl();

        int pid = Integer.parseInt(request.getParameter("pid"));
        try {
            ProductInfo productInfo = userService.getProductByID(pid);
            request.setAttribute("pdDetail", productInfo);
            request.setAttribute("pdReviews", userService.getProductReviews(pid));
            request.setAttribute("pdCategory", userService.getProductByCategory(productInfo.getProduct().getCategory()));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/components/userComponents/detailProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
