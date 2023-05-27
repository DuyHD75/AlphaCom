package com.code.alphavn.service;




import com.code.alphavn.connection.ConnectionDB;
import com.code.alphavn.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public class UserServiceImpl implements IUserService {

    private static final Connection con = ConnectionDB.getConnection();

    private static List<ProductInfo> products;

    private static List<ProductDiscount> productDiscounts;

    private static List<ProductReview> productReviews;

    // ================= GETTER & SETTER =========================
    public static void setProducts(List<ProductInfo> products) {
        UserServiceImpl.products = products;
    }

    public static List<ProductDiscount> getProductDiscounts() {
        return productDiscounts;
    }

    public static void setProductDiscounts(List<ProductDiscount> productDiscounts) {
        UserServiceImpl.productDiscounts = productDiscounts;
    }

    public static List<ProductReview> getProductReviews() {
        return productReviews;
    }

    public static void setProductReviews(List<ProductReview> productReviews) {
        UserServiceImpl.productReviews = productReviews;
    }

    // ================= GETTER & SETTER =========================
    //    ma hoa password
    public String getBase64Encoded(String input) {
        return Base64.getEncoder().encodeToString(input.getBytes());
    }

    //    giai ma password
    public String getBase64Decoded(String encoded) {
        byte[] decodedBytes = Base64.getDecoder().decode(encoded);
        return new String(decodedBytes);
    }

    public List<ProductInfo> getProducts() throws SQLException {
        PreparedStatement pstm = con.prepareStatement("SELECT p.pid, p.product_name, p.product_desc, p.amount_remaining,\n" +
                "pd.price, pd.img1, pd.img2, pd.img3,\n" +
                "c.category_name \n" +
                "FROM products p \n" +
                "JOIN productDetails pd ON p.pid = pd.product_id\n" +
                "JOIN categorys c ON p.category_id = c.category_id\n");
        ResultSet rs = pstm.executeQuery();
        return convertResultSetToList(rs);
    }

    public List<ProductInfo> getProductByCategory(String category) throws SQLException {
        PreparedStatement pstm = con.prepareStatement("SELECT p.pid, p.product_name, p.product_desc, p.amount_remaining, pd.price, pd.img1, pd.img2, pd.img3,c.category_name\n" +
                "FROM products p\n" +
                "JOIN categorys c ON p.category_id = c.category_id\n" +
                "JOIN productDetails pd ON p.pid = pd.product_id\n" +
                "WHERE c.category_name = ?;");
        pstm.setString(1, category);

        ResultSet rs = pstm.executeQuery();
        return convertResultSetToList(rs);
    }

    public ProductInfo getProductByID(int id) throws SQLException {
        PreparedStatement pstm = con.prepareStatement("SELECT p.pid, p.product_name, p.product_desc, p.amount_remaining, pd.price, pd.img1, pd.img2, pd.img3,c.category_name\n" +
                "FROM products p\n" +
                "JOIN categorys c ON p.category_id = c.category_id\n" +
                "JOIN productDetails pd ON p.pid = pd.product_id\n" +
                "where p.pid = ?;");
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        ProductInfo productInfo = null;
        while (rs.next()) {
            Product product = new Product(
                    Integer.parseInt(rs.getString("pid")),
                    rs.getString("product_name"),
                    rs.getString("product_desc"),
                    rs.getInt("amount_remaining"),
                    rs.getString("category_name")
            );

            productInfo = new ProductInfo(product,
                    Double.parseDouble(rs.getString("price")),
                    rs.getString("img1"),
                    rs.getString("img2"),
                    rs.getString("img3")
            );
        }
        return productInfo;
    }


    public List<ProductReview> getProductReviews(int pid) throws SQLException {
        PreparedStatement pstm = con.prepareStatement("SELECT  pr.id, c.name AS CustomerName, pr.comment AS Review,  pr.rating ,  pr.create_at\n" +
                "FROM productReivews pr\n" +
                "JOIN customers c ON pr.customer_id = c.customer_id\n" +
                "WHERE pr.product_id = ?;");

        pstm.setInt(1, pid);
        ResultSet rs = pstm.executeQuery();
        productReviews = new ArrayList<>();
        while (rs.next()) {
            productReviews.add(new ProductReview(rs.getInt("id"),
                    rs.getString("CustomerName"),
                    rs.getInt("rating"),
                    rs.getString("Review"),
                    rs.getDate("create_at")
            ));
        }
        return productReviews;
    }


    public List<ProductInfo> convertResultSetToList(ResultSet rs) throws SQLException {
        products = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product(
                    Integer.parseInt(rs.getString("pid")),
                    rs.getString("product_name"),
                    rs.getString("product_desc"),
                    rs.getInt("amount_remaining"),
                    rs.getString("category_name")
            );

            products.add(new ProductInfo(product,
                    Double.parseDouble(rs.getString("price")),
                    rs.getString("img1"),
                    rs.getString("img2"),
                    rs.getString("img3")
            ));
        }
        return products;
    }

    public Customer Login(Customer customer) {
        String query = "select * from customers where email = ? and password =?";
        try {
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setString(1, customer.getEmail());
            pstm.setString(2, customer.getPassword());
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                return new Customer(rs.getInt("customer_id"),
                        rs.getString("name"),
                        rs.getString("password"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getDate("created_At"));
            }

        } catch (SQLException e) {
        }
        return null;
    }

    public Customer CheckAccountExist(Customer customer) {
        String query = "select * from customers where email = ?";
        try {
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setString(1, customer.getEmail());
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                return new Customer(rs.getInt("customer_id"),
                        rs.getString("name"),
                        rs.getString("password"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getDate("created_At"));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void Signup(Customer customer) {
        String query = "insert into customers (name, password, address, email, phone, created_At)" +
                " values(?, ?, '', ?, ?, GETDATE());";
        try {
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setString(1, customer.getName());
            pstm.setString(2, customer.getPassword());
            pstm.setString(3, customer.getEmail());
            pstm.setString(4, customer.getPhone());
            pstm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public Customer getAccountByAccID(Customer customer) {

        String query = "select * from customers where customer_id = ?";
        try {
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setInt(1, customer.getId());
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                return new Customer(rs.getInt("customer_id"),
                        rs.getString("name"),
                        rs.getString("password"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getDate("created_At"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateProfile(Customer customer) {
        String query = "update customers\n" +
                "\tset name = ?, address = ?, email = ?, phone = ?\n" +
                "\twhere customer_id = ?";
        try {
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setString(1, customer.getName());
            pstm.setString(2, customer.getAddress());
            pstm.setString(3, customer.getEmail());
            pstm.setString(4, customer.getPhone());
            pstm.setInt(5, customer.getId());
            pstm.executeUpdate();
        } catch (Exception e) {
        }
    }

}
