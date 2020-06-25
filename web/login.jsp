<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/6/4
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<html>
<head>
    <meta charset="utf-8" />
    <title>校园网上订餐-登录</title>
    <meta name="keywords" content="DeathGhost,DeathGhost.cn,web前端设,移动WebApp开发" />
    <meta name="description" content="DeathGhost.cn::H5 WEB前端设计开发!" />
    <meta name="author" content="DeathGhost"/>
    <!--
    Author: DeathGhost
    Author URI: http://www.deathghost.cn
    -->
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
    function getPic(){
        $("#checkCode").attr("src","${pageContext.request.contextPath}/user/checkCode.do?flag="+Math.random());
    };

    function login() {
        var input = $("#input").val();
        var psw = $("#password").val();
        var yzm = $("#yanzhen").val();
        if (input!="" && psw!="" && yzm!=""){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/YanZhenLogin.do",
                async:true,
                type:"POST",
                data: {"input":input,"password":psw,"yzm":yzm},
                success:function (data) {
                    if (data=="1"){
                        alert("登陆成功！");
                        $("#formb").submit();
                    } else if (data=="0") {
                        alert("验证码错误！");
                    }else{
                        alert("账号或密码错误！");
                    }
                },dataType:"text"
            });
        }else{
            alert("内容不能为空");
        }
    }
</script>
<body>
<jsp:include page="header.jsp" />
<!--Start content-->
<section class="Psection MT20">
    <form action="${pageContext.request.contextPath}/user/Login.do" method="post" id="formb">
        <table class="login">
            <tr>
                <td width="40%" align="right" class="FontW">账号：</td>
                <td><input type="text" name="input" id="input" required autofocus placeholder="用户名/电子邮件/手机号码"></td>
            </tr>
            <tr>
                <td width="40%" align="right" class="FontW">密码：</td>
                <td><input type="password" id="password" name="password" required></td>
            </tr>
            <tr>
                <td width="40%" align="right" class="FontW">验证码：</td>
                <td><input type="text" name="yanzhen" id="yanzhen" required><img src="${pageContext.request.contextPath}/user/checkCode.do" id="checkCode" style="margin-left:8px; vertical-align:bottom" onclick="getPic()" width="83" height="36"></td>
            </tr>
            <tr>
                <td width="40%" align="right"></td>
                <td><input type="button" name="loginbt" value="登 录" class="Submit_b" onclick="login()">( 还不是会员，<a href="${pageContext.request.contextPath}/register.jsp" class="BlueA">请注册</a> )</td>
            </tr>
        </table>
        <a href="${pageContext.request.contextPath}/admin_login.jsp" style="font-weight: bold;font-size: 14px;">商家入口</a>
    </form>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>
