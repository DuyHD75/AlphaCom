package com.code.alphavn.controller.userController;

import com.code.alphavn.connection.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
        String code = request.getParameter("code");
        //System.out.println(code);
        String accessToken = getTokenAndUserInf.getToken(code);
        UserGoogleDto user = getTokenAndUserInf.getUserInfo(accessToken);
        //System.out.println(user);
        boolean regis = false;
        try {


            // Initialize the database
            java.sql.Connection con = ConnectionDB.getConnection();
            PreparedStatement pstm = con.prepareStatement("select email from customers;");
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (user.getEmail().equals(rs.getString(1))) {
                    regis = true;
                    //response.sendRedirect("components/userComponents/home.jsp");
                    response.sendRedirect("home");
                    break;
                    //System.out.println(rs.getString(1));
                }

//                System.out.println("ID: " + rs.getInt(1) + " "
//                        + "Name: " + rs.getString(2)
//                        + "Email: " + rs.getString(3)
//                        + "Password: " + rs.getString(4)

//                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (regis == false) {


            try {

                // Initialize the database
                java.sql.Connection con = ConnectionDB.getConnection();

                // Create a SQL query to insert data into demo table
                // demo table consists of two columns, so two '?' is used
                PreparedStatement st = con
                        .prepareStatement("INSERT INTO customers\n" +
                                "	(name, password, address, email, phone)\n" +
                                "VALUES (?,?,?,?,?)");

                // For the first parameter,
                // get the data using request object
                // sets the data to st pointer
                st.setString(1, user.getName());

                // Same for second parameter
                st.setString(2, null);
                st.setString(3, null);
                st.setString(4, user.getEmail());
                st.setString(5, null);
                //st.setDate(6  , GETDATE());
                // Execute the insert command using executeUpdate()
                // to make changes in database
                st.executeUpdate();

                // Close all the connections
                st.close();
                con.close();
//                response.sendRedirect("components/userComponents/home.jsp"); test
                response.sendRedirect("home");
                // Get a writer pointer
                // to display the successful result
//            PrintWriter out = response.getWriter();
//            out.println("<html><body><b>Successfully Inserted"
//                        + "</b></body></html>");
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