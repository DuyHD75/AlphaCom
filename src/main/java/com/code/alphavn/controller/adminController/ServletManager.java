package com.code.alphavn.controller.adminController;

import com.code.alphavn.model.adminModel.Admin;
import com.code.alphavn.model.adminModel.Manager;
import com.code.alphavn.service.adminService.AdminServiceImpl;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;

@WebServlet(name = "ServletManager", value = "/manager")
public class ServletManager extends HttpServlet {
    private AdminServiceImpl adminService;

    @Override
    public void init() throws ServletException {
        super.init();
        adminService = new AdminServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "managerOverview":
                    ShowManagerOverview(req, resp);
                    break;
                case "DeleteMana":
                    DeleteManager(req, resp);
                    break;
                case "managerAdd":
                    ShowManagerAdd(req, resp);
                    break;
                default:
                    AddManager(req, resp);
                    break;

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String formType = req.getParameter("formType");

        try {
            switch (formType) {
                case "form1":
                    EditInfoManager(req, resp);

                    break;
                case "form2":
                    EditPassManager(req, resp);

                    break;
                case "form3":
                    DeleteManager(req, resp);
                    break;
                case "form4":
                    AddManager(req, resp);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void ShowManagerAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {


        request.getRequestDispatcher("/components/adminComponents/addManager.jsp").forward(request, response);

    }

    public void ShowManagerOverview(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {


        request.setAttribute("totalMan", adminService.getTotalMan());
        request.setAttribute("managers", adminService.getManager());


        request.getRequestDispatcher("/components/adminComponents/manager.jsp").forward(request, response);
    }

    //    public void ShowManagerAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
//               request.getRequestDispatcher("/components/adminComponents/addManager.jsp").forward(request, response);
//    }
    public void DeleteManager(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        // cho ni get ID
        String id = request.getParameter("id"); // id cua mana
        System.out.println(id);

        if (adminService.deleteManagerById(Integer.parseInt(id))) {
            request.setAttribute("message", "Delete success");
        } else {
            request.setAttribute("message", "Delete Failed");
        }

        ShowManagerOverview(request, response);


    }

    public void AddManager(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        Admin admin= (Admin) session.getAttribute("acc");
        String email = request.getParameter("email");
        System.out.println(email);
        Manager account = adminService.getManagerByEmail(email);
        if (account == null) {
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String address = request.getParameter("addressLine");
            String role = request.getParameter("roleSelect");

            if (adminService.AddMana(new Manager(admin.getId(),name, email, phone, address, role))) {
                request.setAttribute("message", "Add success");
                // Get the session object
                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.socketFactory.port", "465");
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.port", "465");
                Session session1 = Session.getDefaultInstance(props, new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("hdat1502@gmail.com", "ootkbvbsapgibuas");
                        // Put your email

                        // id and
                        // password here
                    }
                });
                // compose message
                try {
                    MimeMessage message = new MimeMessage(session1);
                    message.setFrom(new InternetAddress("hdat1502@gmail.com"));// change accordingly
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
                    message.setSubject("Welcome");
                    message.setText("Welcome to our web \nYour username is: "+email+"\nYour password is: 12345678 " );
                    // send message
                    Transport.send(message);
                } catch (MessagingException e) {
                    throw new RuntimeException(e);
                }
                ShowManagerOverview(request, response);
            } else {
                ShowManagerAdd(request, response);
            }
        } else {
            ShowManagerAdd(request, response);
        }

    }

    public void EditInfoManager(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
//        String email = request.getParameter("email");
        String emailNew = request.getParameter("editEmailModal");
        System.out.println(emailNew);
        Manager account = adminService.getManagerByEmail(emailNew);
        if (account != null) {
            String name = request.getParameter("editNameModal");
            String address = request.getParameter("editAddressLineModal");
            String phone = request.getParameter("phone");
            String role = request.getParameter("roleSelect");
            Manager manager = new Manager(name, emailNew, phone, address, role);
            //adminService.updateInfoMana(manager);

            if (adminService.updateInfoMana(manager)) {
                request.setAttribute("message", "Edit success");
            } else {
                request.setAttribute("message", "Edit Failed");
            }
            ShowManagerOverview(request, response);
        }

    }

    public void EditPassManager(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String emailNew = request.getParameter("email");
        System.out.println(emailNew);
        Manager account = adminService.getManagerByEmail(emailNew);
        System.out.println(account);
        if (account != null) {
            String crpass = request.getParameter("currentPassword");
            String newPassword = request.getParameter("editUserModalNewPassword");
            if (crpass.equals(account.getPass())) {
                Manager manager = new Manager((newPassword), emailNew);
                System.out.println("lenin");
                if (adminService.updatePassMana(manager)) {
                    request.setAttribute("message", "Edit Success");
                } else {
                    request.setAttribute("message", "Edit Failed");
                }
                request.setAttribute("show", "show");
                ShowManagerOverview(request, response);
            } else {
                request.setAttribute("message", "Your current password is wrong");
                ShowManagerOverview(request, response);

            }

        }

    }
}
