<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/6/14
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>店铺搜索页面-校园网上订餐</title>
    <meta name="keywords" content="DeathGhost,DeathGhost.cn,web前端设,移动WebApp开发" />
    <meta name="description" content="DeathGhost.cn::H5 WEB前端设计开发!" />
    <meta name="author" content="DeathGhost"/>
    <!--
    Author: DeathGhost
    Author URI: http://www.deathghost.cn
    -->
</head>
<body>
<header>
<jsp:include page="header.jsp"/>
<!--Start content-->
<section class="Psection MT20">
    <article class="Searchlist Overflow">
        <h3>店铺查询结果（${count}）：</h3>（店铺未开也不显示）
        <ul class="Overflow">
            <c:forEach items="${search.list}" varStatus="s" var="sear">
                <li>
                    <a href="${pageContext.request.contextPath}/shop/disShopById.do?page=1&id=${sear.id}" target="_blank" title="${sear.shop_name}"><img src="${pageContext.request.contextPath}/${sear.shop_img}"></a>
                    <p class="P-shop Overflow"><span class="sa"><a href="${pageContext.request.contextPath}/shop/disShopById.do?page=1&id=${sear.id}" target="_blank" title="${sear.shop_name}">${sear.shop_name}</a></p>
                    <p class="P-shop Overflow">${sear.shop_address}</p>
                </li>
            </c:forEach>
        </ul>
        <div class="TurnPage">
            <c:if test="${search.currentPage>1}">
                <a href="${pageContext.request.contextPath}/shop/disSearchShop.do?page=${search.currentPage-1}&isShop=1&content=${sname}}"><span class="Next">上一页<i></i></span></a>
            </c:if>
            <span>当前第${search.currentPage}页/总${search.totalPage}页</span>
            <c:if test="${search.currentPage>1}">
                <a href="${pageContext.request.contextPath}/shop/disSearchShop.do?page=${search.currentPage+1}&isShop=1&content=${sname}"><span class="Next">下一页<i></i></span></a>
            </c:if>
        </div>
    </article>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>
