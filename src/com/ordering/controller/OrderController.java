package com.ordering.controller;

import com.ordering.po.*;
import com.ordering.service.OrderService;
import com.ordering.service.ShopService;
import com.ordering.utils.CreateOrderId;
import org.aspectj.weaver.ast.Or;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Resource
    private OrderService orderService;
    @Resource
    private ShopService shopService;

    @RequestMapping("createOrder")
    public String createOrder(Model model, HttpServletRequest request,int address_id,int price){
        User user = (User)request.getSession(true).getAttribute("user");
        int[] ids = (int[])request.getSession(true).getAttribute("ids");
        if (user!=null){
            CreateOrderId ci = new CreateOrderId();
            String order_id = (String) ci.doOrderNum();
            Order order = new Order();
            order.setAddress_id(address_id);
            order.setUser_id(user.getId());
            order.setOrder_id(order_id);
            order.setArrivestate(0);
            order.setDeliverstate(0);
            order.setPaystate(0);
            order.setPrice(price);
            orderService.AddOrder(order);
            Order_item order_item = new Order_item();
            order_item.setOrder_id(order_id);
            order_item.setCommentstate(0);
            Cart cart = new Cart();
            cart.setUser_id(user.getId());
            for (int i = 0;i<ids.length;i++){
                cart.setMenu_id(ids[i]);
                Cart c = shopService.DisCartByMenuId(cart);
                order_item.setMenu_id(ids[i]);
                order_item.setBuynum(c.getMenu_num());
                order_item.setTotalprice(c.getMenu_num()*c.getMenu().getMenu_price());
                orderService.AddOrderItem(order_item);
                shopService.DeleteCartById(cart);
            }
            HttpSession session = request.getSession();
            session.setAttribute("order_id",order_id);
            return "order_success";
        }else{
            model.addAttribute("result","未登录");
            return "tishi";
        }
    }

    @RequestMapping("updatePayState")
    public void UpdatePayState(HttpServletRequest request, HttpServletResponse response,int paystate,String order_id,int isOrder) throws IOException {
        User user = (User)request.getSession(true).getAttribute("user");
        String oid = (String)request.getSession(true).getAttribute("order_id");
        if (user!=null){
            System.out.println(order_id);
            Order order = new Order();
            order.setPaystate(paystate);
            if (isOrder==1){
                order.setOrder_id(oid);
            }else{
                order.setOrder_id(order_id.trim());
            }
            orderService.UpdatePayState(order);
            if (paystate==1){
                response.getWriter().write("1");
            }else if (paystate==2){
                response.getWriter().write("2");
            }
        }else{
            response.getWriter().write("未登录，操作失败");
        }
    }

    @RequestMapping("disOrderById")
    public String DisOrderById(Model model, HttpServletRequest request,int page,int pageSize){
        User user = (User)request.getSession(true).getAttribute("user");
        if (user!=null){
            Pageresult<Order> pageresult = orderService.DisOrderById(user.getId(),page,pageSize);
            model.addAttribute("orderlist",pageresult);
            return "user_orderlist";
        }else{
            model.addAttribute("result","未登录");
            return "tishi";
        }
    }

    @RequestMapping("disOrder")
    public String DisAllOrder(Model model, HttpServletRequest request,int page,String orderId) {
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin != null) {
            if (orderId == "") {
                Pageresult pageresult = orderService.DisAllOrder(page, 6);
                int count = orderService.CountAllOrder();
                model.addAttribute("all", pageresult);
                model.addAttribute("num", count);
                model.addAttribute("orderId", orderId.trim());
            }else{
                Pageresult pageresult = orderService.DisSearchOrder(orderId, page, 6);
                int count = orderService.CountSearchOrder(orderId);
                model.addAttribute("all", pageresult);
                model.addAttribute("num", count);
                model.addAttribute("orderId", orderId.trim());
            }
            return "admin_order";
        } else {
            model.addAttribute("result", "404!");
            return "tishi";
        }
    }

    @RequestMapping("disOrderItemById")
    public String DisOrderItemById(Model model, HttpServletRequest request,int address_id,String order_id,int isuser){
        User user = (User)request.getSession(true).getAttribute("user");
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (user!=null || admin!=null){
            if (isuser==1){
                List<Order_item> order_item = orderService.DisOrderItemById(order_id);
                Address address = orderService.DisAddressById(address_id);
                model.addAttribute("order_item",order_item);
                model.addAttribute("address",address);
                return "user_order";
            }else{
                List<Order_item> order_item = orderService.DisOrderItemById(order_id);
                Address address = orderService.DisAddressById(address_id);
                model.addAttribute("order_item",order_item);
                model.addAttribute("address",address);
                return "admin_orderitem";
            }
        }else{
            model.addAttribute("result","未登录");
            return "tishi";
        }
    }

    @RequestMapping("DisAddressById")
    public String DisAddressById(Model model, HttpServletRequest request,int page,int pageSize){
        User user = (User)request.getSession(true).getAttribute("user");
        if (user!=null){
            Pageresult<Address> address = orderService.DisAddressByUserId(user.getId(),page,pageSize);
            model.addAttribute("address",address);
            return "user_address";
        }else{
            model.addAttribute("result","未登录");
            return "tishi";
        }
    }

    @RequestMapping("updateAddressById")
    public void UpdateAddressById(HttpServletRequest request, HttpServletResponse response,String name,String phone,String address,int id) throws IOException {
        User user = (User) request.getSession(true).getAttribute("user");
        if (user!=null){
            Address ad = new Address();
            ad.setUser_id(user.getId());
            ad.setId(id);
            ad.setReceiver_name(name.trim());
            ad.setReceiver_phone(phone.trim());
            ad.setReceiver_address(address);
            shopService.UpdateAddressById(ad);
            response.getWriter().write("1");
        }else{
            response.getWriter().write("2");
        }
    }

    @RequestMapping("updateReceiveState")
    public String UpdateReceiveState(Model model,HttpServletRequest request,int orderitem_id,String order_id,int address_id) throws IOException {
        User user = (User) request.getSession(true).getAttribute("user");
        if (user!=null){
            Order_item order_item = new Order_item();
            order_item.setCommentstate(1);
            order_item.setOrderitem_id(orderitem_id);
            orderService.UpdateCommentState(order_item);
            return "redirect:/order/disOrderItemById.do?order_id="+order_id+"&address_id="+address_id+"&isuser=1";
        }else{
            model.addAttribute("result","未登录");
            return "tishi";
        }
    }

    @RequestMapping("addComment")
    public void AddComment(HttpServletRequest request, HttpServletResponse response,String content,int orderitem_id,int menu_id,int shop_id) throws IOException {
        User user = (User) request.getSession(true).getAttribute("user");
        if (user!=null){
            Comment comment = new Comment();
            comment.setUser_id(user.getId());
            comment.setMenu_id(menu_id);
            comment.setShop_id(shop_id);
            comment.setContent(content.trim());
            shopService.AddComment(comment);
            Order_item order_item = new Order_item();
            order_item.setCommentstate(2);
            order_item.setOrderitem_id(orderitem_id);
            orderService.UpdateCommentState(order_item);
            response.getWriter().write("1");
        }else{
            response.getWriter().write("2");
        }
    }

    @RequestMapping("updateDState")
    public void updateDState(HttpServletRequest request, HttpServletResponse response,String order_id) throws IOException {
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        System.out.println(order_id);
        if (admin!=null){
            Order order = new Order();
            order.setOrder_id(order_id.trim());
            order.setDeliverstate(1);
            orderService.UpdateDeliverState(order);
            response.getWriter().write("1");
        }else{
            response.getWriter().write("0");
        }
    }

    @RequestMapping("updateAState")
    public void updateAState(HttpServletRequest request, HttpServletResponse response,String order_id) throws IOException {
        User user = (User)request.getSession().getAttribute("user");
        System.out.println(order_id);
        if (user!=null){
            Order order = new Order();
            order.setOrder_id(order_id.trim());
            order.setArrivestate(1);
            orderService.UpdateArriveState(order);
            response.getWriter().write("1");
        }else{
            response.getWriter().write("0");
        }
    }

    @RequestMapping("deleteOrder")
    public String DeleteOrder(Model model,HttpServletRequest request,String order_id){
        Admin admin = (Admin)request.getSession().getAttribute("admin");
        if (admin!=null){
            orderService.DeleteOrder(order_id.trim());
            orderService.DeleteOrderItem(order_id.trim());
            return "redirect:disOrder.do?page=1&orderId=";
        }else{
            model.addAttribute("result","未登录");
            return "tishi";
        }
    }
}
