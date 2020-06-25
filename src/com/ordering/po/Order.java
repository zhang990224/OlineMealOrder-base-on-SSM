package com.ordering.po;

import java.sql.Date;
import java.util.List;

public class Order {
    private int id;
    private String order_id;
    private int user_id;
    private int price;
    private int address_id;
    private int paystate; //支付状态：0表示未支付，1表示已支付
    private int deliverstate;//发货状态
    private int arrivestate;//收货状态
    private Date createtime;
    private List<Order_item> orderItems;//订单下的所有详情
    private User user;
    private Address address;

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getAddress_id() {
        return address_id;
    }

    public void setAddress_id(int address_id) {
        this.address_id = address_id;
    }

    public int getPaystate() {
        return paystate;
    }

    public void setPaystate(int paystate) {
        this.paystate = paystate;
    }

    public int getDeliverstate() {
        return deliverstate;
    }

    public void setDeliverstate(int deliverstate) {
        this.deliverstate = deliverstate;
    }

    public int getArrivestate() {
        return arrivestate;
    }

    public void setArrivestate(int arrivestate) {
        this.arrivestate = arrivestate;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public List<Order_item> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<Order_item> orderItems) {
        this.orderItems = orderItems;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", order_id='" + order_id + '\'' +
                ", user_id=" + user_id +
                ", price=" + price +
                ", address_id=" + address_id +
                ", paystate=" + paystate +
                ", deliverstate=" + deliverstate +
                ", arrivestate=" + arrivestate +
                ", createtime=" + createtime +
                ", orderItems=" + orderItems +
                ", user=" + user +
                '}';
    }
}