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
    <title>校园网上订餐-我的地址</title>
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
        <span class="Font14 FontW Lineheight35 Block">收件信息：</span>
        <table class="U-order-D">
            <th>序号</th>
            <th>收件人姓名</th>
            <th>收件人号码</th>
            <th>收件人地址</th>
            <th>操作</th>
            <c:forEach items="${address.list}" varStatus="a" var="ad">
                <tr>
                    <td>${a.count}</td>
                    <td class="tdname">${ad.receiver_name}</td>
                    <td class="tdphone">${ad.receiver_phone}</td>
                    <td class="tdaddress">${ad.receiver_address}</td>
                    <td onclick="DisAddress('${ad.receiver_name}','${ad.receiver_phone}','${ad.receiver_address}',${ad.id},${a.count})"><a href="#headmodal2" class="modaltrigger">编辑</a></td>
                </tr>
            </c:forEach>
        </table>
        <div class="TurnPage">
            <c:if test="${address.currentPage>1}">
                <a href="${pageContext.request.contextPath}/order/DisAddressById.do?page=${address.currentPage-1}&pageSize=6"><span class="Next">上一页<i></i></span></a>
            </c:if>
            <span>当前第${address.currentPage}页/总${address.totalPage}页</span>
            <c:if test="${address.currentPage>1}">
                <a href="${pageContext.request.contextPath}/order/DisAddressById.do?page=${address.currentPage+1}&pageSize=6"><span class="Next">下一页<i></i></span></a>
            </c:if>
        </div>
        <a href="#headmodal" class="modaltrigger">新增收货信息</a>
    </article>
</section>
<!--End content-->
<jsp:include page="footer.jsp"/>
<div id="headmodal" style="display:none;">
    <h2>新增收货信息</h2>
    <span>收件人：</span><input type="text" class="addinput" name="receiver_name" id="receiver_name">
    <span>手机号：</span><input type="text" class="addinput" name="receiver_phone" id="receiver_phone">
    <span>收货地址：</span><input type="text" class="addinput" name="receiver_address" id="receiver_address">
    <input type="button" name="addAddress" id="addAddress" class="flatbtn-blu" value="添加" tabindex="1" onclick="addAddress()">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" name="quxiao" id="quxiao" class="flatbtn-blu" value="取消" tabindex="2">
</div>
<div id="headmodal2" style="display:none;">
    <h2>修改收货信息</h2>
    <span>收件人：</span><input type="text" class="addinput" name="receiver_name2" id="receiver_name2">
    <span>手机号：</span><input type="text" class="addinput" name="receiver_phone2" id="receiver_phone2">
    <span>收货地址：</span><input type="text" class="addinput" name="receiver_address2" id="receiver_address2"><span id="adid" style="display: none;"></span><span id="ii" style="display: none;"></span>
    <input type="button" name="addAddress2" id="addAddress2" class="flatbtn-blu" value="修改" tabindex="1" onclick="UpdateAddress()">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.leanModal.min.js"></script>
<script type="text/javascript">
    $(function(){
        //弹出层调用语句
        $('.modaltrigger').leanModal({
            top:110,
            overlay:0.45,
            closeButton:"#quxiao",
            backdrop:'static',
            keyboard:false
        });
    });

    function addAddress() {
        var n = document.getElementById("receiver_name").value;
        var p = document.getElementById("receiver_phone").value;
        var a = document.getElementById("receiver_address").value;
        if (n!=""&&p!=""&&a!=""){
            location.href="${pageContext.request.contextPath}/shop/addAddress.do?name="+n+"&phone="+p+"&address="+a+"&isall=0&iscart=1";
        } else{
            alert("信息不能留空");
        }
    }

    function DisAddress(name,phone,address,address_id,i) {
        var n = document.getElementById("receiver_name2");
        var p = document.getElementById("receiver_phone2");
        var a = document.getElementById("receiver_address2");
        var id = document.getElementById("adid");
        var ii = document.getElementById("ii");
        id.innerHTML = address_id;
        n.value = name;
        p.value = phone;
        a.value = address;
        ii.innerHTML = i-1;
    }

    function UpdateAddress(){
        var n = document.getElementById("receiver_name2");
        var p = document.getElementById("receiver_phone2");
        var a = document.getElementById("receiver_address2");
        var id = document.getElementById("adid");
        var i = document.getElementById("ii");
        if (n.value!=""&&p.value!=""&&a.value!=""&&id.innerHTML!=""){
            $.ajax({
                url:"${pageContext.request.contextPath}/order/updateAddressById.do",
                type:"POST",
                async:true,
                data:{"name":n.value,"phone":p.value,"address":a.value,"id":id.innerHTML},
                success:function (data) {
                    if (data==1){
                        alert("修改成功");
                        document.getElementsByClassName("tdname")[i].innerHTML = n.value;
                        document.getElementsByClassName("tdphone")[i].innerHTML = p.value;
                        document.getElementsByClassName("tdaddress")[i].innerHTML = a.value;
                    }else{
                        alert("未登录，操作失败");
                    }
                },dataType:"text"
            });
        } else{
            alert("信息不能留空");
        }
    }
</script>
</body>
</html>