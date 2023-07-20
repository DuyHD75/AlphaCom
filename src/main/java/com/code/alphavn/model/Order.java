package com.code.alphavn.model;

import java.util.List;

public class Order {
    private int id;
    private Customer customer;
    private String orderDate, status, paymentMethod, StatusPaid;
    private List<OrderDetail> orderDetail;
    private int pid;//nin
    private double price;//nin
    private double totalPriceOrder;
    private int amount;

    public Order(Customer customer, String paymentMethod, int pid, double price, int amount) {
        this.customer = customer;
        this.paymentMethod = paymentMethod;
        this.pid = pid;
        this.price = price;
        this.amount = amount;
    }

    public Order() {
    }

    public Order(int id, Customer customer, String orderDate, String status, String paymentMethod, List<OrderDetail> orderDetail) {
        this.id = id;
        this.customer = customer;
        this.orderDate = orderDate;
        this.status = status;
        this.paymentMethod = paymentMethod;
        this.orderDetail = orderDetail;
    }

    public Order(int id) {
        this.id = id;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getStatusPaid() {
        return StatusPaid;
    }

    public void setStatusPaid(String statusPaid) {
        StatusPaid = statusPaid;
    }

    public double getTotalPriceOrder() {
        return totalPriceOrder;
    }

    public void setTotalPriceOrder(double totalPriceOrder) {
        this.totalPriceOrder = totalPriceOrder;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public List<OrderDetail> getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(List<OrderDetail> orderDetail) {
        this.orderDetail = orderDetail;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", customer=" + customer +
                ", orderDate='" + orderDate + '\'' +
                ", status='" + status + '\'' +
                ", paymentMethod='" + paymentMethod + '\'' +
                ", orderDetail=" + orderDetail +
                '}';
    }
}
