package com.ordering.po;

public class Menu {
    private int menu_id;
    private int shop_id;
    private String menu_name;
    private String menu_img;
    private int menu_price;
    private int menu_count;
    private int menu_sell;
    private int menu_comment;
    private Shop shop;

    public int getMenu_comment() {
        return menu_comment;
    }

    public void setMenu_comment(int menu_comment) {
        this.menu_comment = menu_comment;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    public String getMenu_img() {
        return menu_img;
    }

    public void setMenu_img(String menu_img) {
        this.menu_img = menu_img;
    }

    public int getMenu_id() {
        return menu_id;
    }

    public void setMenu_id(int menu_id) {
        this.menu_id = menu_id;
    }

    public int getShop_id() {
        return shop_id;
    }

    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    public String getMenu_name() {
        return menu_name;
    }

    public void setMenu_name(String menu_name) {
        this.menu_name = menu_name;
    }

    public int getMenu_price() {
        return menu_price;
    }

    public void setMenu_price(int menu_price) {
        this.menu_price = menu_price;
    }

    public int getMenu_count() {
        return menu_count;
    }

    public void setMenu_count(int menu_count) {
        this.menu_count = menu_count;
    }

    public int getMenu_sell() {
        return menu_sell;
    }

    public void setMenu_sell(int menu_sell) {
        this.menu_sell = menu_sell;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "menu_id=" + menu_id +
                ", shop_id=" + shop_id +
                ", menu_name='" + menu_name + '\'' +
                ", menu_img='" + menu_img + '\'' +
                ", menu_price=" + menu_price +
                ", menu_count=" + menu_count +
                ", menu_sell=" + menu_sell +
                ", shop=" + shop +
                '}';
    }
}
