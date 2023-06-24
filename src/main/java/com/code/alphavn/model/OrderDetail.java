package com.code.alphavn.model;

public class OrderDetail {
    private int orderId;
    private ProductInfo product;
    private double price;
    private int quantityOrdered;

    public OrderDetail() {
    }

    public OrderDetail(int orderId, ProductInfo product, double price, int quantityOrdered) {
        this.orderId = orderId;
        this.product = product;
        this.price = price;
        this.quantityOrdered = quantityOrdered;
    }


    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public ProductInfo getProduct() {
        return product;
    }

    public void setProduct(ProductInfo product) {
        this.product = product;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantityOrdered() {
        return quantityOrdered;
    }

    public void setQuantityOrdered(int quantityOrdered) {
        this.quantityOrdered = quantityOrdered;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "orderId=" + orderId +
                ", product=" + product +
                ", price=" + price +
                ", quantityOrdered=" + quantityOrdered +
                '}';
    }
}
