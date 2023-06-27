package com.code.alphavn.model;

import java.util.Date;

public class ProductReview {
    private int id; // cua review
    private String cus_name;
    private int rating;
    private String comment;
    private Date create_at;

    private String email;
    private int cus_id;
    private int pid;
    private int rating1,rating2,rating3,rating4,rating5;
    private float avgrating;
    private String img,product_name;

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

    public ProductReview(int pid, int cus_id, int rating, String comment) {
        this.pid = pid;
        this.cus_id = cus_id;
        this.rating = rating;
        this.comment = comment;

    }

       public ProductReview(float avgrating, int rating1, int rating2, int rating3, int rating4, int rating5) {
        this.rating1 = rating1;
        this.rating2 = rating2;
        this.rating3 = rating3;
        this.rating4 = rating4;
        this.rating5 = rating5;
        this.avgrating = avgrating;
    }

    public ProductReview(int id, String cus_name, int rating, String comment, Date create_at, String email, String img, String product_name) {
        this.id=id;
        this.cus_name = cus_name;
        this.rating = rating;
        this.comment = comment;
        this.create_at = create_at;
        this.email = email;
        this.img = img;
        this.product_name = product_name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public void setRating1(int rating1) {
        this.rating1 = rating1;
    }

    public void setRating2(int rating2) {
        this.rating2 = rating2;
    }

    public void setRating3(int rating3) {
        this.rating3 = rating3;
    }

    public void setRating4(int rating4) {
        this.rating4 = rating4;
    }

    public void setRating5(int rating5) {
        this.rating5 = rating5;
    }

    public void setAvgrating(float avgrating) {
        this.avgrating = avgrating;
    }

    public int getRating1() {
        return rating1;
    }

    public int getRating2() {
        return rating2;
    }

    public int getRating3() {
        return rating3;
    }

    public int getRating4() {
        return rating4;
    }

    public int getRating5() {
        return rating5;
    }

    public float getAvgrating() {
        return avgrating;
    }

    public int getCus_id() {
        return cus_id;
    }

    public void setCus_id(int cus_id) {
        this.cus_id = cus_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    @Override

    public String toString() {
        return "ProductReview{" +
                "id=" + id +
                ", cus_name='" + cus_name + '\'' +
                ", rating=" + rating +
                ", comment='" + comment + '\'' +
                ", email='" + email + '\'' +
                ", cus_id=" + cus_id +
                ", pid=" + pid +
                ", product_name='" + product_name + '\'' +
                '}';
    }
}
