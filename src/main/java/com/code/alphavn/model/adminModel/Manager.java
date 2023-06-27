package com.code.alphavn.model.adminModel;

import java.util.Date;

public class Manager {
    private int id,adminId;
    private String name,pass,email,phone,address;
    private Date create_At;
    private String role;
private int totalMan;
    public Manager() {    }

    public Manager(int id, int adminId, String name, String pass, String email, String phone, String address, Date create_At, String role) {
        this.id = id;
        this.adminId = adminId;
        this.name = name;
        this.pass = pass;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.create_At = create_At;
        this.role = role;
    }

    public Manager(int id, int adminId, String name, String pass, String email, String phone, String address, Date create_At) {
        this.id = id;
        this.adminId = adminId;
        this.name = name;
        this.pass = pass;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.create_At = create_At;
    }

    public Manager(String name, String email, String phone, String address) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }

    public Manager(int id, String name, String email, String phone, String address) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }

    public Manager(String name, String phone, String address) {
        this.name = name;
        this.phone = phone;
        this.address = address;
    }

    public Manager(int totalMan) {
        this.totalMan = totalMan;
    }

    public Manager(String pass, String email) {
        this.pass = pass;
        this.email = email;
    }

    public Manager(String email) {
        this.email = email;
    }

    public Manager(String name, String email, String phone, String address, String role) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.role = role;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getTotalMan() {
        return totalMan;
    }

    public void setTotalMan(int totalMan) {
        this.totalMan = totalMan;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreate_At() {
        return create_At;
    }

    public void setCreate_At(Date create_At) {
        this.create_At = create_At;
    }

    @Override
    public String toString() {
        return "Manager{" +
                "id=" + id +
                ", adminId=" + adminId +
                ", name='" + name + '\'' +
                ", pass='" + pass + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", create_At=" + create_At +
                ", totalMan=" + totalMan +
                '}';
    }
}
