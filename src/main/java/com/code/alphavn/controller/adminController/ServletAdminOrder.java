package com.code.alphavn.controller.adminController;

import com.code.alphavn.model.Customer;
import com.code.alphavn.model.Order;
import com.code.alphavn.model.OrderDetail;
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

@WebServlet(name = "ServletAdminOrder", value = "/adminOrder")
public class ServletAdminOrder extends HttpServlet {

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
                case "viewAllOrder":
                    handleViewAllOrder(request, response);
                    break;
                case "deleteOrder":
                    handleDeleteOrder(request, response);
                    break;
                case "viewOrderDetail":
                    handleViewOrderDetail(request, response);
                    break;
                case "nextOrderDetail":
                    handleNextOrderDetail(request, response);
                    break;
                case "priviousOrderDetail":
                    handlePrivousOrderDetail(request, response);
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
                default:
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void handleViewOrderDetail (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserServiceImpl userService = new UserServiceImpl();
        HttpSession session = request.getSession();
//        Customer account = (Customer) session.getAttribute("acc");
//        if (account != null) {
            int CusId = Integer.parseInt(request.getParameter("Cid"));
            int Oid = Integer.parseInt(request.getParameter("Oid"));
            Customer customer = new Customer(CusId);
            List<Order> orders = userService.getOrderByCusId(customer);
            int countOrder = orders.size();
            List<OrderDetail> orderDetails = userService.getOrderByOrderId(Oid).getOrderDetail();
            int countOrderDetail = orderDetails.size();
            request.setAttribute("countOrder", countOrder);
            request.setAttribute("countOrderDetail", countOrderDetail);
            request.setAttribute("order", userService.getOrderByOrderId(Oid));
            request.getRequestDispatcher("/components/adminComponents/ecommerce-order-details.jsp").forward(request, response);
//        } else {
//            response.sendRedirect("loginCustomer");
//        }

    }

    public void handleNextOrderDetail (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserServiceImpl userService = new UserServiceImpl();
        HttpSession session = request.getSession();
//        Customer account = (Customer) session.getAttribute("acc");
//        if (account != null) {
            int Oid = Integer.parseInt(request.getParameter("Oid"));
            List<Order> orders = adminService.getAllOrder();
            int currentIndex = getOrderIndex(orders, Oid);

            int nextOrderId = getNextOrderId(orders, currentIndex);

            Order order = userService.getOrderByOrderId(Oid);

            int CusId = order.getCustomer().getId();

            response.sendRedirect("adminOrder?action=viewOrderDetail&&Oid=" + nextOrderId + "&&Cid=" + CusId);

//        } else {
//            response.sendRedirect("loginCustomer");
//        }

    }
    public void handlePrivousOrderDetail (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserServiceImpl userService = new UserServiceImpl();
        HttpSession session = request.getSession();
//        Customer account = (Customer) session.getAttribute("acc");
//        if (account != null) {
        int Oid = Integer.parseInt(request.getParameter("Oid"));
        List<Order> orders = adminService.getAllOrder();
        int currentIndex = getOrderIndex(orders, Oid);

        int nextOrderId = getPreviousOrderId(orders, currentIndex);

        Order order = userService.getOrderByOrderId(Oid);

        int CusId = order.getCustomer().getId();

        response.sendRedirect("adminOrder?action=viewOrderDetail&&Oid=" + nextOrderId + "&&Cid=" + CusId);
//        } else {
//            response.sendRedirect("loginCustomer");
//        }

    }

    // Hàm tìm vị trí của order hiện tại trong danh sách
    private int getOrderIndex(List<Order> orderList, int currentOrderId) {
        for (int i = 0; i < orderList.size(); i++) {
            Order order = orderList.get(i);
            if (order.getId() == currentOrderId) {
                return i;
            }
        }
        return -1; // Không tìm thấy order hiện tại trong danh sách
    }

    // Hàm xác định ID order liền trước
    private int getPreviousOrderId(List<Order> orderList, int currentIndex) {
        if (currentIndex > 0) {
            Order previousOrder = orderList.get(currentIndex - 1);
            return previousOrder.getId();
        }
        return orderList.get(orderList.size() - 1).getId(); // Không có order liền trước
    }

    // Hàm xác định ID order liền sau
    private int getNextOrderId(List<Order> orderList, int currentIndex) {
        if (currentIndex < orderList.size() - 1) {
            Order nextOrder = orderList.get(currentIndex + 1);
            return nextOrder.getId();
        }
        return orderList.get(0).getId(); // Không có order liền sau
    }

    public void handleViewAllOrder (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserServiceImpl userService = new UserServiceImpl();
        HttpSession session = request.getSession();
//        Customer account = (Customer) session.getAttribute("acc");
//        if (account != null) {
        List<Order> orders = adminService.getAllOrder();
        int countOrder = orders.size();
        request.setAttribute("countOrder", countOrder);
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/components/adminComponents/ecommerce-orders.jsp").forward(request, response);
//        } else {
//            response.sendRedirect("loginCustomer");
//        }

    }
    public void handleDeleteSelected (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String orderIdsParam = request.getParameter("orderIds");
        String[] selectedIds = orderIdsParam.split(",");
        List<Order> ordersIds = new ArrayList<>();
        if (selectedIds != null) {
            for (String id : selectedIds) {
                int Id = Integer.parseInt(id);
                ordersIds.add( new Order(Id));
            }
        }
        UserServiceImpl userService = new UserServiceImpl();
        adminService.DeleteOrderSelected(ordersIds);
        response.sendRedirect("adminOrder?action=viewAllOrder");

    }

    public void handleDeleteOrder (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int oId = Integer.parseInt(request.getParameter("Oid"));

        UserServiceImpl userService = new UserServiceImpl();
        adminService.DeleteOrder(oId);
        response.sendRedirect("adminOrder?action=viewAllOrder");

    }

    public void handleUpdateStatus (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int oId = Integer.parseInt(request.getParameter("Oid"));
        String status = request.getParameter("status");
        UserServiceImpl userService = new UserServiceImpl();
        Order order = userService.getOrderByOrderId(oId);

        int CusId = order.getCustomer().getId();
        adminService.UpdateStatusOrder(oId, status);
        response.sendRedirect("adminOrder?action=viewOrderDetail&&Oid=" + oId + "&&Cid=" + CusId);

    }
}

