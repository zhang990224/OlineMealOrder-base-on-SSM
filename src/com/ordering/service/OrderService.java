package com.ordering.service;

import com.ordering.po.Address;
import com.ordering.po.Order;
import com.ordering.po.Order_item;
import com.ordering.po.Pageresult;

import java.util.List;

public interface OrderService {
    void AddOrder(Order order);
    void AddOrderItem(Order_item order_item);
    void UpdatePayState(Order order);
    void UpdateDeliverState(Order order);
    void UpdateArriveState(Order order);
    void DeleteOrderItem(String order_id);
    void DeleteOrder(String order_id);
    Pageresult<Order> DisOrderById(int user_id,int page,int pageSize);
    Pageresult<Order> DisAllOrder(int page,int pageSize);
    Pageresult<Order> DisSearchOrder(String order_id,int page,int pageSize);
    int CountAllOrder();
    int CountSearchOrder(String order_id);
    Address DisAddressById(int id);
    List<Order_item> DisOrderItemById(String order_id);
    Pageresult<Address> DisAddressByUserId(int user_id,int page,int pageSize);
    int CountAddressByUserId(int user_id);
    void UpdateCommentState(Order_item order_item);
}
