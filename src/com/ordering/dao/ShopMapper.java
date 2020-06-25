package com.ordering.dao;

import com.mysql.jdbc.CacheAdapter;
import com.ordering.po.*;

import java.util.List;

public interface ShopMapper {
    void AddShop(Shop shop);
    List<Shop> SearchShopByShopName(Pageresult pageresult);
    List<Shop> DisAllShop(Pageresult pageresult);
    List<Shop> DisAllShopU(Pageresult pageresult);
    List<Shop> DisShopByType(Pageresult pageresult);
    List<Shop> DisShopByPrice(Pageresult pageresult);
    List<Shop> DisShopByTypePrice(Pageresult pageresult);
    List<Shop> DisShopByShopName(Pageresult pageresult);
    List<Shop> DisShopByIncome();
    List<Menu> DisMenuByMenuName(Pageresult pageresult);
    int CountMenuByMenuName(String menu_name);
    int CountShopByShopName(String shop_name);
    int CountAllShop();
    int CountShopByType(Shop shop);
    int CountShopByPrice(Shop shop);
    int CountShopByTypePrice(Shop shop);
    Shop DisShopById(int id);
    void UpdateShopIncome(Shop shop);
    void UpdateShopById(Shop shop);
    void UpdateShopStateById(Shop shop);
    void UpdateShopImgById(Shop shop);
    void UpdateMenuSellById(Menu menu);
    List<Menu> DisMenuBySell();
    List<Menu> DisMenuByShopId(Pageresult pageresult);
    void AddMenu(Menu menu);
    int CountMenuByShopId(int shop_id);
    Menu DisMenuById(int menu_id);
    void UpdateMenuById(Menu menu);
    void UpdateMenuMCById(Menu menu);
    void UpdateMenuImgById(Menu menu);
    void DeleteMenuById(int menu_id);
    void AddCart(Cart cart);
    List<Cart> DisCartByUserId(int user_id);
    void UpdateCartById(Cart cart);
    void DeleteCartById(Cart cart);
    int CountCartByMenuId(Cart cart);
    Cart DisCartByMenuId(Cart cart);
    void AddAddress(Address address);
    void DeleteCommentById(int id);
    List<Address> DisAddressById(int user_id);
    void UpdateAddressById(Address address);
    void AddComment(Comment comment);
    List<Comment> DisCommentByUserId(Pageresult pageresult);
    List<Comment> DisCommentByShopId(Pageresult pageresult);
    int CountCommentByUserId(Comment comment);
    int CountCommentByShopId(int shop_id);
}
