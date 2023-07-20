package com.code.alphavn.controller.adminController;

import com.code.alphavn.model.Order;
import com.code.alphavn.model.Product;
import com.code.alphavn.model.ProductDiscount;
import com.code.alphavn.model.ProductInfo;
import com.code.alphavn.model.adminModel.Admin;
import com.code.alphavn.service.adminService.AdminServiceImpl;
import com.code.alphavn.service.userService.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ServletEcommerceProduct", value = "/ecommerce-product")
public class ServletEcommerceProduct extends HttpServlet {


    private AdminServiceImpl adminService = null;

    @Override
    public void init() throws ServletException {
        super.init();
        adminService = new AdminServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "overview":
                    showOverView(request, response);
                    break;
                case "products":
                    showProductList(request, response);
                    break;
                case "product-details":
                    showProductDetails(request, response);
                    break;
                case "update-product":
                    showProductDetails(request, response);
                    break;
                case "add-product":
                    showAddProductLayOut(request, response);
                    break;
                case "delete-product":
                    deleleProduct(request, response);
                    break;
                case "nextProductDetail":
                    nextProductDetail(request, response);
                    break;
                case "priviousProductDetail":
                    priviousProductDetail(request, response);
                    break;
                default:
                    System.out.println("This is the do get of ecommerce-product");
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        System.out.println("action" + action);
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "add-product":
                    createProduct(request, response);
                    break;
                case "product-details":
                    updateProduct(request, response);
                    break;
                case "deleteSelected":
                    handleDeleteSelected(request, response);
                    break;
                default:
                    System.out.println("This is the do post Ecommerce product !");
                    break;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    //    ================== HANDLE VIEW OF ECOMMERCE PRODUCT ====================

    public void showProductList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        Admin account = (Admin) session.getAttribute("acc");
        if (account != null) {
            adminService = new AdminServiceImpl();
            request.setAttribute("products", adminService.getAllProducts());
            System.out.println(adminService.getAllProducts().size());
            request.getRequestDispatcher("components/adminComponents/ecommerce-products.jsp").forward(request, response);
        } else {
            response.sendRedirect("loginCustomer");
        }
    }

