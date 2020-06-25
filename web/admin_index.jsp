<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/2/14
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>admin_index</title>
    <link href="${pageContext.request.contextPath}/style/style.css" rel="stylesheet" type="text/css"/>
</head>
<style>
    a{
        text-decoration: none;
        color: #999999;
        font-weight: bold;
    }
    th{height: 30px;
        border: 1px dashed;
        padding: 2px;}
</style>
<body>
<div style="width:1472px;height: 30px;background-color: #000000;padding: 15px;">
    <div style="height: 30px;color: white;font-size: 16px;display: inline-block;">欢迎来到管理员界面，</div>
    <div style="width: 60px;height: 30px;color: white;font-size: 16px;display: inline-block;">${admin.getUsername()}</div>
    <div style="height: 30px;color: red;font-size: 16px;display: inline-block;"><a href="${pageContext.request.contextPath}/user/canelAdmin.do">【安全退出】</a></div>
</div>
<div style="width: 200px;height:673px;border:double;text-align: center;float: left;">
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;font-size: 16px;"><a href="${pageContext.request.contextPath}/admin_index.jsp">首页</a></div>
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;"><a href="${pageContext.request.contextPath}/user/disUser.do?page=1&username=">用户管理</a></div>
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;"><a href="${pageContext.request.contextPath}/shop/disShop.do?page=1&shop=">店铺管理</a></div>
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;"><a href="${pageContext.request.contextPath}/order/disOrder.do?page=1&orderId=">订单管理</a></div>
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;"><a href="${pageContext.request.contextPath}/shop/disSell.do">业绩管理</a></div>
</div>
<div style="width: 1293px;height:673px;border:double;float: left;">
    <div style="margin: 20px;">
        <h2>欢迎来到校园订单后台管理系统</h2>
        <br>
        <div style="font-size: 18px;">
            <%
                Date d = new Date();
                String s = d.toString();
            %>
            现在的时间是：<%=s %></div>
    </div><br>
    <div style="margin: 20px;">
        <h3>后台管理功能：</h3>
        <span>用户管理（用户信息显示、账号冻结、模糊查询）</span><br>
        <span>店铺管理（店铺信息显示、信息修改、新店开张关门、菜谱上架下架、菜谱信息修改、模糊查询）</span><br>
        <span>订单管理（订单发货管理、订单删除、订单详情显示、模糊查询）</span><br>
        <span>业绩管理（月收入）</span>
    </div>

</div>
<div style="clear:both"></div>
</body>
</html>
