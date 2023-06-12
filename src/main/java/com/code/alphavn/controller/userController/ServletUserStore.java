package com.code.alphavn.controller.userController;

import com.code.alphavn.model.Customer;
import com.code.alphavn.model.ProductInfo;
import com.code.alphavn.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "ServletStore", value = "/store")
public class ServletUserStore extends HttpServlet {

    private static UserServiceImpl userService;
    private static boolean flag;
    private static int minPrice, maxPrice;

    @Override
    public void init() throws ServletException {
        super.init();
        userService = new UserServiceImpl();
        flag = false;
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("categories", userService.getCategories());
            getPdByMultiFactors(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String process = request.getParameter("process");

        try {
            switch (process) {
                case "1":
                    getPdByMultiFactors(request, response);
                    break;
                case "2":
                    getProductByRangePrice(request, response);
                    break;
                case "3":
                    getSearchResult(request, response);
                    break;
                default:
                    System.out.println("this default");
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void getSearchResult(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        System.out.println("vao 3");
        String key = request.getParameter("searchKey");


        System.out.println(key);
        List<ProductInfo> filterProduct = userService.getAllProducts().stream()
                .filter(productInfo -> productInfo.getProduct().getName().contains(key) || productInfo.getProduct().getCategory().equalsIgnoreCase(key))
                .collect(Collectors.toList());

        if (filterProduct != null) {
            request.setAttribute("products", filterProduct);
            request.setAttribute("pdDiscount", userService.getProductDiscounts());
            request.setAttribute("categories", userService.getCategories());
            request.setAttribute("searchKey", key);
        } else {
            request.setAttribute("error", "Can't find the product with keyword is: " + key);
        }
        request.getRequestDispatcher("/components/userComponents/store.jsp").forward(request, response);
    }


    public void getProductByRangePrice(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String category = request.getParameter("category");
        minPrice = Integer.parseInt(request.getParameter("priceMin"));
        maxPrice = Integer.parseInt(request.getParameter("priceMax"));

        flag = true;
        request.setAttribute("products",
                userService.getProductInRangePrice(minPrice, maxPrice, category));
        request.setAttribute("pdDiscount", userService.getProductDiscounts());
        request.getRequestDispatcher("/components/commons/productList.jsp").forward(request, response);
    }


    public void getPdByMultiFactors(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<ProductInfo> products;
        String category = request.getParameter("category");

        HttpSession session = request.getSession();

        Customer account = (Customer) session.getAttribute("acc");

        if (account != null){
            ServletCart cart = new ServletCart();
            cart.handleViewCartHeader(request, response);
        }

        if (category == null || category.equalsIgnoreCase("All")) {
            request.setAttribute("category", "All");
            products = new ArrayList<>(userService.getAllProducts());
        } else {
            request.setAttribute("category", category);
            products = new ArrayList<>(userService.getProductByCategory(category));
        }

        request.setAttribute("pdDiscount", userService.getProductDiscounts());

        String page = request.getParameter("page");
        String priceOrder = request.getParameter("priceOrder");

        System.out.println(page);
        if (page != null) {
            request.setAttribute("page", Integer.parseInt(page));

            if (priceOrder != null && Integer.parseInt(priceOrder) == 1) {
                products = products
                        .stream()
                        .sorted(Comparator.comparing(ProductInfo::getPrice).reversed())
                        .collect(Collectors.toList());
            } else if (priceOrder != null && Integer.parseInt(priceOrder) == 0) {
                products = products
                        .stream()
                        .sorted(Comparator.comparing(ProductInfo::getPrice))
                        .collect(Collectors.toList());

            } else if (flag) {
                System.out.println("Min: " + minPrice + " Max: " + maxPrice + " Cate: " + category);
                products = userService.getProductInRangePrice(minPrice, maxPrice, category);
                System.out.println(products);
            }
            request.setAttribute("products", products);
            request.getRequestDispatcher("/components/commons/productList.jsp").forward(request, response);
        } else {
            request.setAttribute("products", products);
            request.getRequestDispatcher("/components/userComponents/store.jsp").forward(request, response);
        }
    }


}





/*
 TEST SOUT FOR GETPRODUCT IN RANGE PRICE
     System.out.println("min: " + minPrice);
     System.out.println("max: " + maxPrice);
     System.out.println("category: " + category);*/
