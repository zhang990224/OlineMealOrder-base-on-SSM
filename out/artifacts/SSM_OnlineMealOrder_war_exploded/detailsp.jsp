<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/6/7
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>${menu.menu_name}-校园网上订餐</title>
    <meta name="keywords" content="DeathGhost,DeathGhost.cn,web前端设,移动WebApp开发" />
    <meta name="description" content="DeathGhost.cn::H5 WEB前端设计开发!" />
    <meta name="author" content="DeathGhost"/>
    <link href="style/style.css" rel="stylesheet" type="text/css" />
</head>
<script>
    function addCart() {
        var num = document.getElementById("num").value;
        $.ajax({
            url:"${pageContext.request.contextPath}/shop/addCart.do",
            async:true,
            type:"POST",
            data: {"menu_id":${menu.menu_id},"menu_num":num},
            success:function (data) {
                if (data=="1") {
                    alert("成功加入购物车！");
                }else if (data=="2"){
                    alert("该店铺已停止售卖！");
                } else{
                    alert("未登录，加入失败！");
                }
            },dataType:"text"
        });
    }
</script>
<body>
<jsp:include page="header.jsp"/>
<!--Start content-->
<section class="slp">
    <section class="food-hd">
        <div class="foodpic">
            <img src="${pageContext.request.contextPath}/${menu.menu_img}" id="showimg">
            <ul class="smallpic">
                <li><img src="${pageContext.request.contextPath}/${menu.menu_img}"></li>
            </ul>
        </div>
        <div class="foodtext">
            <div class="foodname_a">
                <h1>${menu.menu_name}</h1>
                <p>${menu.shop.shop_address}</p>
            </div>
            <div class="price_a">
                <p class="price01">价格：￥<span>${menu.menu_price}</span></p>
            </div>
            <ul class="Tran_infor">
                <li>
                    <p class="Numerical">${menu.menu_sell}</p>
                    <p>销量</p>
                </li>
            </ul>
            <form action="cart.html">
                <div class="BuyNo">
                    <span>我要买：<input type="number" name="Number" required autofocus min="1" value="1" id="num"/>份</span>
                    <span>库存：${menu.menu_count}</span>
                    <div class="Buybutton">
                        <input name="addcart" type="button" onclick="addCart()" value="加入购物车" class="BuyB">
                        <a href="${pageContext.request.contextPath}/shop/disShopById.do?page=1&id=${menu.shop_id}"><span class="Backhome">进入店铺首页</span></a>
                    </div>
                </div>
            </form>
        </div>
    </section>
</section>
<jsp:include page="footer.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jqpublic.js"></script>
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
</script>
</body>
</html>
