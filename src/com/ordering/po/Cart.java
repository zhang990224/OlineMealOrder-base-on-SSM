package com.ordering.po;

public class Cart {
    private int cart_id;
    private int user_id;
    private int menu_id;
    private int menu_num;
    private Menu menu;

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getMenu_id() {
        return menu_id;
    }

    public void setMenu_id(int menu_id) {
        this.menu_id = menu_id;
    }

    public int getMenu_num() {
        return menu_num;
    }

    public void setMenu_num(int menu_num) {
        this.menu_num = menu_num;
    }
}
