package com.code.alphavn.controller.adminController;

import com.code.alphavn.model.adminModel.Admin;
import com.code.alphavn.service.adminService.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
        HttpSession session = request.getSession();
        Admin account = (Admin) session.getAttribute("acc");
        if (account != null) {
            request.setAttribute("totalOrder", adminService.getAllOrder().size());
            request.setAttribute("customers", adminService.getAllCustomer());
            request.setAttribute("totalCus", adminService.getAllCustomer().size());
            request.setAttribute("pending", adminService.filterOrderBySatus("Pending").size());
            request.setAttribute("shipping", adminService.filterOrderBySatus("Shipping").size());
            request.setAttribute("completed", adminService.filterOrderBySatus("Fulfilled").size());
            request.setAttribute("cancel", adminService.filterOrderBySatus("Cancel").size());
            request.setAttribute("totalPrice", adminService.getTotalPriceOrder());
            request.getRequestDispatcher("/components/adminComponents/adminhome.jsp").forward(request, response);
        } else {
            response.sendRedirect("loginCustomer");
        }
    }

}
