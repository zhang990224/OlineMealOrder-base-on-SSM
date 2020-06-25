<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/6/4
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>header</title>
    <link href="${pageContext.request.contextPath}/style/style.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/style/style1.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jqpublic.js"></script>
</head>
<script>
    function IsShop(i) {
        var isshop = document.getElementById("isshop");
        isshop.innerHTML = i;
    }
    function searchsm() {
        var fkeyword = document.getElementById("fkeyword").value;
        var isshop = document.getElementById("isshop").innerHTML;
        location.href="${pageContext.request.contextPath}/shop/disSearchShop.do?page=1&isShop="+isshop+"&content="+fkeyword;
    }
</script>
<body>
<header>
    <section class="Topmenubg">
        <div class="Topnav">
            <div class="LeftNav">
                <a href="${pageContext.request.contextPath}/register.jsp">注册</a>/<a href="${pageContext.request.contextPath}/login.jsp">登录</a>
            </div>
            <div class="RightNav">
                <c:if test="${user.getUsername()!=null}">
                    <a href="${pageContext.request.contextPath}/user_center.jsp">用户中心</a> <a href="${pageContext.request.contextPath}/order/disOrderById.do?page=1&pageSize=6" target="_blank" title="我的订单">我的订单</a> <a href="${pageContext.request.contextPath}/shop/disCartById.do">购物车</a> <a href="${pageContext.request.contextPath}/shop/disCollectShopById.do?page=1&pageSize=4" target="_blank" title="我的收藏">我的收藏</a> <a href="${pageContext.request.contextPath}/admin_login.jsp">商家入口</a>
                </c:if>
                <c:if test="${user.getUsername()==null}">
                    <a href="${pageContext.request.contextPath}/login.jsp" target="_blank">亲爱的用户，您还未登陆喔，请登录</a>
                </c:if>
            </div>
        </div>
    </section>
    <div class="Logo_search">
        <div class="Logo">
            <img src="${pageContext.request.contextPath}/images/logo.jpg" title="DeathGhost" alt="模板">
            <i></i>
            <span>广州市白云区 [ <a href="#">钟落潭镇</a> ]</span>
        </div>
        <div class="Search">
            <form method="get" id="main_a_serach" onsubmit="return check_search(this)">
                <div class="Search_nav" id="selectsearch">
                    <a href="javascript:;" onclick="selectsearch(this,'restaurant_name');IsShop(1);" class="choose">餐厅</a>
                    <a href="javascript:;" onclick="selectsearch(this,'food_name');IsShop(0);">食物名</a>
                    <span id="isshop" style="display: none;">1</span>
                </div>
                <div class="Search_area">
                    <input type="search" id="fkeyword" name="keyword" placeholder="请输入您所需查找的餐厅名称或食物名称..." class="searchbox" />
                    <input type="button" class="searchbutton" value="搜 索" onclick="searchsm()" />
                </div>
            </form>
        </div>
    </div>
    <nav class="menu_bg">
        <ul class="menu">
            <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/shop/disAllShop.do?page=1&shop_type=全部&shop_price=全部">订餐</a></li>
            <li><a href="${pageContext.request.contextPath}/article_read.jsp">关于我们</a></li>
        </ul>
    </nav>
</header>
</body>
</html>