    public void showProductDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        Admin account = (Admin) session.getAttribute("acc");
        if (account != null) {
            int pid = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("product", adminService.getProductByID(pid));
            request.setAttribute("discount", adminService.findDiscountProductById(pid));
            request.getRequestDispatcher("components/adminComponents/ecommerce-product-details.jsp").forward(request, response);
        } else {
            response.sendRedirect("loginCustomer");
        }
    }

    public void showOverView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

        HttpSession session = request.getSession();
        Admin account = (Admin) session.getAttribute("acc");
        if (account != null) {
            String week = request.getParameter("week");
            System.out.println(week);
            request.setAttribute("statistic", adminService.manageProducts(Integer.parseInt(week)));
            request.setAttribute("statistic2", adminService.manageProducts(Integer.parseInt(week) - 1));
            request.setAttribute("manages", adminService.getManageProductInCurrDate());
            request.setAttribute("prdTops", adminService.getTopSellingProduct());
            request.getRequestDispatcher("/components/adminComponents/ecommerce.jsp").forward(request, response);
        } else {
            response.sendRedirect("loginCustomer");
        }

        

    }


    public void showAddProductLayOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        Admin account = (Admin) session.getAttribute("acc");
        if (account != null) {
        request.getRequestDispatcher("components/adminComponents/ecommerce-add-product.jsp").forward(request, response);
        } else {
            response.sendRedirect("loginCustomer");
        }
    }

    public void deleleProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        Admin account = (Admin) session.getAttribute("acc");
        if (account != null) {
            int pid = Integer.parseInt(request.getParameter("pid"));
            boolean isDeleted = adminService.deleteProduct(pid);
            if (isDeleted) {
                request.setAttribute("success", "Delete product successfully!");
            }
            request.setAttribute("error", "Delete product faild!");
            showProductList(request, response);
        } else {
            response.sendRedirect("loginCustomer");
        }
    }

    //    ================== END HANDLE VIEW OF ECOMMERCE PRODUCT ====================


    // =================== HANDLE DO POST OF ECOMMERCE PRODUCT =====================

    public void handleUploadFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("file");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Specify the destination folder
        String uploadFolder = "src/main/webapp/imgs/productImg";

        // Create the output file
        File outputFile = new File(uploadFolder, fileName);

        // Write the uploaded file to the output file
        try (InputStream inputStream = filePart.getInputStream();
             OutputStream outputStream = new FileOutputStream(outputFile)) {
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void createProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

        HttpSession session = request.getSession();
        Admin account = (Admin) session.getAttribute("acc");
        if (account != null) {
        String prdName = request.getParameter("productName");
        String files = request.getParameter("fileNames");
        String prdDesc = request.getParameter("description");
        String price = request.getParameter("product-price");
        String vendor = request.getParameter("vendor");
        String category = request.getParameter("category");
        String prdQuantity = request.getParameter("quantity");
        String discount = request.getParameter("product-discount");

        System.out.println("files" + files);

        String[] splitFiles = files.split(" ; ");

        Product product = new Product(prdName, prdDesc, Integer.parseInt(prdQuantity), category);
        ProductInfo productInfo = new ProductInfo(product, Double.parseDouble(price), splitFiles[0], splitFiles[1], splitFiles[2], vendor);

        ProductDiscount productDiscount = null;

        // == CHECK THE PRODUCT HAVE THE DISCOUNT OR NOT AND HANDLE
        if (!discount.equalsIgnoreCase("0")) {
            String discountName = request.getParameter("discount-name");
            String startDate = request.getParameter("start-date");
            String endDate = request.getParameter("end-date");

            productDiscount = new ProductDiscount(discountName, Double.parseDouble(discount),
                    Date.valueOf(startDate), Date.valueOf(endDate));
        }

            boolean isCreated = adminService.createProduct(productInfo, productDiscount);

            if (!isCreated) {
                request.setAttribute("error", "Create new product faild, Try again !");
            }
            request.setAttribute("success", "Create product successfully !");
            response.sendRedirect("ecommerce-product?action=products");
        } else {
            response.sendRedirect("loginCustomer");
        }
    }


    public void updateProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        HttpSession session = request.getSession();
        Admin account = (Admin) session.getAttribute("acc");
        if (account != null) {
            String pid = request.getParameter("pid");

            String prdName = request.getParameter("productName");
            String files = request.getParameter("fileNames");
            String prdDesc = request.getParameter("description");
            String price = request.getParameter("product-price");
            String vendor = request.getParameter("vendor");
            String category = request.getParameter("category");
            String prdQuantity = request.getParameter("quantity");
            String discount = request.getParameter("product-discount");
            String[] splitFiles = files.split(" ; ");


            Product product = new Product(Integer.parseInt(pid), prdName, prdDesc, Integer.parseInt(prdQuantity), category);

            ProductInfo productInfo = new ProductInfo(product, Double.parseDouble(price), splitFiles[0], splitFiles[1], splitFiles[2], vendor);

            // == CHECK THE PRODUCT HAVE THE DISCOUNT OR NOT AND HANDLE
            ProductDiscount productDiscount = null;

            if (!discount.equalsIgnoreCase("0")) {
                String startDate = request.getParameter("start-date");
                String endDate = request.getParameter("end-date");
                String discountName = request.getParameter("discount-name");
                productDiscount = new ProductDiscount(Integer.parseInt(pid), discountName,
                        Double.parseDouble(discount), Date.valueOf(startDate), Date.valueOf(endDate));
            } else {
                adminService.deleteDiscountByPID(Integer.parseInt(pid));
            }

            // == HANDLE UPADTE PRODUCT
            boolean isCreated = adminService.updateProduct(productInfo, productDiscount);

            if (!isCreated) {
                request.setAttribute("error", "Create new product faild, Try again !");
            }
            request.setAttribute("success", "Create product successfully !");
            response.sendRedirect("ecommerce-product?action=products");
        } else {
            response.sendRedirect("loginCustomer");
        }
    }

    // =================== END HANDLE DO POST OF ECOMMERCE PRODUCT =====================
    //============================= CODE NGHIA ===========================================
    public void nextProductDetail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        UserServiceImpl userService = new UserServiceImpl();
        HttpSession session = request.getSession();
        Admin account = (Admin) session.getAttribute("acc");
        if (account != null) {
        int pid = Integer.parseInt(request.getParameter("id"));
        List<ProductInfo> products = adminService.getAllProducts();
        int currentIndex = getProductIndex(products, pid);

        int nextProductId = getNextProductId(products, currentIndex);

        response.sendRedirect("ecommerce-product?action=product-details&id=" + nextProductId);

        } else {
            response.sendRedirect("loginCustomer");
        }

    }

    public void priviousProductDetail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        UserServiceImpl userService = new UserServiceImpl();
        HttpSession session = request.getSession();
        Admin account = (Admin) session.getAttribute("acc");
        if (account != null) {
        int pid = Integer.parseInt(request.getParameter("id"));
        List<ProductInfo> products = adminService.getAllProducts();
        int currentIndex = getProductIndex(products, pid);

        int previousProductId = getPreviousProductId(products, currentIndex);

        response.sendRedirect("ecommerce-product?action=product-details&id=" + previousProductId);
        } else {
            response.sendRedirect("loginCustomer");
        }

    }

    // Hàm tìm vị trí của product hiện tại trong danh sách
    private int getProductIndex(List<ProductInfo> productList, int currentId) {
        for (int i = 0; i < productList.size(); i++) {
            ProductInfo product = productList.get(i);
            if (product.getProduct().getId() == currentId) {
                return i;
            }
        }
        return -1; // Không tìm thấy product hiện tại trong danh sách
    }

    // Hàm xác định ID product liền trước
    private int getPreviousProductId(List<ProductInfo> productList, int currentIndex) {
        if (currentIndex > 0) {
            ProductInfo previousProduct = productList.get(currentIndex - 1);
            return previousProduct.getProduct().getId();
        }
        return productList.get(productList.size() - 1).getProduct().getId(); // Không có product liền trước
    }

    // Hàm xác định ID product liền sau
    private int getNextProductId(List<ProductInfo> productList, int currentIndex) {
        if (currentIndex < productList.size() - 1) {
            ProductInfo nextProduct = productList.get(currentIndex + 1);
            return nextProduct.getProduct().getId();
        }
        return productList.get(0).getProduct().getId(); // Không có product liền sau
    }

    public void handleDeleteSelected (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        Admin account = (Admin) session.getAttribute("acc");
        if (account != null) {
            String orderIdsParam = request.getParameter("productIds");
            String[] selectedIds = orderIdsParam.split(",");
            List<Product> productIds = new ArrayList<>();
            if (selectedIds != null) {
                for (String id : selectedIds) {
                    int Id = Integer.parseInt(id);
                    productIds.add( new Product(Id));
                }
            }
            System.out.println("orderIdsParam"+orderIdsParam);
            System.out.println("selectedIds"+selectedIds);
            System.out.println("productIds"+productIds);
            adminService.DeleteProductSelected(productIds);
            response.sendRedirect("ecommerce-product?action=products");
        } else {
            response.sendRedirect("loginCustomer");
        }
    }
}



