package com.ordering.service.Impl;

import com.ordering.dao.OrderMapper;
import com.ordering.po.Address;
import com.ordering.po.Order;
import com.ordering.po.Order_item;
import com.ordering.po.Pageresult;
import com.ordering.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Resource
    private OrderMapper orderMapper;

    @Override
    public void AddOrder(Order order) {
        orderMapper.AddOrder(order);
    }

    @Override
    public void AddOrderItem(Order_item order_item) {
        orderMapper.AddOrderItem(order_item);
    }

    @Override
    public void UpdatePayState(Order order) {
        orderMapper.UpdatePayState(order);
    }

    @Override
    public void UpdateDeliverState(Order order) {
        orderMapper.UpdateDeliverState(order);
    }

    @Override
    public void UpdateArriveState(Order order) {
        orderMapper.UpdateArriveState(order);
    }

    @Override
    public void DeleteOrderItem(String order_id) {
        orderMapper.DeleteOrderItem(order_id);
    }

    @Override
    public void DeleteOrder(String order_id) {
        orderMapper.DeleteOrder(order_id);
    }

    @Override
    public Pageresult<Order> DisOrderById(int user_id, int page, int pageSize) {
        Pageresult<Order> pr = new Pageresult<>();
        int totalCount = orderMapper.CountOrderById(user_id);
        pr.setTotalCount(totalCount);
        int start = (page-1)*pageSize;
        Pageresult p = new Pageresult();
        p.setStart(start);
        p.setPageCount(pageSize);
        p.setUser_id(user_id);
        List<Order> orders = orderMapper.DisOrderById(p);
        pr.setList(orders);
        pr.setStart(start);
        pr.setCurrentPage(page);
        int totalPage = (int)Math.ceil(totalCount * 1.0 / pageSize);
        pr.setTotalPage(totalPage);
        return pr;
    }

    @Override
    public Pageresult<Order> DisAllOrder(int page, int pageSize) {
        Pageresult<Order> pr = new Pageresult<>();
        int totalCount = orderMapper.CountAllOrder();
        pr.setTotalCount(totalCount);
        int start = (page-1)*pageSize;
        Pageresult p = new Pageresult();
        p.setStart(start);
        p.setPageCount(pageSize);
        List<Order> orders = orderMapper.DisAllOrder(p);
        pr.setList(orders);
        pr.setStart(start);
        pr.setCurrentPage(page);
        int totalPage = (int)Math.ceil(totalCount * 1.0 / pageSize);
        pr.setTotalPage(totalPage);
        return pr;
    }

    @Override
    public Pageresult<Order> DisSearchOrder(String order_id, int page, int pageSize) {
        Pageresult<Order> pr = new Pageresult<>();
        int totalCount = orderMapper.CountSearchOrder(order_id);
        pr.setTotalCount(totalCount);
        int start = (page-1)*pageSize;
        Pageresult p = new Pageresult();
        p.setStart(start);
        p.setPageCount(pageSize);
        p.setOrder_id(order_id);
        List<Order> orders = orderMapper.DisSearchOrder(p);
        pr.setList(orders);
        pr.setStart(start);
        pr.setCurrentPage(page);
        int totalPage = (int)Math.ceil(totalCount * 1.0 / pageSize);
        pr.setTotalPage(totalPage);
        return pr;
    }

    @Override
    public int CountAllOrder() {
        int c = orderMapper.CountAllOrder();
        return c;
    }

    @Override
    public int CountSearchOrder(String order_id) {
        int c = orderMapper.CountSearchOrder(order_id);
        return c;
    }

    @Override
    public Address DisAddressById(int id) {
        Address address = orderMapper.DisAddressById(id);
        return address;
    }

    @Override
    public List<Order_item> DisOrderItemById(String order_id) {
        List<Order_item> order_item = orderMapper.DisOrderItemById(order_id);
        return order_item;
    }

    @Override
    public Pageresult<Address> DisAddressByUserId(int user_id, int page, int pageSize) {
        Pageresult<Address> pr = new Pageresult<>();
        int totalCount = orderMapper.CountAddressByUserId(user_id);
        pr.setTotalCount(totalCount);
        int start = (page-1)*pageSize;
        Pageresult p = new Pageresult();
        p.setStart(start);
        p.setPageCount(pageSize);
        p.setUser_id(user_id);
        List<Address> addresses = orderMapper.DisAddressByUserId(p);
        pr.setList(addresses);
        pr.setStart(start);
        pr.setCurrentPage(page);
        int totalPage = (int)Math.ceil(totalCount * 1.0 / pageSize);
        pr.setTotalPage(totalPage);
        return pr;
    }

    @Override
    public int CountAddressByUserId(int user_id) {
        int c = orderMapper.CountAddressByUserId(user_id);
        return c;
    }

    @Override
    public void UpdateCommentState(Order_item order_item) {
        orderMapper.UpdateCommentState(order_item);
    }
}
