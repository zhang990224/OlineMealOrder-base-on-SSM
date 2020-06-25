package com.ordering.service;

import com.ordering.po.*;

import java.util.List;

public interface ShopService {
    void AddShop(Shop shop);
    Pageresult<Shop> DisAllShop(int page,int pageSize,String shopname);
    Pageresult<Shop> DisShopByTJ(String shop_type,String shop_price,int page,int pageSize);
    Pageresult<Shop> DisShopByShopName(String shop_name,int page,int pageSize);
    Pageresult<Menu> DisMenuByMenuName(String menu_name,int page,int pageSize);
    List<Shop> DisShopByIncome();
    int CountMenuByMenuName(String menu_name);
    int CountShopByShopName(String shop_name);
    int CountAllShop();
    Shop DisShopById(int id);
    void UpdateShopById(Shop shop);
    void UpdateShopStateById(Shop shop);
    void UpdateShopImgById(Shop shop);
    Pageresult<Menu> DisMenuByShopId(int page,int pageSize,int shop_id);
    void AddMenu(Menu menu);
    int CountMenuByShopId(int shop_id);
    Menu DisMenuById(int menu_id);
    void UpdateShopIncome(Shop shop);
    void UpdateMenuSellById(Menu menu);
    List<Menu> DisMenuBySell();
    void UpdateMenuMCById(Menu menu);
    void UpdateMenuImgById(Menu menu);
    void DeleteMenuById(int menu_id);
    void UpdateMenuById(Menu menu);
    void AddCart(Cart cart);
    List<Cart> DisCartByUserId(int user_id);
    void UpdateCartById(Cart cart);
    void DeleteCartById(Cart cart);
    int CountCartByMenuId(Cart cart);
    Cart DisCartByMenuId(Cart cart);
    void AddAddress(Address address);
    List<Address> DisAddressById(int user_id);
    void UpdateAddressById(Address address);
    void AddComment(Comment comment);
    Pageresult<Comment> DisCommentByUserId(int user_id,int page,int pageSize);
    Pageresult<Comment> DisCommentByShopId(int shop_id,int page,int pageSize);
    int CountCommentByUserId(Comment comment);
    void DeleteCommentById(int id);
    int CountCommentByShopId(int shop_id);
}
