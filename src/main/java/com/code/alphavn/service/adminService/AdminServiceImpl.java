package com.code.alphavn.service.adminService;

import com.code.alphavn.connection.ConnectionDB;
import com.code.alphavn.model.Product;
import com.code.alphavn.model.ProductDiscount;
import com.code.alphavn.model.ProductInfo;
import com.code.alphavn.model.ProductReview;
import com.code.alphavn.model.adminModel.ManageOrder;

import java.sql.*;
import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.*;
import java.util.stream.Collectors;

public class AdminServiceImpl implements IAdminService {
    private boolean cacheValid;
    private List<ProductInfo> productInfos;
    private List<ProductDiscount> productDiscounts;
    private List<ProductReview> productReviews;


    public AdminServiceImpl() {
        this.cacheValid = false;
    }

    // ============================ HANDLE METHOD ===================

    public List<ProductInfo> getAllProducts() throws SQLException {
        String query = "SELECT p.pid, p.product_name, p.product_desc, p.amount_remaining, pd.price, pd.img1, pd.img2, pd.img3,c.category_name " + "FROM products p JOIN productDetails pd ON p.pid = pd.product_id JOIN categorys c ON p.category_id = c.category_id";
        Connection con = ConnectionDB.getConnection();
        PreparedStatement pstm = con.prepareStatement(query);

        if (!cacheValid || productInfos == null) {
            System.out.println("vao cache 1");
            productInfos = new ArrayList<>();
            ResultSet rs = pstm.executeQuery();
            productInfos = convertResultSetToList(rs);
            cacheValid = true;
            con.close();
        }
        return productInfos;
    }

    public ProductInfo getProductByID(int id) throws SQLException {
        ProductInfo prd = new ProductInfo();
        if (productInfos == null) {
            productInfos = getAllProducts();
        }
        prd = productInfos.stream().filter(product -> product.getProduct().getId() == id).collect(Collectors.toList()).get(0);
        return prd;
    }

    public boolean createProduct(ProductInfo productInfo, ProductDiscount productDiscount) throws SQLException {
        String query = "INSERT INTO products  VALUES (? , ? , ? , ? , ? , ? ); ";

        boolean isCreated = true;
        try (Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

            pstm.setString(1, productInfo.getProduct().getName());
            pstm.setString(2, productInfo.getProduct().getDesc());
            pstm.setInt(3, productInfo.getProduct().getAmount_remaining());
            pstm.setInt(4, 1);
            pstm.setInt(5, Integer.parseInt(productInfo.getVendor()));
            pstm.setInt(6, Integer.parseInt(productInfo.getProduct().getCategory()));

            int rowEffect = pstm.executeUpdate();

            if (rowEffect > 0) {
                try (ResultSet generatedKeys = pstm.getGeneratedKeys()) {
                    if (generatedKeys != null && generatedKeys.next()) {
                        int pid = generatedKeys.getInt(1);
                        System.out.println("Product ID: " + pid);
                        // Use the product ID for further processing or storing it as needed
                        isCreated = createProductDetails(productInfo, pid);
                        isCreated = createProductDiscount(productDiscount, pid);
                    }
                }
            }

        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
        }

        cacheValid = false;

        return isCreated;
    }

    public boolean createProductDetails(ProductInfo productInfo, int pid) throws SQLException {
        String query = "INSERT INTO productDetails values (? , ? ,? , ? , ?);";
        try (Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(query);) {
            pstm.setInt(1, pid);
            pstm.setDouble(2, productInfo.getPrice());
            pstm.setString(3, productInfo.getImg1());
            pstm.setString(4, productInfo.getImg2());
            pstm.setString(5, productInfo.getImg3());
            return pstm.executeUpdate() > 0;
        }
    }

    public boolean createProductDiscount(ProductDiscount productDiscount, int pid) throws SQLException {
        String query = "INSERT INTO productDiscount values (? , ? , ? , ?, ?);";
        try (Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(query);) {
            pstm.setInt(1, pid);
            pstm.setString(2, productDiscount.getDis_name());
            pstm.setDouble(3, productDiscount.getDis_amount());
            pstm.setDate(4, (Date) productDiscount.getStart_date());
            pstm.setDate(5, (Date) productDiscount.getEnd_date());
            cacheValid = false;
            return pstm.executeUpdate() > 0;
        }
    }


