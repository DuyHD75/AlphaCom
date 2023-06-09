package com.code.alphavn.service;


import com.code.alphavn.connection.ConnectionDB;
import com.code.alphavn.model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
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

    public Customer getAccountByCusID(Customer customer) {

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

    //=================================== CART =========================================================

    public List<Cart> getCartByCusID(int customerId) {
        List<Cart> list = new ArrayList<>();
        String query = "select cus.customer_id, p.pid, p.product_name, pd.img1, pd.price, c.quantity, pdis.discount_amount, pdis.start_date, pdis.end_date\n" +
                "from carts c, products p, customers cus, productDetails pd left join productDiscount pdis on pd.product_id = pdis.product_id\n" +
                "where c.customer_id = cus.customer_id and c.product_id = p.pid and p.pid = pd.product_id and c.customer_id = ?";
        try {
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setInt(1, customerId);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                list.add( new Cart(
                        rs.getInt("customer_id"),
                        getProductByID(rs.getInt("pid")),
                        rs.getInt("quantity"),
                        rs.getInt("price"),
                        getProductDiscounts()
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Cart CheckCartExist(int productId, int customerId) {
        String query = "select cus.customer_id, p.pid, p.product_name, pd.img1, pd.price, c.quantity, pdis.discount_amount, pdis.start_date, pdis.end_date\n" +
                "from carts c, products p, customers cus, productDetails pd left join productDiscount pdis on pd.product_id = pdis.product_id\n" +
                "where c.customer_id = cus.customer_id and c.product_id = p.pid and p.pid = pd.product_id and c.customer_id = ? and p.pid = ?";
        try {
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setInt(2, productId);
            pstm.setInt(1, customerId);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                return new Cart(
                        rs.getInt("customer_id"),
                        getProductByID(rs.getInt("pid")),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        getProductDiscounts()
                );
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void InsertCart(int customerId, int productId, int amount) {
        String query = "insert into carts \n" +
                "values (?, ?, ?)";
        try {
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setInt(1, customerId);
            pstm.setInt(2, productId);
            pstm.setInt(3, amount);
            pstm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void UpdateAmountCart(int customerId, int productId, int amount) {
        String query = "update carts\n" +
                "set quantity = ?\n" +
                "where product_id = ? and customer_id = ?";
        try {
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setInt(1, amount);
            pstm.setInt(2, productId);
            pstm.setInt(3, customerId);
            pstm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void DeleteFromCart(int customerId, int productId) {
        String query = "delete from carts\n" +
                "where customer_id = ? and product_id = ?";
        try {
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setInt(1, customerId);
            pstm.setInt(2, productId);
            pstm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void DeleteCartByCusID(int customerId) {
        String query = "delete from carts\n"
                + "where customer_id = ?";
        try {
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setInt(1, customerId);
            pstm.executeUpdate();
        } catch (Exception e) {
        }
    }

//    =============================================ORDER===========================================================
    public void InsertOrderDetails(List<Cart> carts, int oid) throws SQLException {
        String query = "insert into orderDetails values(?, ? , ? , ? );";

        try {
            PreparedStatement pstm = con.prepareStatement(query);
            for (Cart cart : carts) {
                pstm.setInt(1, oid);
                pstm.setInt(2, cart.getProductInfo().getProduct().getId());
                pstm.setDouble(3, cart.getProductInfo().getPrice());
                pstm.setInt(4, cart.getAmount());
                pstm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void InsertPlaceOrder(Customer customer, List<Cart> carts, String payMethod) throws SQLException {
        String query = "insert into orders (customer_id, orderDate, payMethod)  values(? , GETDATE() , ? );";
        try {
            PreparedStatement pstm = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            pstm.setInt(1, customer.getId());
            pstm.setString(2, payMethod);
            pstm.executeUpdate();
            ResultSet generatedKeys = pstm.getGeneratedKeys();
            int orderId = 0;
            if (generatedKeys.next()) {
                orderId = generatedKeys.getInt(1);
            }
            InsertOrderDetails(carts, orderId);

        } catch (Exception e) {
        }
    }

    public List<OrderDetail> getOrderDetailByOID(int order_id) throws SQLException {
        List<OrderDetail> ods = new ArrayList<>();
        String query = "select * from orderDetails where order_id = ?;";
        try {
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setInt(1, order_id);

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                ods.add(new OrderDetail(order_id,
                        getProductByID(rs.getInt("product_id")),
                        rs.getDouble("final_price"),
                        rs.getInt("quantityOrdered")));
            }

        } catch (Exception e) {
        }
        return ods;
    }

    public List<Order> getOrderByCusId(Customer customer) {
        List<Order> orders = new ArrayList<>();
        Customer cusId = new Customer(customer.getId());
        String query = "SELECT * FROM orders where customer_id = ? ;";
        try {
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setInt(1, customer.getId());
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                orders.add(new Order(
                    rs.getInt("order_id"),
                    getAccountByCusID(cusId),
                    rs.getString("orderDate"),
                    rs.getString("status"),
                    rs.getString("payMethod"),
                    getOrderDetailByOID(rs.getInt("order_id"))
                ));
            }

        } catch (Exception e) {
        }
        return orders;
    }

    public Order getOrderByOrderId(int orderId, Customer customer) {
        Customer cusId = new Customer(customer.getId());
        String query = "SELECT * FROM orders where order_id = ? ;";
        try {
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setInt(1, orderId);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                return new Order(
                    rs.getInt("order_id"),
                    getAccountByCusID(cusId),
                    rs.getString("orderDate"),
                    rs.getString("status"),
                    rs.getString("payMethod"),
                    getOrderDetailByOID(rs.getInt("order_id"))
                );
            }

        } catch (Exception e) {
        }
        return null;
    }

    public void CancelOrder(int orderId) {
        String query = "update orders\n" +
                "set status = 'Cancel'\n" +
                "where order_id = ?";
        try {
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setInt(1, orderId);
            pstm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void DeleteOrder(int orderId) {
        String query = "delete from orders \n" +
                "where order_id = ?";
        try {
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setInt(1, orderId);
            pstm.executeUpdate();
        } catch (SQLException e) {
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
        ProductInfo productInfo = userService.getProductByID(2);
        System.out.println(productInfo.getProduct().getAmount_remaining());
        System.out.println(userService.getCartByCusID(1));
    }


}
