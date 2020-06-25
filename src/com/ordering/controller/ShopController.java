package com.ordering.controller;

import com.ordering.po.*;
import com.ordering.service.ShopService;
import com.ordering.service.UserService;
import com.ordering.utils.UploadImg;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/shop")
public class ShopController {

    @Resource
    private ShopService shopService;
    @Resource
    private UserService userService;

    @RequestMapping("AddShop")
    public String AddShop(HttpServletRequest request,Model model,String sname,String stype,String sspecial,String sdiscount,String sprice,MultipartFile upload,String saddress,String sphone,String sopentime) throws IOException {
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin != null) {
            Shop s = new Shop();
            s.setShop_special(sspecial.trim());
            s.setShop_state(1);
            s.setShop_phone(sphone.trim());
            s.setShop_discount(sdiscount.trim());
            s.setShop_address(saddress.trim());
            s.setOpentime(sopentime.trim());
            s.setShop_price(sprice.trim());
            s.setShop_type(stype.trim());
            s.setShop_income(0);
            s.setShop_name(sname.trim());
            String file = UploadImg.Upload(upload,request);
            s.setShop_img(file.trim());
            shopService.AddShop(s);
            return "redirect:disShop.do?page=1&shop=";
        }else{
            model.addAttribute("result","404!");
            return "tishi";
        }
    }

    @RequestMapping("AddMenu")
    public String AddMenu(HttpServletRequest request,Model model,String mname,int mprice,int mcount,MultipartFile upload,String shop_id) throws IOException {
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin != null) {
            int s = Integer.parseInt(shop_id);
            Menu m = new Menu();
            m.setMenu_count(mcount);
            m.setMenu_name(mname.trim());
            m.setMenu_sell(0);
            m.setMenu_price(mprice);
            m.setShop_id(s);
            String file = UploadImg.Upload(upload,request);
            m.setMenu_img(file);
            shopService.AddMenu(m);
            return "redirect:disMenuByShop.do?page=1&id="+s;
        }else{
            model.addAttribute("result","404!");
            return "tishi";
        }
    }

    @RequestMapping("disAllShop")
    public String DisAllShop(Model model,int page,String shop_type,String shop_price){
        Pageresult pageresult = shopService.DisShopByTJ(shop_type,shop_price,page,4);
        model.addAttribute("allshop",pageresult);
        model.addAttribute("price","全部");
        model.addAttribute("type","全部");
        return "shop_list";
    }

    @RequestMapping("updateShopById")
    public void UpdateShopById(HttpServletRequest request,HttpServletResponse response,int id,String phone,String address,String special,String price,String discount,String opentime,String type) throws IOException {
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin != null) {
            Shop s = new Shop();
            s.setId(id);
            s.setShop_type(type.trim());
            s.setShop_price(price.trim());
            s.setOpentime(opentime.trim());
            s.setShop_address(address.trim());
            s.setShop_discount(discount.trim());
            s.setShop_phone(phone.trim());
            s.setShop_special(special.trim());
            System.out.println(s);
            shopService.UpdateShopById(s);
            response.getWriter().write("1");
        }else{
            response.getWriter().write("2");
        }
    }

    @RequestMapping("updateMenuById")
    public void UpdateMenuById(HttpServletRequest request,HttpServletResponse response,int id,int price,int count) throws IOException {
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin != null) {
            Menu m = new Menu();
            m.setMenu_id(id);
            m.setMenu_price(price);
            m.setMenu_count(count);
            shopService.UpdateMenuMCById(m);
            response.getWriter().write("1");
        } else{
            response.getWriter().write("2");
        }
    }

    @RequestMapping("updateShopStateById")
    public void updateShopStateById(HttpServletRequest request,HttpServletResponse response,int id,int state) throws IOException {
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin != null) {
            Shop s = new Shop();
            s.setId(id);
            if (state==1){
                s.setShop_state(0);
            }else{
                s.setShop_state(1);
            }
            shopService.UpdateShopStateById(s);
            response.getWriter().write("1");
        }else{
            response.getWriter().write("2");
        }
    }

    @RequestMapping("disShop")
    public String DisShop(Model model,HttpServletRequest request,int page,String shop){
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin != null) {
            Pageresult pageresult = shopService.DisAllShop(page, 5,shop);
            int count = 0;
            if (shop == "") {
                count = shopService.CountAllShop();
            } else {
                count = shopService.CountShopByShopName(shop.trim());
            }
            model.addAttribute("all", pageresult);
            model.addAttribute("num", count);
            model.addAttribute("shop",shop);
            return "admin_shop";
        }else{
            model.addAttribute("result","404!");
            return "tishi";
        }
    }

    @RequestMapping("disShopById")
    public String DisShopById(Model model,HttpServletRequest request,int page,int id){
        Pageresult pageresult = shopService.DisMenuByShopId(page,4,id);
        Shop shop = shopService.DisShopById(id);
        int countC = userService.CountShopCollectedById(id);
        model.addAttribute("countC",countC);
        model.addAttribute("shop",shop);
        model.addAttribute("allmenu",pageresult);
        Pageresult pageresult1 = shopService.DisCommentByShopId(id,page,3);
        model.addAttribute("comments",pageresult1);
        int cou = shopService.CountCommentByShopId(id);
        model.addAttribute("count",cou);
        User user = (User) request.getSession(true).getAttribute("user");
        if (user!=null){
            Collect collect = new Collect();
            collect.setShop_id(id);
            collect.setUser_id(user.getId());
            int c = userService.CountUserCollectById(collect);
            if (c == 1){
                model.addAttribute("ct","★ 已收藏");
            }else{
                model.addAttribute("ct","☆ 可收藏");
            }
        }else{
            model.addAttribute("ct","☆ 可收藏");
        }
        return "shop";
    }

    @RequestMapping("disMenuByShop")
    public String DisMenuByShop(Model model,HttpServletRequest request,int page,int id) {
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin != null) {
            Pageresult pageresult = shopService.DisMenuByShopId(page,5, id);
            System.out.println(pageresult.getList());
            model.addAttribute("all",pageresult);
            model.addAttribute("shop_id",id);
            return "admin_menu";
        }else{
            model.addAttribute("result","404!");
            return "tishi";
        }
    }

    @RequestMapping("disSearchShop")
    public String DisSearchShop(Model model,int page,int isShop,String content){
        if (isShop==1){
            Pageresult pageresult = shopService.DisShopByShopName(content,page,4);
            int count = shopService.CountShopByShopName(content);
            model.addAttribute("count",count);
            model.addAttribute("search",pageresult);
            model.addAttribute("sname",content);
            return "search_s";
        }else{
            Pageresult pageresult = shopService.DisMenuByMenuName(content,page,4);
            int count = shopService.CountMenuByMenuName(content);
            model.addAttribute("count",count);
            model.addAttribute("search",pageresult);
            model.addAttribute("mname",content);
            return "search_m";
        }
    }

    @RequestMapping("disMenuById")
    public String DisMenuById(Model model,int id){
        Menu menu = shopService.DisMenuById(id);
        model.addAttribute("menu",menu);
        return "detailsp";
    }

    @RequestMapping("disCartById")
    public String DisCartById(Model model, HttpServletRequest request){
        User user = (User) request.getSession(true).getAttribute("user");
        List<Cart> cart = shopService.DisCartByUserId(user.getId());
        model.addAttribute("cart",cart);
        return "cart";
    }

    @RequestMapping("addCart")
    public void AddCart(HttpServletRequest request, HttpServletResponse response,int menu_id,int menu_num) throws IOException {
        User user = (User) request.getSession(true).getAttribute("user");
        if (user!=null){
            Cart cart = new Cart();
            cart.setMenu_id(menu_id);
            cart.setMenu_num(menu_num);
            cart.setUser_id(user.getId());
            int c = shopService.CountCartByMenuId(cart);
            Menu m = shopService.DisMenuById(menu_id);
            if (m.getShop().getShop_state()==1){
                if (c==0){
                    shopService.AddCart(cart);
                }else{
                    Cart ca = shopService.DisCartByMenuId(cart);
                    cart.setMenu_num(ca.getMenu_num()+menu_num);
                    shopService.UpdateCartById(cart);
                }
                response.getWriter().write("1");
            }else{
                response.getWriter().write("2");
            }
        }else{
            response.getWriter().write("0");
        }
    }

    @RequestMapping("czcollect")
    public void CZCollect(HttpServletRequest request, HttpServletResponse response, int id) throws IOException {
        User user = (User) request.getSession(true).getAttribute("user");
        if (user!= null) {
            Collect collect = new Collect();
            collect.setUser_id(user.getId());
            collect.setShop_id(id);
            int c = userService.CountUserCollectById(collect);
            if (c>0){
                userService.CanelCollectShop(collect);
                int count = userService.CountShopCollectedById(id);
                response.getWriter().write("0,"+count);
            }else{
                userService.CollectShop(collect);
                int count = userService.CountShopCollectedById(id);
                response.getWriter().write("1,"+count);
            }
        }else{
            response.getWriter().write("2,0");
        }
    }

    @RequestMapping("disCollectShopById")
    public String DisCollectShopById(Model model,HttpServletRequest request,int page,int pageSize){
        User user = (User) request.getSession(true).getAttribute("user");
        if (user!= null) {
            Pageresult pageresult = userService.DisCollectShopByUserId(user.getId(),page,pageSize);
            model.addAttribute("collect",pageresult);
            return "user_collect";
        }else {
            model.addAttribute("result", "未登录");
            return "tishi";
        }
    }


    @RequestMapping("updateCart")
    public void UpdateCart(HttpServletRequest request, HttpServletResponse response,int menu_id,int menu_num) throws IOException {
        User user = (User)request.getSession(true).getAttribute("user");
        if (user!=null){
            Menu menu = shopService.DisMenuById(menu_id);
            Cart cart = new Cart();
            cart.setMenu_num(menu_num);
            cart.setUser_id(user.getId());
            cart.setMenu_id(menu_id);
            if (menu_num>0){
                if (menu.getMenu_count()>=menu_num){
                    shopService.UpdateCartById(cart);
                    response.getWriter().write("1");
                }else{
                    response.getWriter().write("2");
                }
            }else{
                shopService.DeleteCartById(cart);
                response.getWriter().write("0");
            }
        }else{
            response.getWriter().write("未登录，操作购物车失败!");
        }
    }

    @RequestMapping("deleteCart")
    public void deleteCart(HttpServletRequest request, HttpServletResponse response,int menu_id) throws IOException {
        User user = (User) request.getSession(true).getAttribute("user");
        if (user != null) {
            Cart cart = new Cart();
            cart.setUser_id(user.getId());
            cart.setMenu_id(menu_id);
            shopService.DeleteCartById(cart);
            response.getWriter().write("1");
        } else {
            response.getWriter().write("0");
        }
    }

    //提交购物车准备生成订单
    @RequestMapping("confirmCart")
    public String ConfirmCart(Model model,HttpServletRequest request,int id[],int isall){
        User user = (User)request.getSession(true).getAttribute("user");
        if (user!=null){
            List<Address> address = shopService.DisAddressById(user.getId());
            if (isall == 1){
                List<Cart> carts = shopService.DisCartByUserId(user.getId());
                model.addAttribute("carts",carts);
            }else{
                List<Cart> carts = new ArrayList<>();
                Cart c = new Cart();
                c.setUser_id(user.getId());
                for (int i = 0;i<id.length;i++){
                    Menu me = shopService.DisMenuById(id[i]);
                    Shop sh = shopService.DisShopById(me.getShop_id());
                    c.setMenu_id(id[i]);
                    Cart cart = shopService.DisCartByMenuId(c);
                    if (cart.getMenu().getMenu_count()>=cart.getMenu_num()){
                        carts.add(cart);
                        Menu m = new Menu();
                        m.setMenu_id(cart.getMenu_id());
                        m.setMenu_count(cart.getMenu().getMenu_count()-cart.getMenu_num());
                        m.setMenu_sell(cart.getMenu_num());
                        shopService.UpdateMenuById(m);
                        shopService.UpdateMenuSellById(m);
                        Shop shop = new Shop();
                        shop.setId(me.getShop_id());
                        shop.setShop_income(sh.getShop_income()+(cart.getMenu_num()*cart.getMenu().getMenu_price()));
                        shopService.UpdateShopIncome(shop);

                    }
                }
                model.addAttribute("carts",carts);
            }
            model.addAttribute("address",address);
        }else{
            List<Cart> carts = null;
            model.addAttribute("carts",carts);
        }
        HttpSession session = request.getSession();
        session.setAttribute("ids",id);
        model.addAttribute("isall",isall);
        return "confirm_order";
    }

    @RequestMapping("addAddress")
    public String AddAddress(Model model,HttpServletRequest request,String name,String phone,String address,int isall,int iscart) {
        User user = (User) request.getSession(true).getAttribute("user");
        int[] ids = (int[])request.getSession(true).getAttribute("ids");
        if (user != null) {
            if (iscart==1){
                Address ad = new Address();
                ad.setUser_id(user.getId());
                ad.setReceiver_name(name);
                ad.setReceiver_phone(phone);
                ad.setReceiver_address(address);
                shopService.AddAddress(ad);
                return "redirect:/order/DisAddressById.do?page=1&pageSize=6";
            }else{
                Address ad = new Address();
                ad.setUser_id(user.getId());
                ad.setReceiver_name(name);
                ad.setReceiver_phone(phone);
                ad.setReceiver_address(address);
                shopService.AddAddress(ad);
                return "redirect:disCartById.do";
            }
        } else {
            model.addAttribute("result", "未登录，操作无效");
            return "tishi";
        }
    }

    @RequestMapping("returnHead")
    public void ReturnHead(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) throws IOException {
        Admin admin = (Admin)request.getSession().getAttribute("admin");
        if (admin!=null){
            final String[] IMAGE_TYPE = new String[] { ".bmp", ".jpg", ".jpeg", ".png" };
            String path = request.getSession().getServletContext().getRealPath("/upload/");
            //判断该路径是否存在
            File file = new File(path);
            if (!file.exists()) {
                //如果这个文件夹不存在的话,就创建这个文件
                file.mkdirs();
            }
            //获取上传文件名称
            String filename = upload.getOriginalFilename();
            System.out.println(filename);
            //把文件名称设置成唯一值 uuid 以防止文件名相同覆盖
            String uuid = UUID.randomUUID().toString().replace("-", "");
            //新文件名
            filename = uuid + "_" + filename;
            System.out.println(filename);
            //完成文件上传
            upload.transferTo(new File(path, filename));
            String NewFilePath = "upload/" + filename;
            for (String type : IMAGE_TYPE) {
                if (StringUtils.endsWithIgnoreCase(upload.getOriginalFilename(), type)) {
                    response.getWriter().write(NewFilePath);
                }
            }
        }
    }

    @RequestMapping("updateHead")
    public void UpdateHead(HttpServletRequest request,HttpServletResponse response,int id,String head,int which) throws IOException{
        Admin admin = (Admin)request.getSession().getAttribute("admin");
        if (admin!=null){
            if (!head.equals("")) {
                if (which==1){
                    Shop s = new Shop();
                    s.setShop_img(head.trim());
                    s.setId(id);
                    shopService.UpdateShopImgById(s);
                }else{
                    Menu m = new Menu();
                    m.setMenu_img(head.trim());
                    m.setMenu_id(id);
                    shopService.UpdateMenuImgById(m);
                }
                response.getWriter().write("保存成功");
            }else{
                response.getWriter().write("保存失败");
            }
        }
    }

    @RequestMapping("deleteMenuById")
    public String DeleteMenuById(Model model,HttpServletRequest request,int menu_id,int shop_id) throws IOException {
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        if (admin != null) {
            shopService.DeleteMenuById(menu_id);
            return "redirect:disMenuByShop.do?page=1&id="+shop_id;
        }else{
            model.addAttribute("result", "未登录，操作无效");
            return "tishi";
        }
    }

    @RequestMapping("disSell")
    public String DisSell(Model model,HttpServletRequest request) throws IOException {
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        if (admin != null) {
            List<Shop> shops = shopService.DisShopByIncome();
            List<Menu> menus = shopService.DisMenuBySell();
            model.addAttribute("shops",shops);
            model.addAttribute("menus",menus);
            return "admin_sell";
        }else{
            model.addAttribute("result", "未登录，操作无效");
            return "tishi";
        }
    }
}
