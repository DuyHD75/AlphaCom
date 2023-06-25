package com.code.alphavn.controller.userController;

import com.code.alphavn.model.Customer;
import com.code.alphavn.model.Order;
import com.code.alphavn.service.userService.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet( name = "ServletOrder", value = "/order")
public class ServletOrder extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "viewOrder":
                    handleViewOrder(request, response);
                    break;
                case "cancelOrder":
                    handlecancelOrder(request, response);
                    break;
                case "viewLastOrder":
                        getLastOrder(request, response);
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
                case "cancelOrder":
                    handlecancelOrder(request, response);
                    break;
                default:
                    break;
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void handleViewOrder (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserServiceImpl userService = new UserServiceImpl();
        HttpSession session = request.getSession();
        Customer account = (Customer) session.getAttribute("acc");
        if (account != null) {
            ServletCart cart = new ServletCart();
            cart.handleViewCartHeader(request, response);

            Customer customerId = new Customer(account.getId());
            request.setAttribute("orders", userService.getOrderByCusId(customerId));
            request.getRequestDispatcher("/components/userComponents/viewOrder.jsp").forward(request, response);
        } else {
            response.sendRedirect("loginCustomer");
        }
    }


    public void getLastOrder (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserServiceImpl userService = new UserServiceImpl();
        HttpSession session = request.getSession();
        Customer account = (Customer) session.getAttribute("acc");
        if (account != null) {
            ServletCart cart = new ServletCart();
            cart.handleViewCartHeader(request, response);

            Customer customerId = new Customer(account.getId());

            List<Order> orders = userService.getOrderByCusId(customerId);
            Order order = orders.get(orders.size()-1);
            orders = new ArrayList<>();
            orders.add(order);
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("/components/userComponents/viewOrder.jsp").forward(request, response);
        } else {
            response.sendRedirect("loginCustomer");
        }
    }

    public void handlecancelOrder (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserServiceImpl userService = new UserServiceImpl();
        HttpSession session = request.getSession();
        Customer account = (Customer) session.getAttribute("acc");
        int oid = Integer.parseInt(request.getParameter("oid"));
        if (account != null) {
            Customer customerId = new Customer(account.getId());
            Order order = userService.getOrderByOrderId(oid, customerId);
            userService.CancelOrder(oid);
            request.setAttribute("success", "Cancel success");

            request.getRequestDispatcher("order?action=viewOrder").forward(request, response);
        } else {
            response.sendRedirect("loginCustomer");
        }
    }

}
