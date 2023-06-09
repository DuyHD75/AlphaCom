package com.code.alphavn.service;


import com.code.alphavn.connection.ConnectionDB;
import com.code.alphavn.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.stream.Collectors;


public class UserServiceImpl implements IUserService {

    private static final Connection con = ConnectionDB.getConnection();

    private boolean cacheValid;
    private List<ProductInfo> productInfos;
    private List<ProductDiscount> productDiscounts;
    private List<ProductReview> productReviews;

    public UserServiceImpl() {
        cacheValid = false;
    }

//    ============================== HANDLE METHODS ================================


    public List<ProductInfo> getAllProducts() throws SQLException {
        String query = "SELECT p.pid, p.product_name, p.product_desc, p.amount_remaining, pd.price, pd.img1, pd.img2, pd.img3,c.category_name " +
                "FROM products p JOIN productDetails pd ON p.pid = pd.product_id JOIN categorys c ON p.category_id = c.category_id";

        PreparedStatement pstm = con.prepareStatement(query);

        if (!cacheValid || productInfos == null) {
            productInfos = new ArrayList<>();
            ResultSet rs = pstm.executeQuery();
            productInfos = convertResultSetToList(rs);
            cacheValid = true;
        }
        return productInfos;
    }

    public List<ProductInfo> getNewProducts() throws SQLException {
        List<ProductInfo> newProducts = new ArrayList<>();
        if (productInfos == null) {
            productInfos = getAllProducts();
        }
        newProducts = productInfos.subList(productInfos.size() - 10, productInfos.size());
        return newProducts;
    }

    public List<ProductInfo> getProductByCategory(String category) throws SQLException {
        List<ProductInfo> categoryProducts = new ArrayList<>();

        if (productInfos == null) {
            productInfos = getAllProducts();
        }
        categoryProducts = productInfos.stream()
                .filter(product -> product.getProduct().getCategory().equalsIgnoreCase(category))
                .collect(Collectors.toList());
        ;
        return categoryProducts;
    }

    public List<ProductInfo> getProductInRangePrice(int minPrice, int maxPrice, String category) throws SQLException {
        List<ProductInfo> filterProducts = new ArrayList<>();

        if (category == null || category.equalsIgnoreCase("All")) {
            filterProducts = getAllProducts();
        } else {
            filterProducts = getProductByCategory(category);
        }

        filterProducts = filterProducts.stream()
                .filter(prd -> prd.getPrice() >= minPrice && prd.getPrice() <= maxPrice)
                .collect(Collectors.toList());

        return filterProducts;

    }

    public ProductInfo getProductByID(int id) throws SQLException {
        ProductInfo prd = new ProductInfo();
        if (productInfos == null) {
            productInfos = getAllProducts();
        }
        prd = productInfos.stream()
                .filter(product -> product.getProduct().getId() == id)
                .collect(Collectors.toList()).get(0);
        return prd;
    }


    public List<ProductDiscount> getProductDiscounts() throws SQLException {
        String query = "select * from productDiscount;";
        PreparedStatement pstm = con.prepareStatement(query);

        if (!cacheValid || productDiscounts == null) {
            productDiscounts = new ArrayList<>();

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                productDiscounts.add(new ProductDiscount(
                        rs.getInt("id"),
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

    public ProductDiscount getPdDiscountByPID(int id) throws SQLException {
        if (productDiscounts == null) {
            productDiscounts = getProductDiscounts();
        }
        for (ProductDiscount prd : productDiscounts) {
            if (prd.getPid() == id) return prd;
        }
        return null;
    }

    public List<ProductReview> getProductReviews(int pid) throws SQLException {

        String query = "SELECT  pr.id, c.name, pr.comment ,  pr.rating ,  pr.create_at " +
                "FROM productReivews pr JOIN customers c ON pr.customer_id = c.customer_id WHERE pr.product_id = ?;";

        PreparedStatement pstm = con.prepareStatement(query);

        pstm.setInt(1, pid);
        ResultSet rs = pstm.executeQuery();

        productReviews = new ArrayList<>();
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

    public List<Category> getCategories() throws SQLException {
        PreparedStatement pstm = con.prepareStatement("select * from categorys;");
        List<Category> categories = new ArrayList<>();

        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            categories.add(new Category(rs.getInt(1), rs.getString(2)));
        }
        return categories;
    }

    public void addNewProduct(ProductInfo productInfo) {
        cacheValid = false;
    }


    //    =================================== AUTHENTICATION =============================================

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

    public static void main(String[] args) throws SQLException {
        UserServiceImpl userService = new UserServiceImpl();
        System.out.println(userService.getProductDiscounts());
    }


}
