package com.code.alphavn.controller.adminController;

import com.code.alphavn.model.Product;
import com.code.alphavn.model.ProductDiscount;
import com.code.alphavn.model.ProductInfo;
import com.code.alphavn.service.adminService.AdminServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.SQLException;

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
                case "searchSTC":

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
        adminService = new AdminServiceImpl();
        request.setAttribute("products", adminService.getAllProducts());
        System.out.println(adminService.getAllProducts().size());
        request.getRequestDispatcher("components/adminComponents/ecommerce-products.jsp").forward(request, response);
    }

    public void showProductDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int pid = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("product", adminService.getProductByID(pid));
        request.setAttribute("discount", adminService.findDiscountProductById(pid));
        request.getRequestDispatcher("components/adminComponents/ecommerce-product-details.jsp").forward(request, response);
    }

    public void showOverView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String week = request.getParameter("week");
        System.out.println(week);
        request.setAttribute("statistic", adminService.manageProducts(Integer.parseInt(week)));
        request.setAttribute("manages", adminService.getManageProductInCurrDate(Integer.parseInt(week)));
        request.setAttribute("prdTops", adminService.getTopSellingProduct());
        request.getRequestDispatcher("/components/adminComponents/ecommerce.jsp").forward(request, response);
    }


    public void showAddProductLayOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        request.getRequestDispatcher("components/adminComponents/ecommerce-add-product.jsp").forward(request, response);
    }

    public void deleleProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int pid = Integer.parseInt(request.getParameter("pid"));
        boolean isDeleted = adminService.deleteProduct(pid);
        if (isDeleted) {
            request.setAttribute("success", "Delete product successfully!");
        }
        request.setAttribute("error", "Delete product faild!");
        showProductList(request, response);
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
        String prdName = request.getParameter("productName");
        String files = request.getParameter("fileNames");
        String prdDesc = request.getParameter("description");
        String price = request.getParameter("product-price");
        String vendor = request.getParameter("vendor");
        String category = request.getParameter("category");
        String prdQuantity = request.getParameter("quantity");
        String discount = request.getParameter("product-discount");

        String[] splitFiles = files.split(" ; ");

        Product product = new Product(prdName, prdDesc, Integer.parseInt(prdQuantity), category);
        ProductInfo productInfo = new ProductInfo(product, Double.parseDouble(price), splitFiles[0], splitFiles[1], splitFiles[2], vendor);

        ProductDiscount productDiscount = null;

        // == CHECK THE PRODUCT HAVE THE DISCOUNT OR NOT AND HANDLE
        if (!discount.equalsIgnoreCase("0")) {
            System.out.println("Vao dis 156 servlet");
            String discountName = request.getParameter("discount-name");
            String startDate = request.getParameter("start-date");
            String endDate = request.getParameter("end-date");

            productDiscount = new ProductDiscount(discountName, Double.parseDouble(discount), Date.valueOf(startDate), Date.valueOf(endDate));
        }

        boolean isCreated = adminService.createProduct(productInfo, productDiscount);

        if (!isCreated) {
            request.setAttribute("error", "Create new product faild, Try again !");
        }
        request.setAttribute("success", "Create product successfully !");
        response.sendRedirect("ecommerce-product?action=products");
    }


    public void updateProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

        String pid = request.getParameter("pid");

        String prdName = request.getParameter("productName");
        String files = request.getParameter("fileNames");
        String prdDesc = request.getParameter("description");
        String price = request.getParameter("product-price");
        String vendor = request.getParameter("vendor");
        String category = request.getParameter("category");
        String prdQuantity = request.getParameter("quantity");
        String discount = request.getParameter("product-discount");


        System.out.println("DIS " + discount);


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
    }

    // =================== END HANDLE DO POST OF ECOMMERCE PRODUCT =====================

}



