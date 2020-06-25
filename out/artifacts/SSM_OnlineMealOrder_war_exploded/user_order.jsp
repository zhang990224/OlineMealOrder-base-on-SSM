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
    <title>校园网上订餐-我的订单</title>
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
        <span class="Font14 FontW Lineheight35 Block">订单信息：</span>
        <table class="U-order-D">
            <th>订单编号</th>
            <th>订单产品</th>
            <th>订购数量</th>
            <th>单价</th>
            <th>小计</th>
            <th>付款方式</th>
            <th>操作</th>
            <c:forEach items="${order_item}" varStatus="o" var="order">
                <tr>
                    <td>${order.order_id}</td>
                    <td><a href="${pageContext.request.contextPath}/shop/disMenuById.do?id=${order.menu_id}" target="_blank" title="${order.menu.menu_name}">${order.menu.menu_name}</a></td>
                    <td>${order.buynum}</td>
                    <td>￥${order.menu.menu_price*order.buynum}</td>
                    <td>￥${order.totalprice}</td>
                    <td>支付宝</td>
                    <td class="commentstate">
                        <c:if test="${order.commentstate==0}"><a href="${pageContext.request.contextPath}/order/updateReceiveState.do?orderitem_id=${order.orderitem_id}&order_id=${order.order_id}&address_id=${address.id}">确认收货</a></c:if>
                        <c:if test="${order.commentstate==1}"><a href="#headmodal" class="modaltrigger" onclick="disMenu(${order.menu.shop_id},${order.menu_id},${o.count},${order.orderitem_id})">评价</a></c:if>
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
</section>
<!--End content-->
<jsp:include page="footer.jsp"/>
<div id="headmodal" style="display:none;">
    <h3>添加评论:</h3><div style="display: none;"><span id="menu_id"></span><span id="shop_id"></span><span id="i"></span><span id="oid"></span></div>
    <textarea class="uk-textarea" placeholder="评论不少于5个字" style=" height:100px;width:180px;padding: 5px;margin-top: 5px;margin-right: 10px" id="commenttext"></textarea>
    <a href="#" id="comment" onclick="subcomment()">添加评论</a>
</div>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.leanModal.min.js"></script>
<script type="text/javascript">
    $(function(){
        //弹出层调用语句
        $('.modaltrigger').leanModal({
            top:110,
            overlay:0.45,
            closeButton:"#comment",
            backdrop:'static',
            keyboard:false
        });
    });

    function disMenu(shop_id,menu_id,i,orderitem_id) {
        var s = document.getElementById("shop_id");
        var m = document.getElementById("menu_id");
        var ii = document.getElementById("i");
        var oid = document.getElementById("oid");
        s.innerHTML = shop_id;
        m.innerHTML = menu_id;
        ii.innerHTML = i-1;
        oid.innerHTML = orderitem_id;
    }

    function subcomment(){
        var s = document.getElementById("shop_id").innerHTML;
        var m = document.getElementById("menu_id").innerHTML;
        var ii = document.getElementById("i").innerHTML;
        var oid = document.getElementById("oid").innerHTML;
        var text = document.getElementById("commenttext").value;
        var commentstate = document.getElementsByClassName("commentstate")[ii];
        if (text!="" && text.length>=5){
                $.ajax({
                    url:"${pageContext.request.contextPath}/order/addComment.do",
                    async:"true",
                    type:"POST",
                    data:{"shop_id":s,"menu_id":m,"content":text,"orderitem_id":oid},
                    success:function (data) {
                        if (data==1) {
                            commentstate.innerHTML="已完成";
                            text = "";
                            alert("评论成功!");
                        }else{
                            alert("未登录，操作失败");
                        }
                    },dataType:"text"
                });
        } else{
            alert("评论不少于5个字");
        }
    }
</script>
</body>
</html>

