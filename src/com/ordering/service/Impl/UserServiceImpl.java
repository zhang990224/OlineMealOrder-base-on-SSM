package com.ordering.service.Impl;

import com.ordering.dao.UserMapper;
import com.ordering.po.Admin;
import com.ordering.po.Collect;
import com.ordering.po.Pageresult;
import com.ordering.po.User;
import com.ordering.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public Pageresult<User> DisAllUser(int page, int pageSize) {
        Pageresult<User> pr = new Pageresult<>();
        int totalCount = userMapper.CountAllUser();
        pr.setTotalCount(totalCount);
        int start = (page-1)*pageSize;
        Pageresult p = new Pageresult();
        p.setStart(start);
        p.setPageCount(pageSize);
        List<User> users = userMapper.DisAllUser(p);
        pr.setList(users);
        pr.setStart(start);
        pr.setCurrentPage(page);
        int totalPage = (int)Math.ceil(totalCount * 1.0 / pageSize);
        pr.setTotalPage(totalPage);
        return pr;
    }

    @Override
    public int CountAllUser() {
        int c = userMapper.CountAllUser();
        return c;
    }

    @Override
    public Pageresult<User> DisSearchUser(String username, int page, int pageSize) {
        Pageresult<User> pr = new Pageresult<>();
        int totalCount = userMapper.CountSearchUser(username);
        pr.setTotalCount(totalCount);
        int start = (page-1)*pageSize;
        Pageresult p = new Pageresult();
        p.setStart(start);
        p.setUsername(username);
        p.setPageCount(pageSize);
        List<User> users = userMapper.DisSearchUser(p);
        pr.setList(users);
        pr.setStart(start);
        pr.setCurrentPage(page);
        int totalPage = (int)Math.ceil(totalCount * 1.0 / pageSize);
        pr.setTotalPage(totalPage);
        return pr;
    }

    @Override
    public int CountSearchUser(String username) {
        int c = userMapper.CountSearchUser(username);
        return c;
    }

    @Override
    public void updateUserSateById(User user) {
        userMapper.updateUserSateById(user);
    }

    @Override
    public int findUserName(String username) {
        int c = userMapper.findUserName(username);
        return c;
    }

    @Override
    public int findEmail(String email) {
        int c = userMapper.findEmail(email);
        return c;
    }

    @Override
    public int findPhone(String phone) {
        int c = userMapper.findPhone(phone);
        return c;
    }

    @Override
    public void insertUser(User user) {
        userMapper.insertUser(user);
    }

    @Override
    public int findUserNameUser(User user) {
        int c = userMapper.findUserNameUser(user);
        return c;
    }

    @Override
    public int findEmailUser(User user) {
        int c = userMapper.findEmailUser(user);
        return c;
    }

    @Override
    public int findPhoneUser(User user) {
        int c = userMapper.findPhoneUser(user);
        return c;
    }

    @Override
    public User findUserByName(String username) {
        User user = userMapper.findUserByName(username);
        return user;
    }

    @Override
    public User findUserByEmail(String email) {
        User user = userMapper.findUserByEmail(email);
        return user;
    }

    @Override
    public User findUserByPhone(String phone) {
        User user = userMapper.findUserByPhone(phone);
        return user;
    }

    @Override
    public void updateHeadById(User user) {
        userMapper.updateHeadById(user);
    }

    @Override
    public void updatePswById(User user) {
        userMapper.updatePswById(user);
    }

    @Override
    public int CountShopCollectedById(int shop_id) {
        int c = userMapper.CountShopCollectedById(shop_id);
        return c;
    }

    @Override
    public int CountUserCollectById(Collect collect) {
        int c = userMapper.CountUserCollectById(collect);
        return c;
    }

    @Override
    public void CollectShop(Collect collect) {
        userMapper.CollectShop(collect);
    }

    @Override
    public void CanelCollectShop(Collect collect) {
        userMapper.CanelCollectShop(collect);
    }

    @Override
    public Pageresult<Collect> DisCollectShopByUserId(int user_id, int page, int pageSize) {
        Pageresult<Collect> pr = new Pageresult<>();
        int totalCount = userMapper.CountCollectShopByUserId(user_id);
        pr.setTotalCount(totalCount);
        int start = (page-1)*pageSize;
        Pageresult p = new Pageresult();
        p.setStart(start);
        p.setPageCount(pageSize);
        p.setUser_id(user_id);
        List<Collect> collects = userMapper.DisCollectShopByUserId(p);
        pr.setList(collects);
        pr.setStart(start);
        pr.setCurrentPage(page);
        int totalPage = (int)Math.ceil(totalCount * 1.0 / pageSize);
        pr.setTotalPage(totalPage);
        return pr;
    }

    @Override
    public int CountCollectShopByUserId(int user_id) {
        int c = userMapper.CountCollectShopByUserId(user_id);
        return c;
    }

    @Override
    public int FindAdmin(Admin admin) {
        int c = userMapper.FindAdmin(admin);
        return c;
    }
}
