package com.code.alphavn.connection;

import java.sql.*;

public class ConnectionDB {

    public static Connection getConnection() {
        Connection connection = null;

        String DB_USER = "sa";
        String DB_PASS = "123123";

        String SERVER_NAME = "DESKTOP-SAVDU8T\\SQLEXPRESS";

        String DB_NAME = "DHDElectro";

        String DB_URL = "jdbc:sqlserver://" + SERVER_NAME + ";databaseName=" + DB_NAME + ";encrypt=false;"
                + "trustServerCertificate=false;loginTimeout=30";

        try {
            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return connection;
    }

    public static void main(String[] args) throws SQLException {
        Connection con = getConnection();
        PreparedStatement pstm = con.prepareStatement("select * from admins;");
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            System.out.println("ID: " + rs.getInt(1) + " "
                    + "Name: " + rs.getString(2)
                    + "Email: " + rs.getString(3)
                    + "Password: " + rs.getString(4)

            );
        }
    }
}
