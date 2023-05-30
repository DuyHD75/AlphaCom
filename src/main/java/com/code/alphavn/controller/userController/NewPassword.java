package com.code.alphavn.controller.userController;


import com.code.alphavn.connection.ConnectionDB;
import com.code.alphavn.service.UserServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("flag");
		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		RequestDispatcher dispatcher = null;
		UserServiceImpl userService = new UserServiceImpl();
		if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

			try {

				ConnectionDB connectionDB = new ConnectionDB();
				Connection con = connectionDB.getConnection();
				String encodedpass= userService.getBase64Encoded(newPassword);

				PreparedStatement pst = con.prepareStatement("update customers set password = ? where email = ? ");
				pst.setString(1, encodedpass);
				pst.setString(2, (String) session.getAttribute("email"));

				int rowCount = pst.executeUpdate();
				if (rowCount > 0) {
//					request.setAttribute("status", "resetSuccess");
					dispatcher = request.getRequestDispatcher("./loginCustomer");
					System.out.println("success");
				} else {
					request.setAttribute("hide", "hide");
					request.setAttribute("show1", "show");
					dispatcher = request.getRequestDispatcher("/components/userComponents/forgotPassword.jsp");
					System.out.println("failed");

				}
				dispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("hide", "hide");
		request.setAttribute("show1", "show");
		request.getRequestDispatcher("/components/userComponents/forgotPassword.jsp").forward(request, response);
	}
}