    // ====================== UPDATE PRODUCT =========================
    public boolean updateProduct(ProductInfo productInfo, ProductDiscount productDiscount) throws SQLException {
        boolean isCreated = false;


        String query = "UPDATE products set product_name = ? , product_desc = ? , amount_remaining= ? , " +
                "manager_id= ? , supplier_id = ? , category_id = ? where pid = ?";
        try (Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(query);) {

            pstm.setString(1, productInfo.getProduct().getName());
            pstm.setString(2, productInfo.getProduct().getDesc());
            pstm.setInt(3, productInfo.getProduct().getAmount_remaining());
            pstm.setInt(4, 1);
            pstm.setInt(5, Integer.parseInt(productInfo.getVendor()));
            pstm.setInt(6, Integer.parseInt(productInfo.getProduct().getCategory()));
            pstm.setInt(7, productInfo.getProduct().getId());
            isCreated = pstm.executeUpdate() > 0;

            isCreated = updateProductDetail(productInfo);
            isCreated = updateProductDiscount(productDiscount);

        }
        return isCreated;
    }


    public boolean updateProductDetail(ProductInfo productInfo) throws SQLException {
        String query = "UPDATE productDetails set price=  ? , img1 = ? ,img2 = ? ,img3 = ? where product_id = ? ;";

        try (Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(query);) {
            pstm.setDouble(1, productInfo.getPrice());
            pstm.setString(2, productInfo.getImg1());
            pstm.setString(3, productInfo.getImg2());
            pstm.setString(4, productInfo.getImg3());
            pstm.setInt(5, productInfo.getProduct().getId());
            return pstm.executeUpdate() > 0;
        }
    }

    public boolean updateProductDiscount(ProductDiscount productDiscount) throws SQLException {
        String query = "UPDATE productDiscount SET discount_name = ? ,discount_amount =  ? ,start_date =  ? , end_date =  ? where  product_id = ?;";

        try (Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(query);) {
            pstm.setString(1, productDiscount.getDis_name());
            pstm.setDouble(2, productDiscount.getDis_amount());
            pstm.setDate(3, (Date) productDiscount.getStart_date());
            pstm.setDate(4, (Date) productDiscount.getEnd_date());
            pstm.setInt(5, productDiscount.getPid());

            return pstm.executeUpdate() > 0;
        }
    }

    // ====================== END UPDATE PRODUCT =========================
    // ====================== DISCOUNT PRODUCT =========================

    public List<ProductDiscount> getProductDiscounts() throws SQLException {
        String query = "select * from productDiscount;";
        try (Connection con = ConnectionDB.getConnection();
             PreparedStatement pstm = con.prepareStatement(query);) {
            if (!cacheValid || productDiscounts == null) {
                productDiscounts = new ArrayList<>();
                System.out.println("vao cache 1");

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
        }
        return filterDiscount(productDiscounts);
    }

    public Optional<ProductDiscount> findDiscountProductById(int pid) throws SQLException {
        LocalDate currentDate = LocalDate.now();

        Optional<ProductDiscount> prdDiscount = getProductDiscounts().stream()
                .filter(productDiscount -> productDiscount.getPid() == pid).findFirst();

        return prdDiscount;
    }

    public List<ProductDiscount> filterDiscount(List<ProductDiscount> productDiscounts) {
        LocalDate currentDate = LocalDate.now();
        productDiscounts = productDiscounts.stream()
                .filter(productDiscount ->
                        convertToLocalDate((Date) productDiscount.getStart_date()).isBefore(currentDate)
                                && convertToLocalDate((Date) productDiscount.getEnd_date()).isAfter(currentDate)
                                || convertToLocalDate((Date) productDiscount.getStart_date()).isEqual(currentDate)
                                || convertToLocalDate((Date) productDiscount.getEnd_date()).isEqual(currentDate)
                ).collect(Collectors.toList());

        return productDiscounts;
    }

    private LocalDate convertToLocalDate(Date date) {
        return date.toLocalDate();
    }


    // ====================== END DISCOUNT PRODUCT =========================

    // ===================== DELETE PRODUCT =============================
    public boolean deleteProduct(int pid) throws SQLException {
        String query = "DELETE FROM products where  pid = ?;";
        try (Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(query);) {
            pstm.setInt(1, pid);
            return pstm.executeUpdate() > 0;
        }
    }

    // ===================== END DELETE PRODUCT =============================


    // =====================  METHOD HANDLE RENDER OVERVIEW PRODUCT =============================

    public List<ManageOrder> manageOrders() throws SQLException {
        String query = "SELECT o.orderDate, COUNT(DISTINCT o.order_id) AS TotalOrders, SUM(od.quantityOrdered) AS TotalQuantity, SUM(od.final_price) AS TotalPrice\n" +
                "FROM orders o JOIN orderDetails od ON o.order_id = od.order_id GROUP BY o.orderDate;\n";

        List<ManageOrder> mangeOrders = new ArrayList<>();
        try (Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(query);) {
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                mangeOrders.add(new ManageOrder(
                        rs.getDate(1),
                        rs.getLong(2),
                        rs.getLong(3),
                        rs.getDouble(4)));
            }
        }
        return mangeOrders;
    }

