<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/6/5
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>校园网上订餐-用户中心</title>
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
        <!--"引用“user_page/user_index.html”"-->
        <section class="usercenter">
            <span class="Weltitle Block Font16 CorRed FontW Lineheight35">Welcome欢迎光临！</span>
            <div class="U-header MT20 Overflow">
                <a href="#headmodal" class="modaltrigger"><img src="${pageContext.request.contextPath}/${user.getImg()}" id="userHead"></a>
                <p class="Font14 FontW">${user.getUsername()} 欢迎您回到 用户中心！</p>
                <p class="Font12">你下单，我开心，你吃的开心，我卖的放心(･ω･)</p>
                <p class="Font14 FontW">【<a href="#headmodal2" class="modaltrigger">修改密码</a>】</p>
            </div>
        </section>
    </article>
</section>
<!--End content-->
<jsp:include page="footer.jsp"/>
<div id="headmodal" style="display:none;">
    <h2>头像修改</h2>
        <img style="width: 100px;height: 100px;" id="imghead" src="${pageContext.request.contextPath}/${user.getImg()}" alt="">
        <input type="file" id="uploadhead" name="uploadhead"  tabindex="1" style="width: 70px;margin-left:20px;margin-right:10px;display: inline-block;" onchange="returnHead()">
        <input type="button" name="uploadbtn" id="uploadbtn" class="flatbtn-blu hidemodal" value="保存" tabindex="2" onclick="saveHead()">
        <span id="hi" style="display: none"></span>
        <span style="font-size:12px;">提示:若图片名含特殊字符可能会导致更换失败</span>
</div>
<div id="headmodal2" style="display:none;">
    <h2>修改密码</h2>
    <span>旧密码：</span><input type="password" class="addinput" name="old" id="old">
    <span>新密码：</span><input type="password" class="addinput" name="new" id="new">
    <input type="button" name="updatePsw" id="updatePsw" class="flatbtn-blu" value="修改" tabindex="1" onclick="updatePsw()">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" name="quxiao" id="quxiao" class="flatbtn-blu" value="取消" tabindex="2">
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

    function returnHead() {
        var formData = new FormData();
        var file = $('#uploadhead')[0].files[0];
        formData.append("upload",file);
        var head = document.getElementById("imghead");
        var hi = document.getElementById("hi");
        $.ajax({
            url:"${pageContext.request.contextPath}/user/returnHead.do",
            async:true,
            processData: false,   // jQuery不要去处理发送的数据
            contentType: false,   // jQuery不要去设置Content-Type请求头
            type:"POST",
            data: formData,
            success:function (data) {
                head.src="${pageContext.request.contextPath}/"+data;
                hi.innerHTML = data;
            },
            error:function () {
                alert("更新失败");
            },
            dataType:"text"
        });
    }

    function saveHead() {
        var userhead = document.getElementById("userHead");
        var hi = document.getElementById("hi").innerHTML;
        $.ajax({
            url:"${pageContext.request.contextPath}/user/updateHead.do",
            async:true,
            type:"POST",
            data: "head="+hi,
            success:function (data) {
                userhead.src = "${pageContext.request.contextPath}/"+hi;
                alert(data);
            },
            error:function () {
                alert("更新失败");
            },
            dataType:"text"
        });
    }

    function updatePsw() {
        var oldp = document.getElementById("old");
        var newp = document.getElementById("new");
        if (oldp.value!="" && newp.value!=""){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/updatePsw.do",
                async:true,
                type:"POST",
                data: {"oldp":oldp.value,"newp":newp.value},
                success:function (data) {
                    oldp.value = "";
                    newp.value = "";
                    alert(data);
                },
                error:function () {
                    alert("修改失败");
                },
                dataType:"text"
            });
        } else{
            alert("密码不能为空");
        }
    }
</script>
</body>
</html>
