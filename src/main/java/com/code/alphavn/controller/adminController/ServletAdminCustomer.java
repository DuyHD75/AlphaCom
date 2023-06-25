package com.code.alphavn.controller.adminController;

import com.code.alphavn.model.Customer;
import com.code.alphavn.model.Order;
import com.code.alphavn.model.OrderDetail;
import com.code.alphavn.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ServletAdminCustomer", value = "/adminCustomer")
public class ServletAdminCustomer extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "viewAllCustomer":
                    handleViewAllCustomer(request, response);
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
                case "deleteSelected":
                    handleDeleteSelected(request, response);

                    break;
                default:
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void handleViewAllCustomer (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserServiceImpl userService = new UserServiceImpl();
        HttpSession session = request.getSession();
//        Customer account = (Customer) session.getAttribute("acc");
//        if (account != null) {
        List<Customer> Customers = userService.getAllCustomer();
        int countCustomer = Customers.size();
        for (Customer customer : Customers) {
            List<Order> orders = userService.getOrderByCusId(customer);
            int countOrder = orders.size();
            double totalSpent = 0;
            customer.setQuantityOrder(countOrder);
            for( Order order : orders) {

                double totalPriceOrder = 0;
                for (OrderDetail orderDetail : order.getOrderDetail()){
                    totalPriceOrder = totalPriceOrder + orderDetail.getPrice() * orderDetail.getQuantityOrdered();
                    order.setTotalPriceOrder(totalPriceOrder);
                }
                totalSpent = totalSpent + order.getTotalPriceOrder();
                totalSpent = (double) Math.round(totalSpent * 100) / 100;
            }
            customer.setTotalSpent(totalSpent);
        }
        request.setAttribute("countCustomer", countCustomer);
        request.setAttribute("customers", Customers);
        request.getRequestDispatcher("/components/adminComponents/ecommerce-customers.jsp").forward(request, response);
//        } else {
//            response.sendRedirect("loginCustomer");
//        }

    }

    public void handleDeleteSelected (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String customerIdsParam = request.getParameter("customerIds");
        String[] selectedIds = customerIdsParam.split(",");
        List<Customer> customerIds = new ArrayList<>();
        if (selectedIds != null) {
            for (String id : selectedIds) {
                int Id = Integer.parseInt(id);
                customerIds.add( new Customer(Id));
            }
        }
        UserServiceImpl userService = new UserServiceImpl();
        userService.DeleteCustomerSelected(customerIds);
        response.sendRedirect("adminCustomer?action=viewAllCustomer");

    }
}
