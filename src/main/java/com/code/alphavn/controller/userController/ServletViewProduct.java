package com.code.alphavn.controller.userController;

import com.code.alphavn.model.Cart;
import com.code.alphavn.model.Customer;
import com.code.alphavn.model.ProductInfo;
import com.code.alphavn.service.UserServiceImpl;

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

            ProductInfo productInfo = userService.getProductByID(pid);
            request.setAttribute("pdDetail", productInfo);
            request.setAttribute("pdReviews", userService.getProductReviews(pid));
            request.setAttribute("pdCategory", userService.getProductByCategory(productInfo.getProduct().getCategory()));

            HttpSession session = request.getSession();
            Customer account = (Customer) session.getAttribute("acc");
            if (account != null){
                //thêm cái này vào những trang có header.jsp
                ServletCart cart = new ServletCart();
                cart.handleViewCartHeader(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/components/userComponents/detailProduct.jsp").forward(request, response);
    }
}
