<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/6/13
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>校园网上订餐-我的收藏</title>
    <meta name="keywords" content="DeathGhost,DeathGhost.cn,web前端设,移动WebApp开发" />
    <meta name="description" content="DeathGhost.cn::H5 WEB前端设计开发!" />
    <meta name="author" content="DeathGhost"/>
    <!--
    Author: DeathGhost
    Author URI: http://www.deathghost.cn
    -->
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
        <!--user Favorites-->
        <section class="ShopFav Overflow">
            <span class="ShopFavtitle Block Font14 FontW Lineheight35">我的收藏</span>
            <c:forEach items="${collect.list}" var="co" varStatus="c">
                <ul>
                    <a href="${pageContext.request.contextPath}/shop/disShopById.do?page=1&id=${co.shop_id}" target="_blank">
                        <li>
                            <img src="${pageContext.request.contextPath}/${co.shop.shop_img}">
                            <p>${co.shop.shop_name}</p>
                        </li>
                    </a>
                </ul>
            </c:forEach>
            <div class="TurnPage">
                <c:if test="${collect.currentPage>1}">
                    <a href="${pageContext.request.contextPath}/order/disCollectShopById.do?page=${collect.currentPage-1}&pageSize=4"><span class="Next">上一页<i></i></span></a>
                </c:if>
                <span>当前第${collect.currentPage}页/总${collect.totalPage}页</span>
                <c:if test="${collect.currentPage<collect.totalPage}">
                    <a href="${pageContext.request.contextPath}/order/disCollectShopById.do?page=${collect.currentPage+1}&pageSize=4"><span class="Next">下一页<i></i></span></a>
                </c:if>
            </div>
        </section>
</article>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>
