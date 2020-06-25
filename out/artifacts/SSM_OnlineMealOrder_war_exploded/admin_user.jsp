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
    <title>admin_user</title>
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
<script>
    function search() {
        var username = document.getElementById("search").value;
        location.href='${pageContext.request.contextPath}/user/disUser.do?username='+username+'&page=1';
    }
    function UpdateUser(id,state) {
        if (state==1){
            location.href='${pageContext.request.contextPath}/user/updateUserState.do?username=${username}&page=${all.currentPage}&updatestate=0&id='+id;
        } else {
            location.href='${pageContext.request.contextPath}/user/updateUserState.do?username=${username}&page=${all.currentPage}&updatestate=1&id='+id;
        }
    }
</script>
<body>
<div style="width:1472px;height: 30px;background-color: #000000;padding: 15px;">
    <div style="height: 30px;color: white;font-size: 16px;display: inline-block;">欢迎来到管理员界面，</div>
    <div style="width: 60px;height: 30px;color: white;font-size: 16px;display: inline-block;">${admin.getUsername()}</div>
    <div style="height: 30px;color: red;font-size: 16px;display: inline-block;"><a href="${pageContext.request.contextPath}/user/canelAdmin.do">【安全退出】</a></div>
</div>
<div style="width: 200px;height:673px;border:double;text-align: center;float: left;">
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;"><a href="${pageContext.request.contextPath}/admin_index.jsp">首页</a></div>
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;font-size: 16px;"><a href="${pageContext.request.contextPath}/user/disUser.do?page=1&username=">用户管理</a></div>
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;"><a href="${pageContext.request.contextPath}/shop/disShop.do?page=1&shop=">店铺管理</a></div>
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;"><a href="${pageContext.request.contextPath}/order/disOrder.do?page=1&orderId=">订单管理</a></div>
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;"><a href="${pageContext.request.contextPath}/shop/disSell.do">业绩管理</a></div>
</div>
<div style="width: 1293px;height:673px;border:double;float: left;">
    <div style="font-weight: bold;font-size: 22px;margin: 10px;">用户管理</div>
    <div style="margin-top: 15px;margin-left: 10px;">
        <input type="text" name="search" id="search" style="height: 30px;border: black;"/>
        <input type="button" value="搜索" id="sear" onclick="search()" style="height: 30px;width:50px;background-color: white;color: black;cursor: pointer;font-weight: bold;"/>
        （有${num}名用户）（提示：搜索内容为空就是显示全部用户）
    </div>
    <form style="border-bottom: 50px;" id="Form" action="#" method="post" >
        <table style="display: inline-block;text-align: center; margin: 10px" >
            <tr>
                <th style="width: 50px;">序号</th>
                <th style="width: 100px;">名字</th>
                <th style="width: 60px;">头像</th>
                <th style="width: 100px;">密码</th>
                <th style="width: 150px;">手机号</th>
                <th style="width: 180px;">邮箱</th>
                <th style="width: 100px;">账号操作</th>
            </tr>
            <c:forEach items="${all.list}" var="user" varStatus="u">
                <tr>
                    <td style="height: 55px;border: 1px dashed;">${u.count}</td>
                    <td style="height: 55px;border: 1px dashed;">${user.username}</td>
                    <td style="height: 55px;border: 1px dashed;"><img src="${pageContext.request.contextPath}/${user.img}" style="width: 55px;height: 55px;"></td>
                    <td style="height: 55px;border: 1px dashed;">${user.password}</td>
                    <td style="height: 55px;border: 1px dashed;">${user.phone}</td>
                    <td style="height: 55px;border: 1px dashed;">${user.email}</td>
                    <td style="height: 55px;border: 1px dashed;cursor: pointer;" onclick="UpdateUser(${user.id},${user.isused})">
                        <c:if test="${user.isused==0}">解冻</c:if>
                        <c:if test="${user.isused==1}">冻结</c:if>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td style="height: 50px;">
                    <c:if test="${all.currentPage > 1}">
                        <a href="${pageContext.request.contextPath}/user/disUser.do?page=${all.currentPage-1}&username=${username}">上一页</a>
                    </c:if>
                </td>
                <td style="height: 50px;">当前第${all.currentPage}页/总${all.totalPage}页</td>
                <td style="height: 50px;">
                    <c:if test="${all.currentPage < all.totalPage}">
                        <a href="${pageContext.request.contextPath}/user/disUser.do?page=${all.currentPage+1}&username=${username}">下一页</a>
                    </c:if>
                </td>
            </tr>
        </table>
    </form>
</div>
<div style="clear:both"></div>
</body>
</html>
