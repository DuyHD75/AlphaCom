package com.code.alphavn.service;




import com.code.alphavn.connection.ConnectionDB;
import com.code.alphavn.model.*;

import java.sql.*;
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

//    public static List<ProductDiscount> getProductDiscounts() {
//        return productDiscounts;
//    }

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

    private boolean cacheValid;

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
        UserServiceImpl userService = new UserServiceImpl();
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
                        rs.getDouble("price"),
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
            pstm.setInt(1, productId);
            pstm.setInt(2, customerId);
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

    public static void main(String[] args) throws SQLException {
        UserServiceImpl userService = new UserServiceImpl();
        List<Cart> liss = userService.getCartByCusID(1);
        System.out.println(liss);
        System.out.println(userService.getBase64Decoded("bmdoaWExOTA1"));
        Customer customer = new Customer(1);
        List<Order> orders = userService.getOrderByCusId(customer);
        System.out.println(orders);
        List<ProductDiscount> productDiscounts = userService.getProductDiscounts();
        System.out.println(productDiscounts);
    }

}
