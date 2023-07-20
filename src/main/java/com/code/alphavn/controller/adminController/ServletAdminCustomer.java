package com.code.alphavn.controller.adminController;

import com.code.alphavn.model.Customer;
import com.code.alphavn.model.Order;
import com.code.alphavn.model.OrderDetail;
import com.code.alphavn.model.adminModel.Admin;
import com.code.alphavn.service.adminService.AdminServiceImpl;
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

@WebServlet(name = "ServletAdminCustomer", value = "/adminCustomer")
public class ServletAdminCustomer extends HttpServlet {

    private AdminServiceImpl adminService = null;

    @Override
    public void init() throws ServletException {
        super.init();
        adminService = new AdminServiceImpl();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "viewAllCustomer":
                    handleViewAllCustomer(request, response);
                    break;
                case "viewCustomerDetail":
                    handleViewCustomerDetail(request, response);
                    break;
                case "nextCustomerDetail":
                    handleNextCustomerDetail(request, response);
                    break;
                case "previousCustomerDetail":
                    handlePreviousCustomerDetail(request, response);
                    break;
                case "updateStatus":
                    handleUpdateStatus(request, response);
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
                case "deleteCustomer":
                    handleDeleteCustomer(request, response);

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
        Admin account = (Admin) session.getAttribute("acc");
        if (account != null) {
        List<Customer> Customers = adminService.getAllCustomer();
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
        } else {
            response.sendRedirect("loginCustomer");
        }

    }

    public void handleDeleteSelected (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String customerIdsParam = request.getParameter("customerIds");
        String[] selectedIds = customerIdsParam.split(",");
        HttpSession session = request.getSession();
        Admin account = (Admin) session.getAttribute("acc");
        if (account != null) {
            List<Customer> customerIds = new ArrayList<>();
            if (selectedIds != null) {
                for (String id : selectedIds) {
                    int Id = Integer.parseInt(id);
                    customerIds.add( new Customer(Id));
                }
            }
            UserServiceImpl userService = new UserServiceImpl();
            adminService.DeleteCustomerSelected(customerIds);
            response.sendRedirect("adminCustomer?action=viewAllCustomer");
        } else {
            response.sendRedirect("loginCustomer");
        }
    }

    public void handleViewCustomerDetail ( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserServiceImpl userService = new UserServiceImpl();
        HttpSession session = request.getSession();
        Admin account = (Admin) session.getAttribute("acc");
        if (account != null) {
            int CusId = Integer.parseInt(request.getParameter("Cid"));
            Customer customer = new Customer(CusId);
            Customer cus = userService.getAccountByCusID(customer);
            List<Order> orders = userService.getOrderByCusId(customer);
            int countOrder = orders.size();
            request.setAttribute("countOrder", countOrder);
            request.setAttribute("orders", orders);
            request.setAttribute("customer", cus);
            request.getRequestDispatcher("/components/adminComponents/ecommerce-customer-details.jsp").forward(request, response);
        } else {
            response.sendRedirect("loginCustomer");
        }
    }

    public void handleNextCustomerDetail (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserServiceImpl userService = new UserServiceImpl();
        HttpSession session = request.getSession();
        Admin account = (Admin) session.getAttribute("acc");
        if (account != null) {
        int Cid = Integer.parseInt(request.getParameter("Cid"));
        List<Customer> customers = adminService.getAllCustomer();
        int currentIndex = getCustomerIndex(customers, Cid);

        int nextCustomerId = getNextCustomerId(customers, currentIndex);

        response.sendRedirect("adminCustomer?action=viewCustomerDetail&&Cid=" + nextCustomerId);

        } else {
            response.sendRedirect("loginCustomer");
        }

    }
    public void handlePreviousCustomerDetail (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserServiceImpl userService = new UserServiceImpl();
        HttpSession session = request.getSession();
        Admin account = (Admin) session.getAttribute("acc");
        if (account != null) {
        int Cid = Integer.parseInt(request.getParameter("Cid"));
        List<Customer> customers = adminService.getAllCustomer();
        int currentIndex = getCustomerIndex(customers, Cid);

        int previousCustomerId = getPreviousCustomerId(customers, currentIndex);

        response.sendRedirect("adminCustomer?action=viewCustomerDetail&&Cid=" + previousCustomerId);
        } else {
            response.sendRedirect("loginCustomer");
        }

    }

    // Hàm tìm vị trí của customer hiện tại trong danh sách
    private int getCustomerIndex(List<Customer> customers, int currentCustomerId) {
        for (int i = 0; i < customers.size(); i++) {
            Customer customer = customers.get(i);
            if (customer.getId() == currentCustomerId) {
                return i;
            }
        }
        return -1; // Không tìm thấy customer hiện tại trong danh sách
    }

    // Hàm xác định ID customer liền trước
    private int getPreviousCustomerId(List<Customer> customers, int currentIndex) {
        if (currentIndex > 0) {
            Customer previousOrder = customers.get(currentIndex - 1);
            return previousOrder.getId();
        }
        return customers.get(customers.size() - 1).getId(); // Không có customer liền trước
    }

    // Hàm xác định ID customer liền sau
    private int getNextCustomerId(List<Customer> customers, int currentIndex) {
        if (currentIndex < customers.size() - 1) {
            Customer nextOrder = customers.get(currentIndex + 1);
            return nextOrder.getId();
        }
        return customers.get(0).getId(); // Không có customer liền sau
    }

    public void handleUpdateStatus (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int CusId = Integer.parseInt(request.getParameter("Cid"));
        String status = request.getParameter("status");
        UserServiceImpl userService = new UserServiceImpl();
        Customer customerId = new Customer(CusId);
        Customer customer = userService.getAccountByCusID(customerId);

        adminService.UpdateStatusCustomer(CusId, status);
        response.sendRedirect("adminCustomer?action=viewCustomerDetail&&Cid=" + CusId);

    }

    public void handleDeleteCustomer (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int Cid = Integer.parseInt(request.getParameter("Cid"));
        HttpSession session = request.getSession();
        Admin account = (Admin) session.getAttribute("acc");
        if (account != null) {
        adminService.DeleteCustomer(Cid);
        response.sendRedirect("adminCustomer?action=viewAllCustomer");
        } else {
            response.sendRedirect("loginCustomer");
        }
    }
}
