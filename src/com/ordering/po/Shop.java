package com.ordering.po;

public class Shop {
    private int id;
    private String shop_name;
    private String shop_img;
    private String shop_address;
    private String shop_phone;
    private String shop_type;
    private String shop_special;
    private String shop_price;
    private String shop_discount;
    private String opentime;
    private int shop_income;
    private int shop_state;

    public String getShop_type() {
        return shop_type;
    }

    public void setShop_type(String shop_type) {
        this.shop_type = shop_type;
    }

    public String getShop_price() {
        return shop_price;
    }

    public void setShop_price(String shop_price) {
        this.shop_price = shop_price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getShop_name() {
        return shop_name;
    }

    public void setShop_name(String shop_name) {
        this.shop_name = shop_name;
    }

    public String getShop_img() {
        return shop_img;
    }

    public void setShop_img(String shop_img) {
        this.shop_img = shop_img;
    }

    public String getShop_address() {
        return shop_address;
    }

    public void setShop_address(String shop_address) {
        this.shop_address = shop_address;
    }

    public String getShop_phone() {
        return shop_phone;
    }

    public void setShop_phone(String shop_phone) {
        this.shop_phone = shop_phone;
    }

    public String getShop_special() {
        return shop_special;
    }

    public void setShop_special(String shop_special) {
        this.shop_special = shop_special;
    }

    public String getShop_discount() {
        return shop_discount;
    }

    public void setShop_discount(String shop_discount) {
        this.shop_discount = shop_discount;
    }

    public String getOpentime() {
        return opentime;
    }

    public void setOpentime(String opentime) {
        this.opentime = opentime;
    }

    public int getShop_income() {
        return shop_income;
    }

    public void setShop_income(int shop_income) {
        this.shop_income = shop_income;
    }

    public int getShop_state() {
        return shop_state;
    }

    public void setShop_state(int shop_state) {
        this.shop_state = shop_state;
    }

    @Override
    public String toString() {
        return "Shop{" +
                "id=" + id +
                ", shop_name='" + shop_name + '\'' +
                ", shop_img='" + shop_img + '\'' +
                ", shop_address='" + shop_address + '\'' +
                ", shop_phone='" + shop_phone + '\'' +
                ", shop_type='" + shop_type + '\'' +
                ", shop_special='" + shop_special + '\'' +
                ", shop_price='" + shop_price + '\'' +
                ", shop_discount='" + shop_discount + '\'' +
                ", opentime='" + opentime + '\'' +
                ", shop_income=" + shop_income +
                ", shop_state=" + shop_state +
                '}';
    }
}
