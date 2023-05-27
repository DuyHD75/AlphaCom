package com.code.alphavn.service;




import com.code.alphavn.connection.ConnectionDB;
import com.code.alphavn.model.Product;
import com.code.alphavn.model.ProductDiscount;
import com.code.alphavn.model.ProductInfo;
import com.code.alphavn.model.ProductReview;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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

}
