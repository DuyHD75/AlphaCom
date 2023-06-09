package com.code.alphavn.controller.userController;

import com.code.alphavn.model.*;
import com.code.alphavn.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@WebServlet(name = "ServletViewWishList", value = "/wishList")
public class ServletWishList extends HttpServlet {

    UserServiceImpl userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("acc");
        String action = request.getParameter("action");
        if (customer == null) {
            request.getRequestDispatcher("loginCustomer").forward(request, response);
            return;
        }
        if (action == null){
        Date todayDate = new Date();
        try {
            List<WishListProduct> list = userService.getWishList(customer.getEmail());
            request.setAttribute("numOfWishList",list.size());
            //System.out.println("Vào servlet wish");
            List<ProductDiscount> discountList = userService.getProductDiscounts();
            //System.out.println(discountList);
            List<WishListProduct> DiscountAvailable = new ArrayList<>();
            List<Double> discountCount = new ArrayList<>();

            for (int i = 0; i < discountList.size(); i++) {
                Date historyDate = discountList.get(i).getStart_date();
                Date futureDate = discountList.get(i).getEnd_date();
                for (int j = 0; j < list.size(); j++) {
                    if (list.get(j).getProduct_id() == discountList.get(i).getPid() && todayDate.after(historyDate) && todayDate.before(futureDate)) {

                        DiscountAvailable.add(list.get(j));
                        discountCount.add(Math.round(((list.get(j).getPrice())-discountList.get(i).getDis_amount()*list.get(j).getPrice())*100.0)/100.0);
                        list.remove(list.get(j));

                        //discountList.remove(productDiscount);
                    }
                }
            }
            request.setAttribute("DiscountAvailable", DiscountAvailable);
            request.setAttribute("disList", discountList);
            request.setAttribute("list", list);
            request.setAttribute("count", discountCount);
            //request.setAttribute("numOfWishList",);
            request.getRequestDispatcher("/components/userComponents/wishListProduct.jsp").forward(request, response);


        } catch (SQLException | ServletException | IOException e) {
            throw new RuntimeException(e);
        }
        }
        if (action != null) {
            try {
                switch (action) {

                    case "deleteFromWishList":
                        deleteFromWishList(request, response);
                        //session.setAttribute("numWish",userService.getWishList(customer.getEmail()).size());
                        session.setAttribute("numWish",(Integer)session.getAttribute("numWish")-1);
                        response.sendRedirect("wishList");
                        break;
                    case "addToWishList":
                        if (addToWishList(request, response)){
                            session.setAttribute("numWish",(Integer)session.getAttribute("numWish")+1);
                            response.sendRedirect("wishList");
                        }else {
                            response.sendRedirect("wishList");
                            //request.getRequestDispatcher("/components/userComponents/wishListProduct.jsp").forward(request, response);
                        }
                        break;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        //request.getRequestDispatcher("/components/userComponents/wishListProduct.jsp").forward(request, response);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("acc");
        String action = request.getParameter("action");

        if (customer == null) {
            request.getRequestDispatcher("loginCustomer").forward(request, response);
            return;
        }
        try {
            switch (action) {

                case "deleteFromWishList":
                    deleteFromWishList(request, response);
//                    session.setAttribute("numWish",userService.getWishList(customer.getEmail()).size());
                    session.setAttribute("numWish",(Integer)session.getAttribute("numWish")-1);
                    response.sendRedirect("wishList");
                    break;
                case "addToWishList":
                    if (addToWishList(request, response)){
                        session.setAttribute("numWish",(Integer)session.getAttribute("numWish")+1);
                        response.sendRedirect("wishList");
                    }else {
                        response.sendRedirect("wishList");
                        //request.getRequestDispatcher("/components/userComponents/wishListProduct.jsp").forward(request, response);
                    }
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //request.getRequestDispatcher("/components/userComponents/wishListProduct.jsp").forward(request, response);

    }


    public boolean addToWishList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("acc");
        int pid = Integer.parseInt(request.getParameter("pid"));
        List<WishListProduct> wishListProducts = userService.getWishList(customer.getEmail());
        for (WishListProduct wishListProduct:wishListProducts){
            if (wishListProduct.getProduct_id()==pid){
                return false;
            }
        }
        userService.addWishList(pid, customer.getId());
        return true;
    }

    public void deleteFromWishList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("acc");
        int pid = Integer.parseInt(request.getParameter("pid"));
        userService.deleteWishList(pid, customer.getId());
    }
}
