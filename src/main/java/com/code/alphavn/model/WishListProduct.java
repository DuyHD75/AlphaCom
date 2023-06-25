package com.code.alphavn.model;

public class WishListProduct {
    private int product_id;
    private String product_name;
    private double price;
    private String img;
    private int rating;

    public WishListProduct(int product_id, String product_name, double price, String img, int rating) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.price = price;
        this.img = img;
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "wishListProduct{" +
                "product_id=" + product_id +
                ", product_name='" + product_name + '\'' +
                ", price=" + price +
                ", img='" + img + '\'' +
                ", rating=" + rating +
                '}';
    }

    public WishListProduct() {
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
}