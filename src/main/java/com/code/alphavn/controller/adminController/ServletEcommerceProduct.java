package com.code.alphavn.controller.adminController;

import com.code.alphavn.model.Product;
import com.code.alphavn.model.ProductDiscount;
import com.code.alphavn.model.ProductInfo;
import com.code.alphavn.service.adminService.AdminServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
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
        System.out.println(adminService.findDiscountProductById(pid));
        request.getRequestDispatcher("components/adminComponents/ecommerce-product-details.jsp").forward(request, response);
    }


    public void showAddProductLayOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        request.getRequestDispatcher("components/adminComponents/ecommerce-add-product.jsp").forward(request, response);
    }

    public void deleleProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int pid = Integer.parseInt(request.getParameter("pid"));
        boolean isDeleted = adminService.deleteProduct(pid);
        if(isDeleted) {
            request.setAttribute("success", "Delete product successfully!");
        } request.setAttribute("error", "Delete product faild!");
        showProductList(request, response);
    }

    //    ================== END HANDLE VIEW OF ECOMMERCE PRODUCT ====================


    // =================== HANDLE DO POST OF ECOMMERCE PRODUCT =====================

    public void createProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String prdName = request.getParameter("productName");
        String files = request.getParameter("fileNames");
        String prdDesc = request.getParameter("description");
        String price = request.getParameter("product-price");
        String discount = request.getParameter("product-discount");
        String discountName = request.getParameter("discount-name");
        String vendor = request.getParameter("vendor");
        String category = request.getParameter("category");
        String prdQuantity = request.getParameter("quantity");
        String startDate = request.getParameter("start-date");
        String endDate = request.getParameter("end-date");

        String[] splitFiles = files.split(" ; ");

        Product product = new Product(prdName, prdDesc, Integer.parseInt(prdQuantity), category);

        ProductInfo productInfo = new ProductInfo(product, Double.parseDouble(price), splitFiles[0], splitFiles[1], splitFiles[2], vendor);

        ProductDiscount productDiscount = new ProductDiscount(discountName, Double.parseDouble(discount), Date.valueOf(startDate), Date.valueOf(endDate));

        boolean isCreated = adminService.createProduct(productInfo, productDiscount);

        if (!isCreated) {
            System.out.println("Faild");
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
        String discount = request.getParameter("product-discount");
        String discountName = request.getParameter("discount-name");
        String vendor = request.getParameter("vendor");
        String category = request.getParameter("category");
        String prdQuantity = request.getParameter("quantity");
        String startDate = request.getParameter("start-date");
        String endDate = request.getParameter("end-date");

        System.out.println("files" + files);

        String[] splitFiles = files.split(" ; ");

        Product product = new Product(Integer.parseInt(pid), prdName, prdDesc, Integer.parseInt(prdQuantity), category);

        ProductInfo productInfo = new ProductInfo(product, Double.parseDouble(price), splitFiles[0], splitFiles[1], splitFiles[2], vendor);

        ProductDiscount productDiscount = new ProductDiscount(Integer.parseInt(pid), discountName, Double.parseDouble(discount), Date.valueOf(startDate), Date.valueOf(endDate));

        boolean isCreated = adminService.updateProduct(productInfo, productDiscount);

        if (!isCreated) {
            System.out.println("Faild");
            request.setAttribute("error", "Create new product faild, Try again !");
        }
        request.setAttribute("success", "Create product successfully !");
        response.sendRedirect("ecommerce-product?action=products");
    }

    // =================== END HANDLE DO POST OF ECOMMERCE PRODUCT =====================

}


//        System.out.println(prdName + file + prdDesc + discount + discountName + "/ vendor" + vendor + " cate" +  category + " / uqua"  +prdQuantity);
