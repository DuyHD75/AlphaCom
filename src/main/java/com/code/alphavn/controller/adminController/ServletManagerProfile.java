package com.code.alphavn.controller.adminController;

import com.code.alphavn.model.adminModel.Admin;
import com.code.alphavn.model.adminModel.Manager;
import com.code.alphavn.service.adminService.AdminServiceImpl;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            ShowManagerSettingProfiles(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String formType = request.getParameter("formType");
        try {
            switch (formType) {
                case "form1":
                    ChangeProfileAdmin(request, response);
                    break;
                case "form2":
                    ChangeProfileMana(request, response);
                    break;
                case "form3":
                    ChangePassAdmin(request, response);
                    break;
                case "form4":
                    ChangePassMana(request, response);
                    break;

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    public void ShowManagerSettingProfiles(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();

        Admin admin = (Admin) session.getAttribute("acc");

        Manager manager = (Manager) session.getAttribute("accMana");
        System.out.println(admin);
        System.out.println(manager);
        request.getRequestDispatcher("/components/adminComponents/editMyProfile.jsp").forward(request, response);
    }

    public void ChangeProfileAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String name = request.getParameter("editNameModal");
        String email = request.getParameter("editEmailModal");
        HttpSession session = request.getSession();
        Admin account = (Admin) session.getAttribute("acc");
        int id = account.getId();
        Admin admin = new Admin(id, name, email);
        if (adminService.updateInfoAdmin(admin)) {
            Admin accountUpdate = adminService.getAdminById(id);
            session.removeAttribute("acc");
            session.setAttribute("acc", accountUpdate);
            request.setAttribute("messInfo", "Update success");
            ShowManagerSettingProfiles(request, response);
        } else {
            request.setAttribute("messInfo", "Update failed");
            ShowManagerSettingProfiles(request, response);
        }
    }

    public void ChangePassAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        Admin account = (Admin) session.getAttribute("acc");
        String pass = (account.getPass());
        String email = account.getEmail();
        String currentPass = request.getParameter("currentPassword");
        String newPass = request.getParameter("newPassword");
        if (pass.equals(currentPass)) {
            if (adminService.updatePassAdmin(email, newPass)) {
                request.setAttribute("mess", "Change Password success");
                ShowManagerSettingProfiles(request, response);
            } else {
                request.setAttribute("mess", "Change Password failed");
                ShowManagerSettingProfiles(request, response);
            }
        } else {
            request.setAttribute("messCurrent", "Current password is wrong");
            ShowManagerSettingProfiles(request, response);
        }

    }

    public void ChangePassMana(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        Manager account = (Manager) session.getAttribute("accMana");
        String pass = (account.getPass());
        String email = account.getEmail();
        String currentPass = request.getParameter("currentPassword");
        String newPass = request.getParameter("newPassword");
        if (pass.equals(currentPass)) {
            if (adminService.updatePassMana(email, newPass)) {
                request.setAttribute("mess", "Change Password success");
                ShowManagerSettingProfiles(request, response);
            } else {
                request.setAttribute("mess", "Change Password failed");
                ShowManagerSettingProfiles(request, response);
            }
        } else {
            request.setAttribute("messCurrent", "Current password is wrong");
            ShowManagerSettingProfiles(request, response);
        }

    }

    public void ChangeProfileMana(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String name = request.getParameter("editNameModal");
        String email = request.getParameter("editEmailModal");
        HttpSession session = request.getSession();
        Manager account = (Manager) session.getAttribute("accMana");
        int id = account.getId();
        System.out.println(id);
        Manager manager = new Manager(id, name, email);
        if (adminService.updateInfoManaByMana(manager)) {
            Manager accountUpdate = adminService.getManaById(id);
            session.removeAttribute("accMana");
            session.setAttribute("accMana", accountUpdate);
            request.setAttribute("messInfo", "Update success");
            ShowManagerSettingProfiles(request, response);
        } else {
            request.setAttribute("messInfo", "Update failed");
            ShowManagerSettingProfiles(request, response);
        }
    }
}
