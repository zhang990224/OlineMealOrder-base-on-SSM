<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/6/23
  Time: 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>admin_sell</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style1.css">
</head>
<style>
    a{
        text-decoration: none;
        color: #999999;
        font-weight: bold;
    }
</style>
<body>
<div style="width:1472px;height: 30px;background-color: #000000;padding: 15px;">
    <div style="height: 30px;color: white;font-size: 16px;display: inline-block;">欢迎来到管理员界面，</div>
    <div style="width: 60px;height: 30px;color: white;font-size: 16px;display: inline-block;">${admin.getUsername()}</div>
    <div style="height: 30px;color: red;font-size: 16px;display: inline-block;"><a href="${pageContext.request.contextPath}/user/cannelAdmin.do">【安全退出】</a></div>
</div>
<div style="width: 200px;height:673px;border:double;text-align: center;float: left;">
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;"><a href="${pageContext.request.contextPath}/admin_index.jsp">首页</a></div>
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;"><a href="${pageContext.request.contextPath}/user/disUser.do?page=1&username=">用户管理</a></div>
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;"><a href="${pageContext.request.contextPath}/shop/disShop.do?page=1&shop=">店铺管理</a></div>
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;"><a href="${pageContext.request.contextPath}/order/disOrder.do?page=1&orderId=">订单管理</a></div>
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;font-size: 16px;"><a href="${pageContext.request.contextPath}/shop/disSell.do">业绩管理</a></div>
</div>
<div style="width: 1293px;height:673px;border:double;float: left;">
    <div style="font-weight: bold;font-size: 22px;margin: 10px;">店铺收入榜单前三</div>
    <div style="margin:10px;">
        <table style=" text-align: center" >
            <tr>
                <th style="width: 50px;">序号</th>
                <th style="width: 120px;">店铺名称</th>
                <th style="width: 100px;">店铺图片</th>
                <th style="width: 120px;">店铺类型</th>
                <th style="width: 120px;">平均价位</th>
                <th style="width: 120px;">店铺收入（元）</th>
                <th style="width: 100px;">店铺状态</th>
            </tr>
            <c:forEach items="${shops}" var="shop" varStatus="s">
                <tr>
                    <td style="height: 80px;border: 1px dashed;">${s.count}</td>
                    <td style="height: 80px;border: 1px dashed;">${shop.shop_name}</td>
                    <td style="height: 80px;border: 1px dashed;"><img src="${pageContext.request.contextPath}/${shop.shop_img}" style="width: 70px;height: 70px;" class="himg"></td>
                    <td style="height: 80px;border: 1px dashed;" class="st">${shop.shop_type}</td>
                    <td style="height: 80px;border: 1px dashed;" class="spr">${shop.shop_price}</td>
                    <td style="height: 80px;border: 1px dashed;" class="ss">${shop.shop_income}</td>
                    <td style="height: 80px;border: 1px dashed;" class="s">
                            <c:if test="${shop.shop_state==1}">开店中</c:if>
                            <c:if test="${shop.shop_state==0}">关店中</c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div><br>
    <div style="font-weight: bold;font-size: 22px;margin: 10px;">菜谱销量榜单前三</div>
    <div style="margin:10px;">
        <table style=" text-align: center" >
            <tr>
                <th style="width: 50px;">序号</th>
                <th style="width: 120px;">菜谱名称</th>
                <th style="width: 100px;">菜谱图片</th>
                <th style="width: 120px;">菜谱价格（元）</th>
                <th style="width: 100px;">菜谱销量</th>
            </tr>
            <c:forEach items="${menus}" var="menu" varStatus="m">
            <tr>
                <td style="height: 80px;border: 1px dashed;">${m.count}</td>
                <td style="height: 80px;border: 1px dashed;">${menu.menu_name}</td>
                <td style="height: 80px;border: 1px dashed;"><img src="${pageContext.request.contextPath}/${menu.menu_img}" style="width: 70px;height: 70px;" class="himg"></td>
                <td style="height: 80px;border: 1px dashed;" class="st">${menu.menu_price}</td>
                <td style="height: 80px;border: 1px dashed;" class="spr">${menu.menu_sell}</td>
            </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
