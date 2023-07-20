package com.code.alphavn.model;

public class Product {
    private int id;
    private String name;
    private String desc;
    private int amount_remaining;
    private String category;

    public Product() {
    }

    public Product(int id) {
        this.id = id;
    }

    public Product(String name, String desc, int amount_remaining, String category) {
        this.name = name;
        this.desc = desc;
        this.amount_remaining = amount_remaining;
        this.category = category;
    }

    public Product(int id, String name, String desc, int amount_remaining, String category) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.amount_remaining = amount_remaining;
        this.category = category;
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

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public int getAmount_remaining() {
        return amount_remaining;
    }

    public void setAmount_remaining(int amount_remaining) {
        this.amount_remaining = amount_remaining;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", desc='" + desc + '\'' +
                ", amount_remaining=" + amount_remaining +
                ", category='" + category + '\'' +
                '}';
    }
}
