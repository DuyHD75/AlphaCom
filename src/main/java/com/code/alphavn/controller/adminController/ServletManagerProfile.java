package com.code.alphavn.controller.adminController;

import com.code.alphavn.service.adminService.AdminServiceImpl;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ServletManagerProfile", value = "/managerProfile")

public class ServletManagerProfile extends HttpServlet {
    private AdminServiceImpl adminService;

    @Override
    public void init() throws ServletException {
        super.init();
        adminService = new AdminServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        try {
            switch (action) {
                case "showProfile":
                    ShowManagerSettingProfiles(req, resp);
                    break;

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    public void ShowManagerSettingProfiles(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

        request.getRequestDispatcher("/components/adminComponents/editMyProfile.jsp").forward(request, response);
    }

}
