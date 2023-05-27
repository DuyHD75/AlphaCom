package com.code.alphavn.model;

import java.util.Date;

public class ProductReview {
    private int id;
    private String cus_name;
    private int rating;
    private String comment;
    private Date create_at;

    public ProductReview() {
    }

    public ProductReview(String cus_name, int rating, String comment, Date create_at) {
        this.cus_name = cus_name;
        this.rating = rating;
        this.comment = comment;
        this.create_at = create_at;
    }

    public ProductReview(int id, String cus_name, int rating, String comment, Date create_at) {
        this.id = id;
        this.cus_name = cus_name;
        this.rating = rating;
        this.comment = comment;
        this.create_at = create_at;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCus_name() {
        return cus_name;
    }

    public void setCus_name(String cus_name) {
        this.cus_name = cus_name;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Date create_at) {
        this.create_at = create_at;
    }
}
