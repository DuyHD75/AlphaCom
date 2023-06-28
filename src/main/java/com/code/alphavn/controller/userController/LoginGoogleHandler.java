package com.code.alphavn.controller.userController;

import com.code.alphavn.connection.ConnectionDB;
import com.code.alphavn.model.Customer;
import com.code.alphavn.model.UserGoogleDto;
import com.code.alphavn.service.userService.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


@WebServlet(name = "helloServlet", value = "/LoginGoogleHandler")
public class LoginGoogleHandler extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserServiceImpl userService = new UserServiceImpl();
        String code = request.getParameter("code");
        String accessToken = getTokenAndUserInf.getToken(code);
        UserGoogleDto userGoogleDto = getTokenAndUserInf.getUserInfo(accessToken);

        //System.out.println(userGoogleDto);
        boolean regis = false;
        try {

            // Initialize the database
            java.sql.Connection con = ConnectionDB.getConnection();
            PreparedStatement pstm = con.prepareStatement("select email from customers;");
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (userGoogleDto.getEmail().equals(rs.getString(1))) {
                    regis = true;
                    Customer customer = userService.getCustomerByEmail(userGoogleDto.getEmail());
                    if (customer.getStatus().equals("Block")){
                        request.setAttribute("messLogin", "Your account has been blocked");
                        request.getRequestDispatcher("/components/userComponents/login.jsp").forward(request, response);
                    } else {
                        HttpSession session = request.getSession();
                        session.setAttribute("numWish", userService.getWishList(userGoogleDto.getEmail()).size());
                        session.setAttribute("acc", customer);
                        session.setMaxInactiveInterval(108000);

                        response.sendRedirect("home");
                    }
                    break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Check the account did not exist before , create new account and insert into DB (Table name = Customer)

        if (regis == false) { // ni mới cus đúng mana v ad mana vào nữa mà
            try {

                // Initialize the database
                Connection con = ConnectionDB.getConnection();

                PreparedStatement st = con
                        .prepareStatement("INSERT INTO customers\n" +
                                "	(name, password, address, email, phone, created_At, status)\n" +
                                "VALUES (?,?,?,?,?,GETDATE(), 'Active')");

                // For the first parameter,
                // get the data using request object
                // sets the data to st pointer
                st.setString(1, userGoogleDto.getName());

                // Same for second parameter
                st.setString(2, null);
                st.setString(3, null);
                st.setString(4, userGoogleDto.getEmail());
                st.setString(5, null);

                st.executeUpdate();
                st.close();
                con.close();


                HttpSession session = request.getSession();
                session.setAttribute("numWish", userService.getWishList(userGoogleDto.getEmail()).size());
                session.setAttribute("acc", userService.getCustomerByEmail(userGoogleDto.getEmail()));
                session.setMaxInactiveInterval(108000);

                response.sendRedirect("home");

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    public void destroy() {
    }
}