package com.code.alphavn.controller.adminController;

import com.code.alphavn.service.adminService.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ServletHome", value = "/adminHome")
public class ServletHome extends HttpServlet {
    private AdminServiceImpl adminService;

    @Override
    public void init() throws ServletException {
        super.init();
        adminService = new AdminServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            implementAdminHome(req, resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    public void implementAdminHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        request.setAttribute("totalOrder", adminService.getTotalOrder());
        request.setAttribute("customers", adminService.getCustomers());
        request.setAttribute("totalCus", adminService.getTotalCus());
        request.setAttribute("completed", adminService.filterOrderBySatus("Pending").size());
        request.setAttribute("totalPrice", adminService.getTotalPriceOrder());
        request.getRequestDispatcher("/components/adminComponents/adminhome.jsp").forward(request, response);
    }

}
