package com.code.alphavn.service.adminService;

import com.code.alphavn.connection.ConnectionDB;
import com.code.alphavn.model.*;
import com.code.alphavn.model.adminModel.Admin;
import com.code.alphavn.model.adminModel.Manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class AdminServiceImpl implements IAdminService {
    private static final Connection con = ConnectionDB.getConnection();

    private boolean cacheValid;
    private List<Order> orders;

    public AdminServiceImpl() {
        cacheValid = false;
    }

    // get DB của admin
    public Order getTotalOrder() throws SQLException {
        Order order = null;
        PreparedStatement pstm = con.prepareStatement("SELECT  COUNT(*) AS total FROM orders");
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            order = new Order(rs.getInt("total")
            );
        }
        return order;
    }
    public Order getTotalPriceOrder() throws SQLException {
        Order order = null;
        PreparedStatement pstm = con.prepareStatement("SELECT  AVG(final_price) AS total FROM orderDetails");
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            order = new Order(rs.getInt("total"));
        }
        return order;
    }

    public List<Customer> getCustomers() throws SQLException {
        PreparedStatement pstm = con.prepareStatement("select * from customers;");
        List<Customer> customers = new ArrayList<>();

        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            customers.add(new Customer(rs.getInt("customer_id"),
                    rs.getString("name"),
                    rs.getString("password"),
                    rs.getString("address"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getDate("created_At")));
        }
        return customers;
    }

    public Customer getTotalCus() throws SQLException {
        Customer customer = null;
        PreparedStatement pstm = con.prepareStatement("SELECT  COUNT(*) AS total FROM customers");
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            customer = new Customer(rs.getDouble("total")
            );
        }
        return customer;
    }

    public Manager getTotalMan() throws SQLException {
        Manager manager = null;
        PreparedStatement pstm = con.prepareStatement("SELECT  COUNT(*) AS total FROM managers");
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            manager = new Manager(rs.getInt("total")
            );
        }
        return manager;
    }

    public List<Manager> getManager() throws SQLException {
        PreparedStatement pstm = con.prepareStatement("select * from managers;");
        List<Manager> managers = new ArrayList<>();

        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            managers.add(new Manager(rs.getInt("manager_id"),
                    rs.getInt("admin_id"),
                    rs.getString("name"),
                    rs.getString("password"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getString("address"),
                    rs.getDate("created_At"),
                    rs.getString("role")));
        }
        return managers;
    }
    public ProductReview getProductRatingReviews() throws SQLException {
        String query = "SELECT AVG(rating) as avgrating,\n" +
                "       COUNT(CASE WHEN rating = 1 THEN 1 ELSE NULL END) AS rating_1,\n" +
                "       COUNT(CASE WHEN rating = 2 THEN 1 ELSE NULL END) AS rating_2,\n" +
                "       COUNT(CASE WHEN rating = 3 THEN 1 ELSE NULL END) AS rating_3,\n" +
                "       COUNT(CASE WHEN rating = 4 THEN 1 ELSE NULL END) AS rating_4,\n" +
                "       COUNT(CASE WHEN rating = 5 THEN 1 ELSE NULL END) AS rating_5\n" +
                "FROM productReivews\n" ;
        PreparedStatement pstmt = con.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        ProductReview productReviews = null;
        while (rs.next()) {
            productReviews = new ProductReview(rs.getFloat("avgrating"),
                    rs.getInt("rating_1"),
                    rs.getInt("rating_2"),
                    rs.getInt("rating_3"),
                    rs.getInt("rating_4"),
                    rs.getInt("rating_5")
            );
        }
        return productReviews;
    }
    public List<ProductReview> getProductReviews() throws SQLException {

        String query = "SELECT  pr.id, c.name as cus_name, c.email as email1, pd.img1 as img, p.product_name as product_name1 , pr.comment ,  pr.rating ,  pr.create_at\n" +
                "  FROM productReivews pr JOIN customers c ON pr.customer_id = c.customer_id\n" +
                "JOIN productDetails pd On pr.product_id=pd.product_id\n" +
                "Join products p on pr.product_id=p.pid";
        PreparedStatement pstm = con.prepareStatement(query);
        ResultSet rs = pstm.executeQuery();

        List<ProductReview> productReviews = new ArrayList<>();
        while (rs.next()) {
            productReviews.add(new ProductReview(
                    rs.getInt("id"),
                    rs.getString("cus_name"),
                    rs.getInt("rating"),
                    rs.getString("comment"),
                    rs.getDate("create_at"),
                    rs.getString("email1"),
                    rs.getString("img"),
                    rs.getString("product_name1")

            ));
        }
        return productReviews;
    }
    public boolean deleteReviewById(int id) throws SQLException {
        try {
            PreparedStatement pst = con.prepareStatement("DELETE FROM productReivews where id = ? ");
            pst.setInt(1, id);
            pst.executeUpdate();
        } catch (Exception e) {
            return false;
        }
        return true;

    }
    public Manager getManagerByEmail(String email) {
        String query = "select * from managers where email = ?";
        try {
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setString(1, email);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                return new Manager(rs.getInt("manager_id"),
                        rs.getInt("admin_id"),
                        rs.getString("name"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getDate("created_At")


                );
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public boolean updateInfoMana(Manager manager) {
        String query = "update managers set name=? , phone=?, address=?, roles=?\n" +
                "  where email = ?";
        try {
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setString(1, manager.getName().trim());
            pstm.setString(2, manager.getPhone().trim());
            pstm.setString(3, manager.getAddress().trim());
            pstm.setString(4,manager.getRole().trim());
            pstm.setString(5, manager.getEmail().trim());
            pstm.executeUpdate();
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public String getBase64Encoded(String input) {
        return Base64.getEncoder().encodeToString(input.getBytes());
    }

    public boolean updatePassMana(Manager manager) throws SQLException {
        try {
            PreparedStatement pst = con.prepareStatement("update managers set password = ? where email = ? ");
            pst.setString(1, manager.getPass());
            pst.setString(2, manager.getEmail());
            pst.executeUpdate();
        } catch (Exception e) {
            return false;
        }
        return true;

    }

    public boolean deleteManagerById(int id) throws SQLException {
        try {
            PreparedStatement pst = con.prepareStatement("DELETE FROM managers where manager_id = ? ");
            pst.setInt(1, id);
            pst.executeUpdate();
        } catch (Exception e) {
            return false;
        }
        return true;

    }

    public boolean AddMana(Manager manager) {
        String query = "insert into managers (name, email, phone, address,role , created_At)" +
                " values(?, ?, ?, ?, ?, GETDATE());";
        try {
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setString(1, manager.getName());
            pstm.setString(2, manager.getEmail());
            pstm.setString(3, manager.getPhone());
            pstm.setString(4, manager.getAddress());
            pstm.setString(5, manager.getRole());
            pstm.executeUpdate();
        } catch (SQLException e) {
            return false;
        }
        return true;
    }
    public List<Order> getAllOrder() {
        orders = new ArrayList<>();

        String query = "SELECT * FROM orders";
        try {
            PreparedStatement pstm = con.prepareStatement(query);
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                orders.add(new Order(
                        rs.getInt("order_id"),
                        rs.getInt("customer_id"),
                        rs.getString("orderDate"),
                        rs.getString("status"),
                        rs.getString("payMethod")

                ));
            }

        } catch (Exception e) {
        }
        return orders;
    }


    public List<Order> filterOrderBySatus(String status) {
        orders= getAllOrder();
        List<Order> filterOrders = new ArrayList<>();

        filterOrders =orders.stream().filter(
                order -> order.getStatus().equalsIgnoreCase(status)
        ).collect(Collectors.toList()); // Pending , Shipping , Completed , Cancel
        return filterOrders;
    }

}
