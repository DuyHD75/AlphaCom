package com.code.alphavn.controller.userController;

import com.code.alphavn.model.Cart;
import com.code.alphavn.model.Customer;
import com.code.alphavn.model.ProductDiscount;
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
import java.util.Date;
import java.util.List;

@WebServlet(name = "ServletCart", value = "/cart")
public class ServletCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "viewCart":
                    handleViewCart(request, response);
                    break;
                case "AddToCart":
                    handleAddToCart(request, response);
                    break;
                case "deleteFromCartHeader":
                    handelDeleteFromCartHeader(request, response);
                    break;
                case "deletaAllCart":
                    handelDeletaAllCart(request, response);
                    break;
                default:
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "updateAmountCart":
                    handleUpdateAmountCart(request, response);
                    break;
                case "AddToCart":
                    handleAddToCart(request, response);
                    break;
                case "deleteFromCart":
                    handelDeleteFromCart(request, response);
                    break;
                default:
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void handleViewCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserServiceImpl userService = new UserServiceImpl();
        HttpSession session = request.getSession();
        Customer account = (Customer) session.getAttribute("acc");
        if (account != null) {
            int cusId = account.getId();
            List<Cart> listCart = userService.getCartByCusID(cusId);
            Date currentDate = new Date();
            for (Cart cart : listCart) {
                double price = 0;
                for (ProductDiscount productDiscount : cart.getProductDiscount()) {
                    if (productDiscount.getPid() == cart.getProductInfo().getProduct().getId()) {
                        if (currentDate.before(productDiscount.getEnd_date()) && currentDate.after(productDiscount.getStart_date())) {
                            price = (double) Math.round((cart.getProductInfo().getPrice() - (cart.getProductInfo().getPrice() * productDiscount.getDis_amount())) * 100) / 100;
                            cart.setFinalPrice(price);
                        }
                    }
                }
            }
            request.setAttribute("countProductInCart", listCart.size());
            request.setAttribute("listCart", listCart);
        } else {
            response.sendRedirect("loginCustomer");
        }
        request.getRequestDispatcher("/components/userComponents/cart.jsp").forward(request, response);
    }

    public void handleUpdateAmountCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int amount = Integer.parseInt(request.getParameter("qty"));
            String id = request.getParameter("pid");
            int pid = Integer.parseInt(id);
            UserServiceImpl userService = new UserServiceImpl();
            HttpSession session = request.getSession();
            Customer account = (Customer) session.getAttribute("acc");
            if (account != null) {
                int cusId = account.getId();
                ProductInfo productInfo = userService.getProductByID(pid);
                if (amount > productInfo.getProduct().getAmount_remaining()) {
                    userService.UpdateAmountCart(cusId, pid, productInfo.getProduct().getAmount_remaining());
                } else {
                    userService.UpdateAmountCart(cusId, pid, amount);
                }
                List<Cart> listCart = userService.getCartByCusID(cusId);
                request.setAttribute("listCart", listCart);
                request.setAttribute("countProductInCart", listCart.size());
            } else {
                response.sendRedirect("loginCustomer");
            }
            response.sendRedirect("cart?action=viewCart");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void handleAddToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int amount = 0;
            String id = request.getParameter("pid");
            int pid = Integer.parseInt(id);
            UserServiceImpl userService = new UserServiceImpl();
            HttpSession session = request.getSession();
            Customer account = (Customer) session.getAttribute("acc");

            if (account != null) {
                int cusId = account.getId();
                if (id != null) {
                    ProductInfo productInfo = userService.getProductByID(pid);
                    if (productInfo != null) {
                        if (request.getParameter("amount") != null) {
                            amount = Integer.parseInt(request.getParameter("amount"));
                        } else {
                            amount = 1;
                        }
                        Cart cart = userService.CheckCartExist(cusId, pid);
                        if (productInfo.getProduct().getAmount_remaining() > 0) {
                            if (cart == null) {
                                userService.InsertCart(cusId, pid, amount);
                            } else {
                                int newAmount = amount + cart.getAmount();
                                if (newAmount > productInfo.getProduct().getAmount_remaining()) {
                                    userService.UpdateAmountCart(cusId, pid, productInfo.getProduct().getAmount_remaining());
                                } else {
                                    userService.UpdateAmountCart(cusId, pid, newAmount);
                                }
                            }
                        }
                    }
                }
            } else {
                response.sendRedirect("loginCustomer");
            }
            responeCurrenPage(request,response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void handleViewCartHeader(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserServiceImpl userService = new UserServiceImpl();
        HttpSession session = request.getSession();
        Customer account = (Customer) session.getAttribute("acc");
        int cusId = account.getId();
        List<Cart> listCart = userService.getCartByCusID(cusId);
        Date currentDate = new Date();
        for (Cart cart : listCart) {
            double price = 0;
            for (ProductDiscount productDiscount : cart.getProductDiscount()) {
                if (productDiscount.getPid() == cart.getProductInfo().getProduct().getId()) {
                    if (currentDate.before(productDiscount.getEnd_date()) && currentDate.after(productDiscount.getStart_date())) {
                        price = (double) Math.round((cart.getProductInfo().getPrice() - (cart.getProductInfo().getPrice() * productDiscount.getDis_amount())) * 100) / 100;
                        cart.setFinalPrice(price);
                    }
                }
            }
        }
        request.setAttribute("listCart", listCart);
        request.setAttribute("countProductInCart", listCart.size());
    }

    public void handelDeleteFromCartHeader(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        int pid = Integer.parseInt(request.getParameter("pid"));

        Customer account = (Customer) session.getAttribute("acc");
        if (account != null) {
            int customerId = account.getId();
            UserServiceImpl userService = new UserServiceImpl();
            userService.DeleteFromCart(customerId, pid);

            session.setAttribute("open", "open");

            responeCurrenPage(request, response);
            response.sendRedirect("home");
        } else {
            response.sendRedirect("loginCustomer");
        }
    }

    public void handelDeleteFromCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer account = (Customer) session.getAttribute("acc");

        int pid = Integer.parseInt(request.getParameter("pid"));
        UserServiceImpl userService = new UserServiceImpl();

        if (account != null) {
            int customerId = account.getId();
            userService.DeleteFromCart(customerId, pid);
            List<Cart> listCart = userService.getCartByCusID(customerId);
            request.setAttribute("countProductInCart", listCart.size());
            response.sendRedirect("cart?action=viewCart");
        } else {
            response.sendRedirect("loginCustomer");
        }
    }

    public void handelDeletaAllCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer account = (Customer) session.getAttribute("acc");
        UserServiceImpl userService = new UserServiceImpl();
        int cusId = account.getId();
        List<Cart> listCart = userService.getCartByCusID(cusId);

        if (account != null) {
            int customerId = account.getId();
            userService.DeleteCartByCusID(customerId);
            session.setAttribute("countProductInCart", listCart.size());
            response.sendRedirect("cart?action=viewCart");
        } else {
            response.sendRedirect("loginCustomer");
        }
    }

    public void responeCurrenPage (HttpServletRequest request, HttpServletResponse response) throws  IOException{
        HttpSession session = request.getSession();
        String pidDetail = request.getParameter("pidDetail");
        String currentPage = (String) session.getAttribute("currentPage");
//      Chuyển hướng đến trang tương ứng
        if (currentPage.equals("/alphavn/components/userComponents/home.jsp")) {
            response.sendRedirect("home");
        } else if (currentPage.equals("/alphavn/components/userComponents/detailProduct.jsp")) {
            response.sendRedirect("view_product?pid=" + pidDetail);
        } else if (currentPage.equals("/alphavn/components/userComponents/profile.jsp")) {
            response.sendRedirect("profileCustomer");
        } else if (currentPage.equals("/alphavn/components/userComponents/cart.jsp")) {
            response.sendRedirect("cart?action=viewCart");
        } else if (currentPage.equals("/alphavn/components/userComponents/checkout.jsp")) {
            response.sendRedirect("checkout?action=checkout");
        } else if (currentPage.equals("/alphavn/components/userComponents/viewOrder.jsp")) {
            response.sendRedirect("order?action=viewOrder");
        } else if (currentPage.equals("/alphavn/components/userComponents/wishListProduct.jsp")) {
            response.sendRedirect("wishList");
        } else if (currentPage.equals("/alphavn/components/userComponents/store.jsp")) {
            response.sendRedirect("store");
        }
    }
}
