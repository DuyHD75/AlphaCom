package com.code.alphavn.controller.userController;

import com.code.alphavn.model.Cart;
import com.code.alphavn.model.Customer;
import com.code.alphavn.model.Order;
import com.code.alphavn.model.ProductDiscount;
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

@WebServlet( name = "ServletCheckout", value = "/checkout")
public class ServletCheckout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "checkout":
                    handleInfomationAndListCart(request, response);
                    break;
                default:
                    break;
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "placedOrder":
                    handleCheckout(request, response);
//                    request.getRequestDispatcher("/components/userComponents/viewOrder.jsp").forward(request, response);
                    break;
                default:
                    break;
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void handleInfomationAndListCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer account = (Customer) session.getAttribute("acc");

        UserServiceImpl userService = new UserServiceImpl();
        if (account != null){
            Customer cusId = new Customer(account.getId());
            Customer info = userService.getAccountByCusID(cusId);

            //thêm cái này vào những trang có header.jsp
            ServletCart viewcart = new ServletCart();
            viewcart.handleViewCartHeader(request, response);

            request.setAttribute("infomation", info);

            int customerId = account.getId();
            List<Cart> listCart = userService.getCartByCusID(customerId);
            Date currentDate = new Date();
            for (Cart cart : listCart) {
                double price = 0;
                for (ProductDiscount productDiscount : cart.getProductDiscount()){
                    if (productDiscount.getPid() == cart.getProductInfo().getProduct().getId()){
                        if (currentDate.before(productDiscount.getEnd_date()) && currentDate.after(productDiscount.getStart_date())){
                            price =(double) Math.round( (cart.getProductInfo().getPrice() - (cart.getProductInfo().getPrice() * productDiscount.getDis_amount())) * 100) /100;
                            cart.setFinalPrice(price);
                        }
                    }
                }
            }

            request.setAttribute("listCart", listCart);

        } else {
            response.sendRedirect("loginCustomer");
        }
        request.getRequestDispatcher("/components/userComponents/checkout.jsp").forward(request, response);
    }

    public void handleCheckout (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            UserServiceImpl userService = new UserServiceImpl();
            HttpSession session = request.getSession();
            Customer account = (Customer) session.getAttribute("acc");
            String payMetthod = request.getParameter("method");
            if (account != null) {
                int cusId = account.getId();
                Customer customerId = new Customer(account.getId());
                Customer info = userService.getAccountByCusID(customerId);
                request.setAttribute("infomation", info);

                List<Cart> carts = userService.getCartByCusID(cusId);
                request.setAttribute("countProductInCart", carts.size());
                if ( carts.size() == 0 ) {
                    request.setAttribute("error", "Your cart is empty, can't placed order. Buy now");
                    request.getRequestDispatcher("/components/userComponents/checkout.jsp").forward(request, response);
                } else {
                    if (payMetthod.equals("ATM")){

                    } else if (payMetthod.equals("VNPAY")) {

                    }
                    userService.InsertPlaceOrder(customerId, carts, payMetthod);
                    userService.DeleteCartByCusID(cusId);
                    response.sendRedirect("order?action=viewLastOrder");
                }
            } else {
                response.sendRedirect("loginCustomer");
            }



        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
