package com.code.alphavn.controller.userController;

import com.code.alphavn.model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import com.code.alphavn.service.userService.UserServiceImpl;

@WebServlet(name = "ServletViewWishList", value = "/wishList")
public class ServletWishList extends HttpServlet {

    UserServiceImpl userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("acc");
        String action = request.getParameter("action");

        if (customer == null) {
            request.getRequestDispatcher("loginCustomer").forward(request, response);
            return;
        }

        if (action == null) {
            action = "";
        }

        if (action != null) {
            try {
                switch (action) {
                    case "deleteFromWishList":
                        deleteFromWishList(request, response);
                        break;
                    case "addToWishList":
                        addToWishList(request, response);
                        break;
                    default:
                        if (customer != null) {
                            ServletCart cart = new ServletCart();
                            cart.handleViewCartHeader(request, response);
                        }
                        request.setAttribute("list", userService.getWishList(customer.getEmail()));
                        request.getRequestDispatcher("/components/userComponents/wishListProduct.jsp").forward(request, response);
                        break;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("acc");
        String action = request.getParameter("action");

        if (customer == null) {
            request.getRequestDispatcher("loginCustomer").forward(request, response);
            return;
        }
        try {
            switch (action) {
                case "deleteFromWishList":
                    deleteFromWishList(request, response);


                    break;
                case "addToWishList":
                    addToWishList(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    public void addToWishList(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("acc");
        int pid = Integer.parseInt(request.getParameter("pid"));
        List<WishListProduct> wishListProducts = userService.getWishList(customer.getEmail());
        ServletCart cart = new ServletCart();
        for (WishListProduct wishListProduct : wishListProducts) {
            if (wishListProduct.getProduct_id() == pid) {
                cart.responeCurrenPage(request, response);
                break;
            }
        }
        userService.addWishList(pid, customer.getId());
        session.setAttribute("numWish", (Integer) session.getAttribute("numWish") + 1);

        cart.responeCurrenPage(request, response);
    }

    public void deleteFromWishList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("acc");
        int pid = Integer.parseInt(request.getParameter("pid"));
        userService.deleteWishList(pid, customer.getId());
        session.setAttribute("numWish", (Integer) session.getAttribute("numWish") - 1);
        response.sendRedirect("wishList");
    }


    public List<ProductDiscount> getFinalPrice(List<ProductDiscount> disconts) {
        Date todayDate = new Date();
        List<ProductDiscount> tmp = new ArrayList<>();
        for (int i = 0; i < disconts.size(); i++) {
            // handle get final price
        }
        return null;
    }
}



