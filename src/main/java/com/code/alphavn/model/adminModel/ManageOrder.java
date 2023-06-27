package com.code.alphavn.model.adminModel;

import java.util.*;

public class ManageOrder {
    private Date orderDate;
    private String dayOfWeek;
    private Long totalOrders;
    private Long totalProducts;
    private Double revernues;



    public ManageOrder() {
    }

    public ManageOrder( String dayOfWeek,Date orderDate, Long totalOrders, Long totalProducts, Double revernues) {
        this.dayOfWeek = dayOfWeek;
        this.orderDate = orderDate;
        this.totalProducts = totalProducts;
        this.totalOrders = totalOrders;
        this.revernues = revernues;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Long getTotalOrders() {
        return totalOrders;
    }

    public void setTotalOrders(Long totalOrders) {
        this.totalOrders = totalOrders;
    }

    public Double getRevernues() {
        return revernues;
    }

    public void setRevernues(Double revernues) {
        this.revernues = revernues;
    }

    public Long getTotalProducts() {
        return totalProducts;
    }

    public void setTotalProducts(Long totalProducts) {
        this.totalProducts = totalProducts;
    }

    public String getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(String dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    @Override
    public String toString() {
        return "ManageOrder{" +
                "orderDate=" + orderDate +
                ", dayOfWeek='" + dayOfWeek + '\'' +
                ", totalOrders=" + totalOrders +
                ", totalProducts=" + totalProducts +
                ", revernues=" + revernues +
                '}';
    }
}
