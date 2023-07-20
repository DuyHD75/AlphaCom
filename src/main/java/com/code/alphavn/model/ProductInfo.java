package com.code.alphavn.model;

public class ProductInfo {
    private Product product;
    private double price;
    private String img1;
    private String img2;
    private String img3;
    private String vendor;

    public ProductInfo() {
    }

    public ProductInfo(Product product, double price, String img1, String img2, String img3) {
        this.product = product;
        this.price = price;
        this.img1 = img1;
        this.img2 = img2;
        this.img3 = img3;
    }

    public ProductInfo(Product product, double price, String img1, String img2, String img3, String vendor) {
        this.product = product;
        this.price = price;
        this.img1 = img1;
        this.img2 = img2;
        this.img3 = img3;
        this.vendor = vendor;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public String getImg3() {
        return img3;
    }

    public void setImg3(String img3) {
        this.img3 = img3;
    }

    public String getVendor() {
        return vendor;
    }

    public void setVendor(String vendor) {
        this.vendor = vendor;
    }

    @Override
    public String toString() {
        return "ProductInfo{" +
                "product=" + product +
                ", price=" + price +
                ", img1='" + img1 + '\'' +
                ", img2='" + img2 + '\'' +
                ", img3='" + img3 + '\'' +
                ", vendor=" + vendor +
                '}';
    }
}
