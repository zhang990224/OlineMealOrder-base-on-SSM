package com.ordering.dao;

import com.ordering.po.Admin;
import com.ordering.po.Collect;
import com.ordering.po.Pageresult;
import com.ordering.po.User;

import java.util.List;

public interface UserMapper {
    List<User> DisAllUser(Pageresult pageresult);
    int CountAllUser();
    List<User> DisSearchUser(Pageresult pageresult);
    void updateUserSateById(User user);
    int CountSearchUser(String username);
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
    List<Collect> DisCollectShopByUserId(Pageresult pageresult);
    int CountCollectShopByUserId(int user_id);
    int FindAdmin(Admin admin);
}
