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

@WebServlet(name = "ServletManageReviews", value = "/manageReviews")

public class ServletManageReviews extends HttpServlet {
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
                case "reviews":
                    ShowManageReviews(req, resp);
                                    break;
                case "DeleteReview":
                    DeleteReview(req, resp);
                    break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    public void ShowManageReviews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        Admin account = (Admin) session.getAttribute("acc");
        if (account != null) {
            request.setAttribute("reviews", adminService.getProductReviews());
            request.setAttribute("productRatings",adminService.getProductRatingReviews());
            request.getRequestDispatcher("/components/adminComponents/manageReviews.jsp").forward(request, response);
            System.out.println(adminService.getProductReviews());
        } else {
            response.sendRedirect("loginCustomer");
        }
    }
    public void DeleteReview(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        Admin account = (Admin) session.getAttribute("acc");
        if (account != null) {
            String id= (request.getParameter("id"));
            System.out.println(id);

            adminService.deleteReviewById(Integer.parseInt(id));
            ShowManageReviews(request, response);
        } else {
            response.sendRedirect("loginCustomer");
        }
    }

}
