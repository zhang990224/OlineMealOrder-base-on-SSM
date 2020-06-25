<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/2/15
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>admin_orderitem</title>
    <link href="${pageContext.request.contextPath}/style/style.css" rel="stylesheet" type="text/css"/>
</head>
<style>
    a{text-decoration: none;
        color: #999999;
        font-weight: bold;}
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
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;font-size: 16px;"><a href="${pageContext.request.contextPath}/order/disOrder.do?page=1&orderId=">订单管理</a></div>
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;"><a href="${pageContext.request.contextPath}/shop/disSell.do">业绩管理</a></div>
</div>
<div style="width: 1293px;height:673px;border:double;float: left;">
    <div style="margin: 20px">
        <article class="U-article Overflow">
            <span class="Font14 FontW Lineheight35 Block">订单信息：</span>
            <table class="U-order-D">
                <th>订单编号</th>
                <th>订单产品</th>
                <th>订购数量</th>
                <th>单价</th>
                <th>小计</th>
                <th>付款方式</th>
                <th>状态</th>
                <c:forEach items="${order_item}" varStatus="o" var="order">
                    <tr>
                        <td>${order.order_id}</td>
                        <td><a href="${pageContext.request.contextPath}/shop/disMenuById.do?id=${order.menu_id}" target="_blank" title="${order.menu.menu_name}">${order.menu.menu_name}</a></td>
                        <td>${order.buynum}</td>
                        <td>￥${order.menu.menu_price*order.buynum}</td>
                        <td>￥${order.totalprice}</td>
                        <td>支付宝</td>
                        <td class="commentstate">
                            <c:if test="${order.commentstate==0}">未收货</c:if>
                            <c:if test="${order.commentstate==1}">未评价</c:if>
                            <c:if test="${order.commentstate==2}">已完成</c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <span class="Font14 FontW Lineheight35 Block">收件信息：</span>
            <form action="#">
                <table class="U-order-A">
                    <tr>
                        <td width="30%" align="left" class="FontW">收件地址：${address.receiver_address}</td>
                    </tr>
                    <tr>
                        <td width="30%" align="left" class="FontW">收件人姓名：${address.receiver_name}</td>
                    </tr>
                    <tr>
                        <td width="30%" align="left" class="FontW">手机号码：${address.receiver_phone}</td>
                    </tr>
                </table>
            </form>
        </article>
    </div>
</div>
<div style="clear:both"></div>
</body>
</html>

