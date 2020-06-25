package com.ordering.service.Impl;

import com.ordering.dao.ShopMapper;
import com.ordering.po.*;
import com.ordering.service.ShopService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class ShopServiceImpl implements ShopService {
    @Resource
    private ShopMapper shopMapper;

    @Override
    public void AddShop(Shop shop) {
        shopMapper.AddShop(shop);
    }

    @Override
    public Pageresult<Shop> DisAllShop(int page, int pageSize,String shopname) {
        Pageresult<Shop> pr = new Pageresult<>();
        int totalCount = 0;
        if (shopname==""){
            totalCount = shopMapper.CountAllShop();
        }else{
            totalCount = shopMapper.CountShopByShopName(shopname);
        }
        pr.setTotalCount(totalCount);
        int start = (page-1)*pageSize;
        Pageresult p = new Pageresult();
        p.setStart(start);
        p.setPageCount(pageSize);
        p.setShop_name(shopname);
        List<Shop> shops = null;
        if (shopname=="") {
            shops = shopMapper.DisAllShop(p);
        }else {
            shops = shopMapper.SearchShopByShopName(p);
        }
        pr.setList(shops);
        pr.setStart(start);
        pr.setCurrentPage(page);
        int totalPage = (int)Math.ceil(totalCount * 1.0 / pageSize);
        pr.setTotalPage(totalPage);
        return pr;
    }

    @Override
    public Pageresult<Shop> DisShopByTJ(String shop_type, String shop_price, int page, int pageSize) {
        Pageresult<Shop> pr = new Pageresult<>();
        Shop shop = new Shop();
        shop.setShop_price(shop_price);
        shop.setShop_type(shop_type);
        if (shop_type.trim().equals("全部") && shop_price.trim().equals("全部")){
            int totalCount = shopMapper.CountAllShop();
            pr.setTotalCount(totalCount);
            System.out.println("0"+totalCount);
        }else if (shop_type.trim().equals("全部") && shop_price.trim().equals("全部")==false){
            int totalCount = shopMapper.CountShopByPrice(shop);
            pr.setTotalCount(totalCount);
            System.out.println("1"+totalCount);
        }else if (shop_type.trim().equals("全部")==false && shop_price.trim().equals("全部")){
            int totalCount = shopMapper.CountShopByType(shop);
            pr.setTotalCount(totalCount);
            System.out.println("2"+totalCount);
        }else if (shop_type.trim().equals("全部")==false && shop_price.trim().equals("全部")==false){
            int totalCount = shopMapper.CountShopByTypePrice(shop);
            System.out.println("3"+totalCount);
            pr.setTotalCount(totalCount);
        }
        int start = (page-1)*pageSize;
        Pageresult p = new Pageresult();
        p.setStart(start);
        p.setPageCount(pageSize);
        p.setShop_price(shop_price);
        p.setShop_type(shop_type);
        List<Shop> shops = null;
        if (shop_type.trim().equals("全部") && shop_price.trim().equals("全部")){
            shops = shopMapper.DisAllShopU(p);
            System.out.println(shops);
        }else if (shop_type.trim().equals("全部") && shop_price.trim().equals("全部")==false){
            shops = shopMapper.DisShopByPrice(p);
            System.out.println(shops);
        }else if (shop_type.trim().equals("全部")==false && shop_price.trim().equals("全部")){
            shops = shopMapper.DisShopByType(p);
            System.out.println(shops);
        }else if (shop_type.trim().equals("全部")==false && shop_price.trim().equals("全部")==false){
            shops = shopMapper.DisShopByTypePrice(p);
            System.out.println(shops);
        }
        System.out.println(shops);
        pr.setList(shops);
        pr.setStart(start);
        pr.setCurrentPage(page);
        int totalPage = (int)Math.ceil(pr.getTotalCount() * 1.0 / pageSize);
        pr.setTotalPage(totalPage);
        return pr;
    }

    @Override
    public Pageresult<Shop> DisShopByShopName(String shop_name, int page, int pageSize) {
        Pageresult<Shop> pr = new Pageresult<>();
        int totalCount = shopMapper.CountShopByShopName(shop_name);
        pr.setTotalCount(totalCount);
        int start = (page-1)*pageSize;
        Pageresult p = new Pageresult();
        p.setStart(start);
        p.setPageCount(pageSize);
        p.setShop_name(shop_name);
        List<Shop> shops = shopMapper.DisShopByShopName(p);
        pr.setList(shops);
        pr.setStart(start);
        pr.setCurrentPage(page);
        int totalPage = (int)Math.ceil(totalCount * 1.0 / pageSize);
        pr.setTotalPage(totalPage);
        return pr;
    }

    @Override
    public Pageresult<Menu> DisMenuByMenuName(String menu_name, int page, int pageSize) {
        Pageresult<Menu> pr = new Pageresult<>();
        int totalCount = shopMapper.CountMenuByMenuName(menu_name);
        pr.setTotalCount(totalCount);
        int start = (page - 1) * pageSize;
        Pageresult p = new Pageresult();
        p.setStart(start);
        p.setPageCount(pageSize);
        p.setMenu_name(menu_name);
        List<Menu> menus = shopMapper.DisMenuByMenuName(p);
        pr.setList(menus);
        pr.setStart(start);
        pr.setCurrentPage(page);
        int totalPage = (int) Math.ceil(totalCount * 1.0 / pageSize);
        pr.setTotalPage(totalPage);
        return pr;
    }

    @Override
    public List<Shop> DisShopByIncome() {
        List<Shop> shops = shopMapper.DisShopByIncome();
        return shops;
    }

    @Override
    public int CountMenuByMenuName(String menu_name) {
        int c = shopMapper.CountMenuByMenuName(menu_name);
        return c;
    }

    @Override
    public int CountShopByShopName(String shop_name) {
        int c = shopMapper.CountShopByShopName(shop_name);
        return c;
    }

    @Override
    public int CountAllShop() {
        int c = shopMapper.CountAllShop();
        return c;
    }

    @Override
    public Shop DisShopById(int id) {
        Shop shop = shopMapper.DisShopById(id);
        return shop;
    }

    @Override
    public void UpdateShopById(Shop shop) {
        shopMapper.UpdateShopById(shop);
    }

    @Override
    public void UpdateShopStateById(Shop shop) {
        shopMapper.UpdateShopStateById(shop);
    }

    @Override
    public void UpdateShopImgById(Shop shop) {
        shopMapper.UpdateShopImgById(shop);
    }

    @Override
    public Pageresult<Menu> DisMenuByShopId(int page, int pageSize, int shop_id) {
        Pageresult<Menu> pr = new Pageresult<>();
        int totalCount = shopMapper.CountMenuByShopId(shop_id);
        pr.setTotalCount(totalCount);
        int start = (page-1)*pageSize;
        Pageresult p = new Pageresult();
        p.setStart(start);
        p.setPageCount(pageSize);
        p.setShop_id(shop_id);
        List<Menu> shops = shopMapper.DisMenuByShopId(p);
        pr.setList(shops);
        pr.setStart(start);
        pr.setCurrentPage(page);
        int totalPage = (int)Math.ceil(totalCount * 1.0 / pageSize);
        pr.setTotalPage(totalPage);
        return pr;
    }

    @Override
    public void AddMenu(Menu menu) {
        shopMapper.AddMenu(menu);
    }

    @Override
    public int CountMenuByShopId(int shop_id) {
        int c = shopMapper.CountMenuByShopId(shop_id);
        return c;
    }

    @Override
    public Menu DisMenuById(int menu_id) {
        Menu m = shopMapper.DisMenuById(menu_id);
        return m;
    }

    @Override
    public void UpdateShopIncome(Shop shop) {
        shopMapper.UpdateShopIncome(shop);
    }

    @Override
    public void UpdateMenuSellById(Menu menu) {
        shopMapper.UpdateMenuSellById(menu);
    }

    @Override
    public List<Menu> DisMenuBySell() {
        List<Menu> menus = shopMapper.DisMenuBySell();
        return menus;
    }

    @Override
    public void UpdateMenuMCById(Menu menu) {
        shopMapper.UpdateMenuMCById(menu);
    }

    @Override
    public void UpdateMenuImgById(Menu menu) {
        shopMapper.UpdateMenuImgById(menu);
    }

    @Override
    public void DeleteMenuById(int menu_id) {
        shopMapper.DeleteMenuById(menu_id);
    }

    @Override
    public void UpdateMenuById(Menu menu) {
        shopMapper.UpdateMenuById(menu);
    }

    @Override
    public void AddCart(Cart cart) {
        shopMapper.AddCart(cart);
    }

    @Override
    public List<Cart> DisCartByUserId(int user_id) {
        List<Cart> cart = shopMapper.DisCartByUserId(user_id);
        return cart;
    }

    @Override
    public void UpdateCartById(Cart cart) {
        shopMapper.UpdateCartById(cart);
    }

    @Override
    public void DeleteCartById(Cart cart) {
        shopMapper.DeleteCartById(cart);
    }

    @Override
    public int CountCartByMenuId(Cart cart) {
        int c = shopMapper.CountCartByMenuId(cart);
        return c;
    }

    @Override
    public Cart DisCartByMenuId(Cart cart) {
        Cart cart1 = shopMapper.DisCartByMenuId(cart);
        return cart1;
    }

    @Override
    public void AddAddress(Address address) {
        shopMapper.AddAddress(address);
    }

    @Override
    public List<Address> DisAddressById(int user_id) {
        List<Address> address = shopMapper.DisAddressById(user_id);
        return address;
    }

    @Override
    public void UpdateAddressById(Address address) {
        shopMapper.UpdateAddressById(address);
    }

    @Override
    public void AddComment(Comment comment) {
        shopMapper.AddComment(comment);
    }

    @Override
    public Pageresult<Comment> DisCommentByUserId(int user_id, int page, int pageSize) {
        Pageresult<Comment> pr = new Pageresult<>();
        Comment comment = new Comment();
        comment.setUser_id(user_id);
        int totalCount = shopMapper.CountCommentByUserId(comment);
        pr.setTotalCount(totalCount);
        int start = (page-1)*pageSize;
        Pageresult p = new Pageresult();
        p.setStart(start);
        p.setPageCount(pageSize);
        p.setUser_id(user_id);
        List<Comment> comments = shopMapper.DisCommentByUserId(p);
        pr.setList(comments);
        pr.setStart(start);
        pr.setCurrentPage(page);
        int totalPage = (int)Math.ceil(totalCount * 1.0 / pageSize);
        pr.setTotalPage(totalPage);
        return pr;
    }

    @Override
    public Pageresult<Comment> DisCommentByShopId(int shop_id, int page, int pageSize) {
        Pageresult<Comment> pr = new Pageresult<>();
        int totalCount = shopMapper.CountCommentByShopId(shop_id);
        pr.setTotalCount(totalCount);
        int start = (page-1)*pageSize;
        Pageresult p = new Pageresult();
        p.setStart(start);
        p.setPageCount(pageSize);
        p.setShop_id(shop_id);
        List<Comment> comments = shopMapper.DisCommentByShopId(p);
        pr.setList(comments);
        pr.setStart(start);
        pr.setCurrentPage(page);
        pr.setShop_id(shop_id);
        int totalPage = (int)Math.ceil(totalCount * 1.0 / pageSize);
        pr.setTotalPage(totalPage);
        return pr;
    }

    @Override
    public int CountCommentByUserId(Comment comment) {
        int c = shopMapper.CountCommentByUserId(comment);
        return c;
    }

    @Override
    public void DeleteCommentById(int id) {
        shopMapper.DeleteCommentById(id);
    }

    @Override
    public int CountCommentByShopId(int shop_id) {
        int c = shopMapper.CountCommentByShopId(shop_id);
        return c;
    }

}
