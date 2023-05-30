package com.code.alphavn.model;

import java.util.Date;

public class ProductDiscount {
    private int discount_id;
    private int pid;
    private String dis_name;
    private double dis_amount;
    private Date start_date;
    private Date end_date;

    public ProductDiscount() {
    }

    public ProductDiscount(int id, int pid, String dis_name, double dis_amount, Date start_date, Date end_date) {
        this.discount_id = id;
        this.pid = pid;
        this.dis_name = dis_name;
        this.dis_amount = dis_amount;
        this.start_date = start_date;
        this.end_date = end_date;
    }

    public int getDiscount_id() {
        return discount_id;
    }

    public void setDiscount_id(int discount_id) {
        this.discount_id = discount_id;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getDis_name() {
        return dis_name;
    }

    public void setDis_name(String dis_name) {
        this.dis_name = dis_name;
    }

    public double getDis_amount() {
        return dis_amount;
    }

    public void setDis_amount(double dis_amount) {
        this.dis_amount = dis_amount;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

}
