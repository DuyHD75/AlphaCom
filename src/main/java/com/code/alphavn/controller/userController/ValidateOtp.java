package com.code.alphavn.controller.userController;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class ValidateOtp
 */
@WebServlet("/ValidateOtp")
public class ValidateOtp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int value=Integer.parseInt(request.getParameter("otp"));
		HttpSession session=request.getSession();
		int otp=(int)session.getAttribute("otp");
		
		RequestDispatcher dispatcher=null;
		
		
		if (value==otp) 
		{
			request.setAttribute("email", request.getParameter("email"));
			request.setAttribute("status", "success");
			request.setAttribute("hide", "hide");
			request.setAttribute("show1", "show");
			dispatcher = request.getRequestDispatcher("/components/userComponents/forgotPassword.jsp");
			dispatcher.forward(request, response);
		}
		else
		{
			request.setAttribute("message","Wrong OTP");
			request.setAttribute("hide", "hide");
			request.setAttribute("show", "show");
			dispatcher = request.getRequestDispatcher("/components/userComponents/forgotPassword.jsp");
			dispatcher.forward(request, response);
		}
		
	}
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
			request.setAttribute("hide", "hide");
			request.setAttribute("show", "show");
			request.getRequestDispatcher("/components/userComponents/forgotPassword.jsp").forward(request, response);
    }

}