    public Map<DayOfWeek, ManageOrder> saveOrdersByDayOfWeek() throws SQLException {
        Map<DayOfWeek, ManageOrder> ordersByDayOfWeek = new HashMap<>();

        for (ManageOrder order : manageOrders()) {
            LocalDate orderDate = convertToLocalDate((Date) order.getOrderDate());
            DayOfWeek dayOfWeek = orderDate.getDayOfWeek();

            if (!ordersByDayOfWeek.containsKey(dayOfWeek)) {
                ordersByDayOfWeek.put(dayOfWeek, order);
            }
        }

        return ordersByDayOfWeek;
    }


    public Optional<ManageOrder> getManageOrderInCurrDate() throws SQLException {
        LocalDate currentDate = LocalDate.now();
        Optional<ManageOrder> currManageOrder = manageOrders().stream()
                .filter(mangeOrder -> convertToLocalDate((Date) mangeOrder.getOrderDate()).isEqual(currentDate))
                .findFirst();
        return currManageOrder;
    }

    public Map<ProductInfo, Integer> getTopSellingProduct() throws SQLException {
        String query = "SELECT TOP 10 product_id, SUM(quantityOrdered) AS TotalQuantity FROM orderDetails " +
                "GROUP BY product_id ORDER BY TotalQuantity DESC;";
        Map<ProductInfo, Integer> topSelling = new LinkedHashMap<>();
        try (Connection con = ConnectionDB.getConnection(); PreparedStatement pstm = con.prepareStatement(query);) {
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                topSelling.put(getProductByID(rs.getInt(1)), rs.getInt(2));
            }
        }
        return topSelling;
    }


    // ===================== END METHOD HANDLE RENDER OVERVIEW PRODUCT =============================


    // ======================= DATKD CODE =================================================

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

    // ======================= END DATKD CODE =================================================
    

    // ===================== COMMONS METHOD ======================

    public List<ProductInfo> convertResultSetToList(ResultSet rs) throws SQLException {
        List<ProductInfo> products = new ArrayList<>();

        while (rs.next()) {
            Product product = new Product(Integer.parseInt(rs.getString("pid")), rs.getString("product_name"), rs.getString("product_desc"), rs.getInt("amount_remaining"), rs.getString("category_name"));

            products.add(new ProductInfo(product, Double.parseDouble(rs.getString("price")), rs.getString("img1"), rs.getString("img2"), rs.getString("img3")));
        }
        return products;
    }


    public static void main(String[] args) throws SQLException {
        AdminServiceImpl ad = new AdminServiceImpl();

        Map<DayOfWeek, ManageOrder> ordersByDayOfWeek = ad.saveOrdersByDayOfWeek();

        for (Map.Entry<DayOfWeek, ManageOrder> entry : ordersByDayOfWeek.entrySet()) {
            DayOfWeek dayOfWeek = entry.getKey();
            ManageOrder manageOrder = entry.getValue();

            System.out.println("Day of Week: " + dayOfWeek);
            System.out.println("Manage Order: " + manageOrder);
            System.out.println("---------------------------");
        }

    }
}
