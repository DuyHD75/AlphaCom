package com.code.alphavn.model;

import java.util.Date;
import java.util.List;

public class Cart {
    private int customerId;
    private ProductInfo productInfo;
    private int amount;
    private double finalPrice;
    private List<ProductDiscount> productDiscount;

    public Cart() {
    }

    public Cart(int customerId, ProductInfo productInfo, int amount, double finalPrice, List<ProductDiscount> productDiscount) {
        this.customerId = customerId;
        this.productInfo = productInfo;
        this.amount = amount;
        this.finalPrice = finalPrice;
        this.productDiscount = productDiscount;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public ProductInfo getProductInfo() {
        return productInfo;
    }

    public void setProductInfo(ProductInfo productInfo) {
        this.productInfo = productInfo;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public List<ProductDiscount> getProductDiscount() {
        return productDiscount;
    }

    public void setProductDiscount(List<ProductDiscount> productDiscount) {
        this.productDiscount = productDiscount;
    }

    public double getFinalPrice() {
        return finalPrice;
    }

    public void setFinalPrice(double finalPrice) {
        this.finalPrice = finalPrice;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "customerId=" + customerId +
                ", productInfo=" + productInfo +
                ", amount=" + amount +
                ", productDiscount=" + productDiscount +
                '}';
    }

}
