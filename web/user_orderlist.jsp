<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/6/11
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script>
    function UpdatePay(order_id,i,paystate,gai) {
        var pay = document.getElementsByClassName("paystate")[i-1];
        if (paystate==0){
            $.ajax({
                url:"${pageContext.request.contextPath}/order/updatePayState.do",
                type:"POST",
                async:true,
                data:{"paystate":gai,"order_id":order_id,"isOrder":2},
                success:function (data) {
                    if (data==1){
                        alert("支付成功");
                        pay.innerHTML = "已付款";
                    }else if (data==2){
                        alert("退单成功");
                        pay.innerHTML = "已退单";
                    }else{
                        alert(data);
                    }
                },dataType:"text"
            });
        } else{
            alert("已付款，不可重复付款！")
        }
    }
</script>
<head>
    <meta charset="utf-8" />
    <title>校园网上订餐-订单详情</title>
    <meta name="keywords" content="DeathGhost,DeathGhost.cn,web前端设,移动WebApp开发" />
    <meta name="description" content="DeathGhost.cn::H5 WEB前端设计开发!" />
    <meta name="author" content="DeathGhost"/>
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
                <th class="Font14 FontW">订单编号</th>
                <th class="Font14 FontW">下单时间</th>
                <th class="Font14 FontW">收件人</th>
                <th class="Font14 FontW">订单总金额</th>
                <th class="Font14 FontW">订单状态</th>
                <th class="Font14 FontW">操作</th>
                <c:forEach items="${orderlist.list}" var="order" varStatus="o">
                    <tr>
                        <td class="FontW"><a href="${pageContext.request.contextPath}/order/disOrderItemById.do?order_id=${order.order_id}&address_id=${order.address_id}&isuser=1">${order.order_id}</a></td>
                        <td>${order.createtime}</td>
                        <td>${order.address.receiver_name}</td>
                        <td>￥${order.price}</td>
                        <td><span class="paystate"><c:if test="${order.paystate==0}">未付款</c:if><c:if test="${order.paystate==1}">已付款</c:if><c:if test="${order.paystate==2}">已退单</c:if></span>
                            <c:if test="${order.paystate!=2}"><c:if test="${order.deliverstate==0}">,未发货</c:if><c:if test="${order.deliverstate==1}">,已发货</c:if></c:if></td>
                        <td><a href="#" onclick="UpdatePay('${order.order_id}',${o.count},${order.paystate},2)">取消订单</a> | <a href="#" onclick="UpdatePay('${order.order_id}',${o.count},${order.paystate},1)">付款</a></td>
                    </tr>
                </c:forEach>
            </table>
            <div class="TurnPage">
                <c:if test="${orderlist.currentPage>1}">
                    <a href="${pageContext.request.contextPath}/order/disOrderById.do?page=${orderlist.currentPage-1}&pageSize=6"><span class="Next">上一页<i></i></span></a>
                </c:if>
                <span>当前第${orderlist.currentPage}页/总${orderlist.totalPage}页</span>
                <c:if test="${orderlist.currentPage<orderlist.totalPage}">
                    <a href="${pageContext.request.contextPath}/order/disOrderById.do?page=${orderlist.currentPage+1}&pageSize=6"><span class="Next">下一页<i></i></span></a>
                </c:if>
            </div>
        </section>
    </article>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>
