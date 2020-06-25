<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/6/6
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>校园网上订餐-产品分类页面</title>
    <meta name="keywords" content="DeathGhost,DeathGhost.cn,web前端设,移动WebApp开发" />
    <meta name="description" content="DeathGhost.cn::H5 WEB前端设计开发!" />
    <meta name="author" content="DeathGhost"/>
    <!--
    Author: DeathGhost
    Author URI: http://www.deathghost.cn
    -->
</head>
<script>
    function CunType(va) {
        var fenlei = document.getElementById("type");
        fenlei.innerHTML=va;
    }
    function CunPrice(va) {
        var price = document.getElementById("price");
        price.innerHTML=va;
    }
    function disShopByTJ() {
        var fenlei = document.getElementById("type").innerHTML;
        var price = document.getElementById("price").innerHTML;
        location.href = "${pageContext.request.contextPath}/shop/disAllShop.do?page=1&shop_type="+fenlei+"&shop_price="+price;
    }
</script>
<body>
<jsp:include page="header.jsp"/>
<!--Start content-->
<section class="Psection">
    <section class="fslist_navtree">
        <ul class="select">
            <li class="select-list">
                <dl id="select1">
                    <dt>分类：</dt>
                    <dd class="select-all selected"><a href="javascript:" onclick="CunType('全部')">全部</a></dd>
                    <dd><a href="javascript:" onclick="CunType('甜品饮品')">甜品饮品</a></dd>
                    <dd><a href="javascript:" onclick="CunType('汉堡披萨')">汉堡披萨</a></dd>
                    <dd><a href="javascript:" onclick="CunType('炸鸡烤串')">炸鸡烤串</a></dd>
                    <dd><a href="javascript:" onclick="CunType('快餐便当')">快餐便当</a></dd>
                    <dd><a href="javascript:" onclick="CunType('包子粥店')">包子粥店</a></dd>
                    <dd><a href="javascript:" onclick="CunType('米粉面馆')">米粉面馆</a></dd>
                    <dd><a href="javascript:" onclick="CunType('麻辣烫')">麻辣烫</a></dd>
                    <dd><a href="javascript:" onclick="CunType('鸭脖卤味')">鸭脖卤味</a></dd>
                    <dd><a href="javascript:" onclick="CunType('烧烤海鲜')">烧烤海鲜</a></dd>
                </dl>
            </li>
            <li class="select-list">
                <dl id="select4">
                    <dt>价位区间：</dt>
                    <dd class="select-all selected"><a href="javascript:" onclick="CunPrice('全部')">全部</a></dd>
                    <dd><a href="javascript:" onclick="CunPrice('20元以下')">20元以下</a></dd>
                    <dd><a href="javascript:" onclick="CunPrice('20-50元')">20-50元</a></dd>
                    <dd><a href="javascript:" onclick="CunPrice('50-80元')">50-80元</a></dd>
                    <dd><a href="javascript:" onclick="CunPrice('80-120元')">80-120元</a></dd>
                    <dd><a href="javascript:" onclick="CunPrice('120元以上')">120元以上</a></dd>
                </dl>
            </li>
            <li class="select-result">
                <dl>
                    <dd class="select-no">已选择：</dd>
                </dl>
                <a href="#" onclick="disShopByTJ()">条件筛选</a>
            </li>
        </ul><div style="display: none;"><span id="price">${price}</span><span id="type">${type}</span></div>
    </section>
    <section class="Fslmenu">
        <a href="#" title="默认排序">
            <span>默认排序</span></a>
    </section>
    <section class="Fsl">
        <ul>
    <c:forEach items="${allshop.list}" var="all" varStatus="a">
            <li>
                <a href="${pageContext.request.contextPath}/shop/disShopById.do?page=1&id=${all.id}" target="_blank" title="${all.shop_name}"><img src="${pageContext.request.contextPath}/${all.shop_img}"></a>
                <hgroup>
                    <h3>${all.shop_name}</h3>
                    <h4></h4>
                </hgroup>
                <p>类型：${all.shop_type}</p>
                <p>地址：${all.shop_address}</p>
                <p>人均：${all.shop_price}</p>
                <p>
                    <span class="Score-l">
                    <img src="${pageContext.request.contextPath}/images/star-on.png">
                    <img src="${pageContext.request.contextPath}/images/star-on.png">
                    <img src="${pageContext.request.contextPath}/images/star-on.png">
                    <img src="${pageContext.request.contextPath}/images/star-on.png">
                    <img src="${pageContext.request.contextPath}/images/star-off.png">
                    <span class="Score-v">4.8</span>
                    </span>
                    <span class="DSBUTTON"><a href="${pageContext.request.contextPath}/shop/disShopById.do?page=1&id=${all.id}" target="_blank" class="Fontfff">点外卖</a></span>
                </p>
            </li>
    </c:forEach>
        </ul>
        <div class="TurnPage">
            <a href="${pageContext.request.contextPath}/shop/disAllShop.do?page=1&shop_type=${type}&shop_price=${price}">
                <span class="Prev"><i></i>首页</span>
            </a>
            <c:if test="${allshop.currentPage>1}">
            <a href="${pageContext.request.contextPath}/shop/disAllShop.do?page=${allshop.currentPage-1}&shop_type=${type}&shop_price=${price}"><span class="Next">上一页<i></i></span></a>
            </c:if>
            <span>当前第${allshop.currentPage}页/总${allshop.totalPage}页</span>
            <c:if test="${allshop.currentPage<allshop.totalPage}">
            <a href="${pageContext.request.contextPath}/shop/disAllShop.do?page=${allshop.currentPage+1}&shop_type=${type}&shop_price=${price}"><span class="Next">下一页<i></i></span></a>
            </c:if>
        </div>
    </section>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>