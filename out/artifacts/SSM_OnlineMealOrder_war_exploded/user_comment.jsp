<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/6/12
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>校园网上订餐-订单中心</title>
    <meta name="keywords" content="DeathGhost,DeathGhost.cn,web前端设,移动WebApp开发" />
    <meta name="description" content="DeathGhost.cn::H5 WEB前端设计开发!" />
    <meta name="author" content="DeathGhost"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/framework.css">
</head>
<body>
<jsp:include page="header.jsp"/>
<!--Start content-->
<section class="Psection MT20">
    <nav class="U-nav Font14 FontW">
        <ul>
            <li><i></i><a href="${pageContext.request.contextPath}/user_center.jsp">用户中心首页</a></li>
            <li><i></i><a href="${pageContext.request.contextPath}/order/disOrderById.do?page=1&pageSize=6">我的订单</a></li>
            <li><i></i><a href="${pageContext.request.contextPath}/order/DisAddressById.do?page=1&pageSize=6">收货地址</a></li>
            <li><i></i><a href="${pageContext.request.contextPath}/user/disCommentByUserId.do?page=1&pageSize=6">我的评价</a></li>
            <li><i></i><a href="${pageContext.request.contextPath}/shop/disCollectShopById.do?page=1&pageSize=4">我的收藏</a></li>
            <li><i></i><a href="${pageContext.request.contextPath}/user/canelUser.do">安全退出</a></li>
        </ul>
    </nav>
    <article class="U-article Overflow">
        <!--user order list-->
        <section>
            <table class="Myorder">
                <th class="Font14 FontW">序号</th>
                <th class="Font14 FontW">店名</th>
                <th class="Font14 FontW">菜名</th>
                <th class="Font14 FontW">评价内容</th>
                <th class="Font14 FontW">评价时间</th>
                <th class="Font14 FontW">操作</th>
                <c:forEach items="${comments.list}" var="co" varStatus="c">
                    <tr>
                        <td>${c.count}</td>
                        <td><a href="${pageContext.request.contextPath}/shop/disShopById.do?page=1&id=${co.shop_id}">${co.menu.shop.shop_name}</a></td>
                        <td>${co.menu.menu_name}</td>
                        <td>${co.content}</td>
                        <td>${co.createtime}</td>
                        <td><a href="${pageContext.request.contextPath}/user/deleteCommentByUserId.do?comment_id=${co.id}">删除</a></td>
                    </tr>
                </c:forEach>
            </table>
            <div class="TurnPage">
                <c:if test="${comments.currentPage>1}">
                    <a href="${pageContext.request.contextPath}/user/disCommentByUserId.do?page=${comments.currentPage-1}&pageSize=6"><span class="Next">上一页<i></i></span></a>
                </c:if>
                <span>当前第${comments.currentPage}页/总${orderlist.totalPage}页</span>
                <c:if test="${comments.currentPage<orderlist.totalPage}">
                    <a href="${pageContext.request.contextPath}/user/disCommentByUserId.do?page=${comments.currentPage+1}&pageSize=6"><span class="Next">下一页<i></i></span></a>
                </c:if>
            </div>
        </section>
    </article>
</section>
<!--End content-->
<jsp:include page="footer.jsp"/>
</body>
</html>

