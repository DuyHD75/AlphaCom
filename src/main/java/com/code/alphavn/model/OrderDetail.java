package com.code.alphavn.model;

public class OrderDetail {
    private int orderId;
    private ProductInfo product;
    private double price;
    private int quantityOrdered;
    private String productName;
    private float subtotal;
    private float shipping;
    private float tax;
    private float total;

    public OrderDetail() {
    }

    public OrderDetail(String productName, String subtotal,String shipping, String tax, String total) {
        this.productName = productName;
        this.subtotal = Float.parseFloat(subtotal);
        this.shipping = Float.parseFloat(shipping);
        this.tax = Float.parseFloat(tax);
        this.total = Float.parseFloat(total);

    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getSubtotal() {
        return String.format("%.2f",subtotal);
    }

    public void setSubtotal(String subtotal) {
        this.subtotal = Float.parseFloat(subtotal);
    }

    public String getShipping() {
        return String.format("%.2f",shipping);
    }

    public void setShipping(String shipping) {
        this.shipping = Float.parseFloat(shipping);
    }

    public String getTax() {
        return String.format("%.2f",tax);
    }

    public void setTax(String tax) {
        this.tax = Float.parseFloat(tax);
    }

    public String getTotal() {
        return String.format("%.2f",total);
    }

    public void setTotal(String total) {
        this.total = Float.parseFloat(total);
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
