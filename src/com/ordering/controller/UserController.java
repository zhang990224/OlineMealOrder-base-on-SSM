package com.ordering.controller;

import com.ordering.po.Admin;
import com.ordering.po.Pageresult;
import com.ordering.po.User;
import com.ordering.service.ShopService;
import com.ordering.service.UserService;
import com.ordering.utils.RandomValidateCode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;
    @Resource
    private ShopService shopService;

    //注册时验证username是否可用
    @RequestMapping("findUsername")
    public void findUserName(String username, HttpServletResponse response) throws IOException {
        int count = userService.findUserName(username.trim());
        if (count>0){
            response.getWriter().write("true");
        }else{
            response.getWriter().write("false");
        }
    }
    //注册时验证email是否可用
    @RequestMapping("findEmail")
    public void findEmail(String email, HttpServletResponse response) throws IOException {
        int count = userService.findEmail(email.trim());
        if(email.trim().matches("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*"))
        {
            if (count>0){
                response.getWriter().write("1");
            }else{
                response.getWriter().write("0");
            }
        }else{
            response.getWriter().write("2");
        }
    }
    //注册时验证phone是否可用
    @RequestMapping("findPhone")
    public void findPhone(String phone, HttpServletResponse response) throws IOException {
        int count = userService.findPhone(phone.trim());
        //定义手机号的规则
        String regex = "1[35789]\\d{9}"; //1表示 以 1开头；[57]表示第二位是 5或者 7  \\d[9]表示 还剩9位  总共11位
        //调用功能 判断
        boolean flag = phone.matches(regex);
        if (flag)
        {
            if (count > 0) {
                response.getWriter().write("1");
            } else {
                response.getWriter().write("0");
            }
        }else{
            response.getWriter().write("2");
        }
    }

    @RequestMapping("validateCode")
    public void validateCode(String yzm, HttpServletResponse response,HttpServletRequest request) throws IOException {
        String vaiidateCode = (String)request.getSession(true).getAttribute("code");
        if (vaiidateCode.trim().equalsIgnoreCase(yzm)){
            response.getWriter().write("1");
        }else{
            response.getWriter().write("0");
        }
    }

    //注册
    @RequestMapping("register")
    public String Register(Model model,String username, String password1, String phone, String email) throws IOException {
        if (username.trim()!="" && password1.trim()!="" && phone!="" && email!=""){
            User user = new User();
            user.setUsername(username.trim());
            user.setPassword(password1.trim());
            user.setPhone(phone.trim());
            user.setEmail(email.trim());
            user.setImg("upload/tou1.jpg");
            user.setIsused(1);
            userService.insertUser(user);
            return "login";
        }else{
            model.addAttribute("result","404");
            return "tishi";
        }
    }

    @RequestMapping("YanZhenLogin")
    public void YanZhenLogin(HttpServletRequest request,HttpServletResponse response,String input, String password, String yzm) throws IOException {
        String vaiidateCode = (String)request.getSession(true).getAttribute("code");
        User user = new User();
        user.setEmail(input.trim());
        user.setPhone(input.trim());
        user.setUsername(input.trim());
        user.setPassword(password.trim());
        user.setImg("upload/tou1.jsp");
        user.setIsused(1);
        int count1 = userService.findEmailUser(user);
        int count2 = userService.findPhoneUser(user);
        int count3 = userService.findUserNameUser(user);
        if (count1==1 || count2==1 || count3==1){
            if (vaiidateCode.trim().equalsIgnoreCase(yzm)){
                response.getWriter().write("1");
            }else{
                response.getWriter().write("0");
            }
        }else {
            response.getWriter().write("2");
        }
    }

    @RequestMapping("Login")
    public String Login(Model model,HttpServletRequest request,String input, String password){
        User user = new User();
        user.setEmail(input.trim());
        user.setPhone(input.trim());
        user.setUsername(input.trim());
        user.setPassword(password.trim());
        int count1 = userService.findEmailUser(user);
        int count2 = userService.findPhoneUser(user);
        int count3 = userService.findUserNameUser(user);
        User user1;
        HttpSession session = request.getSession();
        if (count1==1){
            user1 = userService.findUserByEmail(input);
            System.out.println("email");
            session.setAttribute("user",user1);
        }else if (count2==1){
            user1 = userService.findUserByPhone(input);
            System.out.println("phone");
            session.setAttribute("user",user1);
        }else if (count3==1){
            user1 = userService.findUserByName(input);
            System.out.println("username");
            session.setAttribute("user",user1);
        }
        return "index";
    }

    /**
     * 获取生成验证码显示到 UI 界面
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping(value="/checkCode")
    public void checkCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置相应类型,告诉浏览器输出的内容为图片
        response.setContentType("image/jpeg");

        //设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);//输出图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("returnHead")
    public void ReturnHead(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) throws IOException {
        User user = (User) request.getSession(true).getAttribute("user");
        if (user!=null){
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
                    System.out.println(NewFilePath);
                }
            }
        }
    }

    @RequestMapping("updateHead")
    public void UpdateHead(HttpServletRequest request,HttpServletResponse response,String head) throws IOException{
        User user = (User) request.getSession(true).getAttribute("user");
        if (user!=null){
            if (!head.equals("")) {
                User user1 = new User();
                user1.setId(user.getId());
                user1.setImg(head.trim());
                userService.updateHeadById(user1);
                User user2 = userService.findUserByName(user.getUsername());
                HttpSession session = request.getSession();
                session.setAttribute("user",user2);
                response.getWriter().write("保存成功");
            }else{
                response.getWriter().write("保存失败");
            }
        }
    }

    @RequestMapping("updatePsw")
    public void UpdatePsw(HttpServletRequest request,HttpServletResponse response,String oldp,String newp) throws IOException {
        User user = (User) request.getSession(true).getAttribute("user");
        if (user!=null){
            if (user.getPassword().trim().equals(oldp.trim())){
                User u = new User();
                u.setId(user.getId());
                u.setPassword(newp.trim());
                userService.updatePswById(u);
                User user1 = userService.findUserByName(user.getUsername());
                HttpSession session = request.getSession();
                session.setAttribute("user",user1);
                response.getWriter().write("修改成功");
            }else{
                response.getWriter().write("旧密码错误");
            }
        }else{
            response.getWriter().write("没有登录！！！");
        }
    }

    @RequestMapping("deleteCommentByUserId")
    public String DeleteCommentByUserId(Model model,HttpServletRequest request,int comment_id){
        User user = (User) request.getSession(true).getAttribute("user");
        if (user!=null){
            shopService.DeleteCommentById(comment_id);
            return "redirect:disCommentByUserId.do?page=1&pageSize=6";
        }else{
            model.addAttribute("result","未登录");
            return "tishi";
        }
    }

    @RequestMapping("disCommentByUserId")
    public String DisCommentByUserId(Model model,HttpServletRequest request,int page,int pageSize){
        User user = (User) request.getSession(true).getAttribute("user");
        if (user!=null){
            Pageresult pageresult = shopService.DisCommentByUserId(user.getId(),page,pageSize);
            model.addAttribute("comments",pageresult);
            return "user_comment";
        }else{
            model.addAttribute("result","未登录");
            return "tishi";
        }

    }

    @RequestMapping("canelUser")
    public String CannelUser(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        return "login";
    }

    @RequestMapping("canelAdmin")
    public String CanelAdmin(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("admin");
        return "admin_login";
    }

    @RequestMapping("findAdmin")
    public String Findadmin(Model model,String username,String password,HttpServletRequest request,HttpServletResponse response) throws IOException {
        Admin admin = new Admin();
        admin.setUsername(username.trim());
        admin.setPassword(password.trim());
        int c = userService.FindAdmin(admin);
        HttpSession session = request.getSession();
        if (c>0){
            session.setAttribute("admin",admin);
            return "admin_index";
        }else{
            model.addAttribute("result","账号或密码错误!");
            return "tishi";
        }
    }

    @RequestMapping("disUser")
    public String DisUser(Model model,HttpServletRequest request,int page,String username) {
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin != null) {
            if (username==""){
                Pageresult pageresult = userService.DisAllUser(page,5);
                int count = userService.CountAllUser();
                model.addAttribute("all",pageresult);
                model.addAttribute("num",count);
                model.addAttribute("username","");
            }else{
                Pageresult pageresult = userService.DisSearchUser(username,page,5);
                int count = userService.CountSearchUser(username);
                model.addAttribute("all",pageresult);
                model.addAttribute("num",count);
                model.addAttribute("username",username);
            }
            return "admin_user";
        }else{
            model.addAttribute("result","404!");
            return "tishi";
        }
    }

    @RequestMapping("updateUserState")
    public String UpdateUserState(Model model,HttpServletRequest request,int page,String username,int id,int updatestate) {
        Admin admin = (Admin) request.getSession(true).getAttribute("admin");
        if (admin != null) {
            User u = new User();
            u.setIsused(updatestate);
            u.setId(id);
            userService.updateUserSateById(u);
            return "redirect:disUser.do?page="+page+"&username="+username;
        }else{
            model.addAttribute("result","404!");
            return "tishi";
        }
    }

}
