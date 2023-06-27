package com.code.alphavn.controller.adminController;

import com.code.alphavn.service.adminService.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ServletAdminLogin", value = "/admin")
public class ServletAdminLogin extends HttpServlet {

    private AdminServiceImpl adminService;

    @Override
    public void init() throws ServletException {
        super.init();
        adminService = new AdminServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            request.setAttribute("statistic", adminService.saveOrdersByDayOfWeek());
            request.setAttribute("manages",adminService.getManageOrderInCurrDate());
            request.setAttribute("prdTops", adminService.getTopSellingProduct());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/components/adminComponents/ecommerce.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}

