package com.ordering.dao;

import com.ordering.po.Address;
import com.ordering.po.Order;
import com.ordering.po.Order_item;
import com.ordering.po.Pageresult;

import java.util.List;

public interface OrderMapper {
    void AddOrder(Order order);
    void AddOrderItem(Order_item order_item);
    void UpdatePayState(Order order);
    void UpdateCommentState(Order_item order_item);
    void UpdateDeliverState(Order order);
    void UpdateArriveState(Order order);
    void DeleteOrderItem(String order_id);
    void DeleteOrder(String order_id);
    List<Order> DisOrderById(Pageresult pageresult);
    List<Order> DisAllOrder(Pageresult pageresult);
    List<Order> DisSearchOrder(Pageresult pageresult);
    int CountSearchOrder(String order_id);
    int CountOrderById(int user_id);
    int CountAllOrder();
    Address DisAddressById(int id);
    List<Order_item> DisOrderItemById(String order_id);
    List<Address> DisAddressByUserId(Pageresult pageresult);
    int CountAddressByUserId(int user_id);
}
