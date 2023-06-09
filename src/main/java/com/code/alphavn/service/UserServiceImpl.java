package com.code.alphavn.service;


import com.code.alphavn.connection.ConnectionDB;
import com.code.alphavn.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;


public class UserServiceImpl implements IUserService {

    private static final Connection con = ConnectionDB.getConnection();

    private boolean cacheValid;
    private List<ProductInfo> productInfos;
    private List<ProductDiscount> productDiscounts;

    public UserServiceImpl() {
        cacheValid = false;
    }


    public List<ProductInfo> getProducts() throws SQLException {
        PreparedStatement pstm = con.prepareStatement("SELECT TOP 10 p.pid, p.product_name, p.product_desc, p.amount_remaining,\n" +
                "pd.price, pd.img1, pd.img2, pd.img3,c.category_name\n" +
                "FROM products p \n" +
                "JOIN productDetails pd ON p.pid = pd.product_id\n" +
                "JOIN categorys c ON p.category_id = c.category_id\n" +
                "order by  p.pid desc\n");

        if (!cacheValid || productInfos == null) {
            productInfos = new ArrayList<>();
            ResultSet rs = pstm.executeQuery();
            productInfos = convertResultSetToList(rs);
            cacheValid = true;
        }
        return productInfos;
    }

    public List<ProductInfo> getProductByCategory(String category) throws SQLException {
        PreparedStatement pstm = con.prepareStatement("SELECT p.pid, p.product_name, p.product_desc, p.amount_remaining," +
                " pd.price, pd.img1, pd.img2, pd.img3,c.category_name\n" +
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


    public void addProduct(ProductInfo productInfo) {

        cacheValid = false;
    }

    public List<ProductDiscount> getProductDiscounts() throws SQLException {
        PreparedStatement pstm = con.prepareStatement("select * from productDiscount;");

        if (!cacheValid || productDiscounts == null) {
            productDiscounts = new ArrayList<>();
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                productDiscounts.add(new ProductDiscount(
                        rs.getInt("discount_id"),
                        rs.getInt("product_id"),
                        rs.getString("discount_name"),
                        rs.getDouble("discount_amount"),
                        rs.getDate("start_date"),
                        rs.getDate("end_date")
                ));
            }
            cacheValid = true;
        }
        return productDiscounts;
    }


    public List<ProductReview> getProductReviews(int pid) throws SQLException {
        PreparedStatement pstm = con.prepareStatement("SELECT  pr.id, c.name, pr.comment ,  pr.rating ,  pr.create_at\n" +
                "FROM productReivews pr\n" +
                "JOIN customers c ON pr.customer_id = c.customer_id\n" +
                "WHERE pr.product_id = ?;");

        pstm.setInt(1, pid);
        ResultSet rs = pstm.executeQuery();
        List<ProductReview> productReviews = new ArrayList<>();
        while (rs.next()) {
            productReviews.add(new ProductReview(rs.getInt("id"),
                    rs.getString("name"),
                    rs.getInt("rating"),
                    rs.getString("comment"),
                    rs.getDate("create_at")
            ));
        }
        return productReviews;
    }


    public List<ProductInfo> convertResultSetToList(ResultSet rs) throws SQLException {
        List<ProductInfo> products = new ArrayList<>();


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


//    =================================== Authentication =============================================

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

    public Customer getCustomerByEmail(String email) {
        String query = "select * from customers where email = ?";
        try {
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setString(1, email);
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


    // ================= Encrypt password
    public String getBase64Encoded(String input) {
        return Base64.getEncoder().encodeToString(input.getBytes());
    }

    public String getBase64Decoded(String encoded) {
        byte[] decodedBytes = Base64.getDecoder().decode(encoded);
        return new String(decodedBytes);
    }
    // ================= Encrypt password

    //Get info to wishList page
    public List<WishListProduct> getWishList(String email) throws SQLException {
        //Get ID from email
        int id = 0;
        PreparedStatement pstm0 = con.prepareStatement(" select customer_id from customers where email = ?");
        pstm0.setString(1, email);
        ResultSet rs0 = pstm0.executeQuery();
        while (rs0.next()) {
            id = rs0.getInt(1);
        }

        //get data
        PreparedStatement pstm = con.prepareStatement("SELECT wl.product_id, pr.product_name, pd.price, pd.img1  FROM wishlist wl \n" +
                "INNER JOIN products pr ON wl.product_id = pr.pid \n" +
                "INNER JOIN productDetails pd ON pd.product_id = pr.pid WHERE wl.customer_id =?");
        //for calculate rating
        PreparedStatement pstm1 = con.prepareStatement("SELECT AVG(rating) FROM productReivews where product_id=?");
        int rating = 0;
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        List<WishListProduct> wishListProduct = new ArrayList<>();
        while (rs.next()) {
            pstm1.setInt(1, rs.getInt("product_id"));
            ResultSet rs1 = pstm1.executeQuery();
            while (rs1.next()){
                rating = rs1.getInt(1);
            }
            wishListProduct.add(new WishListProduct(rs.getInt("product_id"),
                    rs.getString("product_name"),
                    rs.getDouble("price"),
                    rs.getString("img1"),
                    rating
            ));
        }

        pstm.close();
        pstm1.close();
        pstm0.close();
        return wishListProduct;
    }
    //delete from wishList
    public void deleteWishList (int product_id, int customer_id) throws SQLException {
        PreparedStatement preparedStatement = con.prepareStatement("delete from wishList where customer_id = ? and product_id = ?");
        preparedStatement.setInt(1,customer_id);
        preparedStatement.setInt(2,product_id);
        preparedStatement.executeUpdate();

    }
    //add to wishList
    public void addWishList (int product_id, int customer_id) throws SQLException {
        PreparedStatement preparedStatement = con.prepareStatement("insert into wishList values (?,?)");
        preparedStatement.setInt(1,customer_id);
        preparedStatement.setInt(2,product_id);
        preparedStatement.executeUpdate();
        preparedStatement.close();

    }
    public static void main(String[] args) throws SQLException {
        UserServiceImpl userService = new UserServiceImpl();
        System.out.println(userService.getProductDiscounts());
    }


}
