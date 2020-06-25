package com.ordering.po;

public class Order_item {

    private int orderitem_id;
    private String order_id;
    private int menu_id;//产品id
    private int buynum;//购买的数量
    private Order order;//订单
    private Menu menu;//产品
    private int totalprice;
    private int commentstate;//是否评论

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public int getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(int totalprice) {
        this.totalprice = totalprice;
    }

    public int getOrderitem_id() {
        return orderitem_id;
    }

    public void setOrderitem_id(int orderitem_id) {
        this.orderitem_id = orderitem_id;
    }

    public int getMenu_id() {
        return menu_id;
    }

    public void setMenu_id(int menu_id) {
        this.menu_id = menu_id;
    }

    public int getBuynum() {
        return buynum;
    }

    public void setBuynum(int buynum) {
        this.buynum = buynum;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }

    public int getCommentstate() {
        return commentstate;
    }

    public void setCommentstate(int commentstate) {
        this.commentstate = commentstate;
    }

    @Override
    public String toString() {
        return "Order_item{" +
                "orderitem_id=" + orderitem_id +
                ", order_id='" + order_id + '\'' +
                ", menu_id=" + menu_id +
                ", buynum=" + buynum +
                ", order=" + order +
                ", menu=" + menu +
                ", totalprice=" + totalprice +
                ", commentstate=" + commentstate +
                '}';
    }
}
