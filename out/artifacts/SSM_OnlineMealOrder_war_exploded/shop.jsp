<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/6/6
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>校园网上订餐-店铺详情</title>
    <meta name="keywords" content="DeathGhost,DeathGhost.cn,web前端设,移动WebApp开发" />
    <meta name="description" content="DeathGhost.cn::H5 WEB前端设计开发!" />
    <meta name="author" content="DeathGhost"/>
    <link href="style/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jqpublic.js"></script>
    <!--
    Author: DeathGhost
    Author URI: http://www.deathghost.cn
    -->
</head>
<script>
    $(function(){
        $('.title-list li').click(function(){
            var liindex = $('.title-list li').index(this);
            $(this).addClass('on').siblings().removeClass('on');
            $('.menutab-wrap div.menutab').eq(liindex).fadeIn(150).siblings('div.menutab').hide();
            var liWidth = $('.title-list li').width();
            $('.shopcontent .title-list p').stop(false,true).animate({'left' : liindex * liWidth + 'px'},300);
        });

        $('.menutab-wrap .menutab li').hover(function(){
            $(this).css("border-color","#ff6600");
            $(this).find('p > a').css('color','#ff6600');
        },function(){
            $(this).css("border-color","#fafafa");
            $(this).find('p > a').css('color','#666666');
        });
    });
    var mt = 0;
    window.onload = function () {
        var Topcart = document.getElementById("Topcart");
        var mt = Topcart.offsetTop;
        window.onscroll = function () {
            var t = document.documentElement.scrollTop || document.body.scrollTop;
            if (t > mt) {
                Topcart.style.position = "fixed";
                Topcart.style.margin = "";
                Topcart.style.top = "200px";
                Topcart.style.right = "191px";
                Topcart.style.boxShadow ="0px 0px 20px 5px #cccccc";
                Topcart.style.top="0";
                Topcart.style.border="1px #636363 solid";
            }
            else {
                Topcart.style.position = "static";
                Topcart.style.boxShadow ="none";
                Topcart.style.border="";
            }
        }
    }
</script>
<body>
<jsp:include page="header.jsp"/>
<!--Start content-->
<section class="Shop-index">
    <article>
        <div class="shopinfor">
            <div class="title">
                <span>${shop.shop_name}</span>
                <span>
     <img src="${pageContext.request.contextPath}/images/star-on.png">
     <img src="${pageContext.request.contextPath}/images/star-on.png">
     <img src="${pageContext.request.contextPath}/images/star-on.png">
     <img src="${pageContext.request.contextPath}/images/star-on.png">
     <img src="${pageContext.request.contextPath}/images/star-off.png">
    </span>
            </div>
            <div class="imginfor">
                <div class="shopimg">
                    <img src="${pageContext.request.contextPath}/${shop.shop_img}" id="showimg">
                    <ul class="smallpic">
                        <li><img src="${pageContext.request.contextPath}/${shop.shop_img}"></li>
                    </ul>
                </div>
                <div class="shoptext">
                    <p><span>地址：</span>${shop.shop_address}</p>
                    <p><span>电话：</span>${shop.shop_phone}</p>
                    <p><span>特色菜品：</span>${shop.shop_special}</p>
                    <p><span>优惠活动：</span>${shop.shop_discount}</p>
                    <p><span>营业时间：</span>${shop.opentime}</p>
                    <p><span>价格：</span>${shop.shop_price}</p>
                    <div class="Button">
                        <a href="#ydwm"><span class="DCbutton">查看菜谱点菜</span></a>
                    </div>
                    <div class="otherinfor">
                        <a class="icoa"><span id="ct" style="cursor: pointer;" onclick="UpdateCollect(${shop.id})">${ct}</span>（<span id="countC">${countC}</span>）</a>
                        <div class="bshare-custom"><a title="分享" class="bshare-more bshare-more-icon more-style-addthis">分享</a></div>
                        <script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=1&amp;lang=zh"></script><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
                    </div>
                </div>
            </div>
            <div class="shopcontent">
                <div class="title2 cf">
                    <ul class="title-list fr cf ">
                        <li class="on">菜谱</li>
                        <li>累计评论（${count}）</li>
                        <p><b></b></p>
                    </ul>
                </div>
                <div class="menutab-wrap">
                    <a name="ydwm">
                        <!--case1-->
                        <div class="menutab show">
                            <ul class="products">
                                <c:forEach items="${allmenu.list}" varStatus="a" var="all">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/shop/disMenuById.do?id=${all.menu_id}" target="_blank" title="${all.menu_name}">
                                            <img src="${pageContext.request.contextPath}/${all.menu_img}" class="foodsimgsize">
                                        </a>
                                        <a href="#" class="item">
                                            <div>
                                                <p>${all.menu_name}</p>
                                                <p class="AButton">￥${all.menu_price}</p>
                                            </div>
                                        </a>
                                    </li>
                                </c:forEach>
                                <div class="TurnPage">
                                    <c:if test="${allmenu.currentPage>1}">
                                        <a href="${pageContext.request.contextPath}/shop/disShopById.do?page=${allmenu.currentPage-1}&id=${shop.id}"><span class="Next">上一页<i></i></span></a>
                                    </c:if>
                                    <span>当前第${allmenu.currentPage}页/总${allmenu.totalPage}页</span>
                                    <c:if test="${allmenu.currentPage < allmenu.totalPage}">
                                        <a href="${pageContext.request.contextPath}/shop/disShopById.do?page=${allmenu.currentPage+1}&id=${shop.id}"><span class="Next">下一页<i></i></span></a>
                                    </c:if>
                                </div>
                            </ul>
                        </div>
                    </a>
                    <!--case2-->
                    <div class="menutab">
                        <c:forEach items="${comments.list}" varStatus="c" var="co">
                            <div class="shopcomment">
                                <div class="Spname">
                                    <a href="#" target="_blank" title="${co.menu.menu_name}">${co.menu.menu_name}</a>
                                </div>
                                <div class="C-content">
                                    <q>${co.content}</q>
                                    <i>${co.createtime}</i>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="TurnPage">
                            <c:if test="${comments.currentPage>1}">
                                <a href="${pageContext.request.contextPath}/shop/disShopById.do?page=${comments.currentPage-1}&id=${comments.shop_id}"><span class="Next">上一页<i></i></span></a>
                            </c:if>
                            <span>当前第${comments.currentPage}页/总${orderlist.totalPage}页</span>
                            <c:if test="${comments.currentPage>1}">
                                <a href="${pageContext.request.contextPath}/shop/disShopById.do?page=${comments.currentPage+1}&id=${comments.shop_id}"><span class="Next">下一页<i></i></span></a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </article>
</section>
<jsp:include page="footer.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
<script>
    function UpdateCollect(id) {
        var countC = document.getElementById("countC");
        var ct = document.getElementById("ct");
        $.ajax({
            url:"${pageContext.request.contextPath}/shop/czcollect.do",
            async:true,
            type:"POST",
            data: {"id": id},
            success:function (data) {
                if (data.split(",")[0]=="1") {
                    ct.innerHTML = "★ 已收藏";
                    countC.innerHTML = data.split(",")[1];
                }else if (data.split(",")[0]=="0") {
                    ct.innerHTML = "☆ 可收藏";
                    countC.innerHTML = data.split(",")[1];
                }else{
                    alert("未登录，操作失败");
                }
            },
            error:function () {
                alert("请求失败");
            },
            dataType:"text"
        });
    }
</script>
</body>
</html>
