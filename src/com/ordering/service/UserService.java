package com.ordering.service;

import com.ordering.po.Admin;
import com.ordering.po.Collect;
import com.ordering.po.Pageresult;
import com.ordering.po.User;


public interface UserService {
    Pageresult<User> DisAllUser(int page,int pageSize);
    int CountAllUser();
    Pageresult<User> DisSearchUser(String username,int page,int pageSize);
    int CountSearchUser(String username);
    void updateUserSateById(User user);
    int findUserName(String username);
    int findEmail(String email);
    int findPhone(String phone);
    void insertUser(User user);
    int findUserNameUser(User user);
    int findEmailUser(User user);
    int findPhoneUser(User user);
    User findUserByName(String username);
    User findUserByEmail(String email);
    User findUserByPhone(String phone);
    void updateHeadById(User user);
    void updatePswById(User user);
    int CountShopCollectedById(int shop_id);
    int CountUserCollectById(Collect collect);
    void CollectShop(Collect collect);
    void CanelCollectShop(Collect collect);
    Pageresult<Collect> DisCollectShopByUserId(int user_id,int page,int pageSize);
    int CountCollectShopByUserId(int user_id);
    int FindAdmin(Admin admin);
}
