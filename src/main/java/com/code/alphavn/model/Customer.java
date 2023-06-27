package com.code.alphavn.model;

import java.util.Date;

public class Customer {
    private int id;
    private String name, password, address, email, phone;
    private Date create_At;

    private String Status;
    private int quantityOrder;
    private double totalSpent;

    public Customer() {
    }

    public Customer(int id) {
        this.id = id;
    }

    public Customer(int id, String name, String password, String address, String email, String phone, Date create_At) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.create_At = create_At;
    }

    public Customer(int id, String name, String password, String address, String email, String phone, Date create_At, String Status) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.create_At = create_At;
        this.Status = Status;
    }

    public Customer(String name, String password, String address, String email, String phone, Date create_At) {
        this.name = name;
        this.password = password;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.create_At = create_At;
    }

    public Customer(String name, String password, String email, String phone) {
        this.name = name;
        this.password = password;
        this.email = email;
        this.phone = phone;
    }

    public Customer(int id, String name, String address, String email, String phone) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.email = email;
        this.phone = phone;
    }

    public Customer(int id, String name, String email, Date create_At) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.create_At = create_At;
    }

    public Customer(String password, String email) {
        this.password = password;
        this.email = email;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }

    public int getQuantityOrder() {
        return quantityOrder;
    }

    public void setQuantityOrder(int quantityOrder) {
        this.quantityOrder = quantityOrder;
    }

    public double getTotalSpent() {
        return totalSpent;
    }

    public void setTotalSpent(double totalSpent) {
        this.totalSpent = totalSpent;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getCreate_At() {
        return create_At;
    }

    public void setCreate_At(Date create_At) {
        this.create_At = create_At;
    }

    @Override
    public String toString() {
        return "Customer{" + "id=" + id + ", name=" + name + ", password=" + password + ", address=" + address + ", email=" + email + ", phone=" + phone + ", create_At=" + create_At + '}';
    }
}
