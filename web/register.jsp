<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/6/4
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>校园网上订餐-注册</title>
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

    $(function () {
        //为输入框绑定事件
        $("#username").blur(function () {
            //1.失去焦点后获取输入框内容
            var usernameInput = $(this).val();
            //2.去服务器校验用户名是否存在--ajax
            if (usernameInput!=""){
                if (usernameInput.length<=6){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/user/findUsername.do",
                        async:true,
                        type:"POST",
                        data: "username="+usernameInput,
                        success:function (data) {
                            if (data=="true"){
                                $("#uname").css("color","red");
                                $("#uname").html("该用户名已存在");
                            } else{
                                $("#uname").css("color","green");
                                $("#uname").html("✔");
                            }
                        },dataType:"text"
                    });
                } else{
                    $("#uname").css("color","red");
                    $("#uname").html("用户名长度不超过6位");
                }
            } else{
                $("#uname").css("color","red");
                $("#uname").html("用户名不能为空");
            }
        });

        //为输入框绑定事件
        $("#password1").blur(function () {
            //1.失去焦点后获取输入框内容
            var usernameInput = $(this).val();
            if (usernameInput.length>=8 && usernameInput.length<=12){
                $("#psw1").css("color","green");
                $("#psw1").html("✔");
            }else{
                $("#psw1").css("color","red");
                $("#psw1").html("密码长度应于8位至12位");
            }
        });

        //为输入框绑定事件
        $("#password2").blur(function () {
            //1.失去焦点后获取输入框内容
            var usernameInput = $(this).val();
            var password = $("#password1").val();
            if (usernameInput == password){
                $("#psw2").css("color","green");
                $("#psw2").html("✔");
            }else{
                $("#psw2").css("color","red");
                $("#psw2").html("两次密码不一致");
            }
        });

        //为输入框绑定事件
        $("#email").blur(function () {
            //1.失去焦点后获取输入框内容
            var usernameInput = $(this).val();
            if (usernameInput!=""){
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/findEmail.do",
                    async:true,
                    type:"POST",
                    data: "email="+usernameInput,
                    success:function (data) {
                        if (data=="0"){
                            $("#em").css("color","green");
                            $("#em").html("✔");
                        } else if (data=="1") {
                            $("#em").css("color","red");
                            $("#em").html("该邮箱不可用");
                        }else{
                            $("#em").css("color","red");
                            $("#em").html("该邮箱格式有误");
                        }
                    },dataType:"text"
                });
            }else{
                $("#em").css("color","red");
                $("#em").html("邮箱不能为空");
            }
        });

        //为输入框绑定事件
        $("#phone").blur(function () {
            //1.失去焦点后获取输入框内容
            var usernameInput = $(this).val();
            if (usernameInput!=""){
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/findPhone.do",
                    async:true,
                    type:"POST",
                    data: "phone="+usernameInput,
                    success:function (data) {
                        if (data=="0"){
                            $("#ph").css("color","green");
                            $("#ph").html("✔");
                        } else if (data=="1") {
                            $("#ph").css("color","red");
                            $("#ph").html("该手机不可用");
                        }else{
                            $("#ph").css("color","red");
                            $("#ph").html("该手机号格式有误");
                        }
                    },dataType:"text"
                });
            }else{
                $("#ph").css("color","red");
                $("#ph").html("手机号不能为空");
            }
        });
    });

    function Register() {
        var uname = $("#uname").html();
        var psw1 = $("#psw1").html();
        var psw2 = $("#psw2").html();
        var em = $("#em").html();
        var ph = $("#ph").html();
        var yzm = $("#yzm").val();
        if (uname=="✔"&&psw1=="✔"&&psw2=="✔"&&em=="✔"&&ph=="✔"){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/validateCode.do",
                async:true,
                type:"POST",
                data: "yzm="+yzm,
                success:function (data) {
                    if (data=="1"){
                        alert("注册成功！");
                        $("#forma").submit();
                    }else{
                        alert("验证码错误！")
                    }
                },dataType:"text"
            });
        }
    }
</script>
<body>
<jsp:include page="header.jsp" />
<!--Start content-->
<section class="Psection MT20">
    <form id="forma" method="post" action="${pageContext.request.contextPath}/user/register.do">
        <table class="Register">
            <tr>
                <td width="40%" align="right" class="FontW">用户名：</td>
                <td><input type="text" id="username" name="username" required autofocus></td>
                <td><span id="uname" style="font-weight: bold;"></span></td>
            </tr>
            <tr>
                <td width="40%" align="right" class="FontW">密码：</td>
                <td><input type="password" id="password1" name="password1" required></td>
                <td><span id="psw1" style="font-weight: bold;"></span></td>
            </tr>
            <tr>
                <td width="40%" align="right" class="FontW">再次确认：</td>
                <td><input type="password" id="password2" name="password2" required></td>
                <td><span id="psw2" style="font-weight: bold;"></span></td>
            </tr>
            <tr>
                <td width="40%" align="right" class="FontW">电子邮件：</td>
                <td><input type="email" id="email" name="email" required></td>
                <td><span id="em" style="font-weight: bold;"></span></td>
            </tr>
            <tr>
                <td width="40%" align="right" class="FontW">手机号码：</td>
                <td><input type="text" id="phone" name="phone" required pattern="[0-9]{11}"></td>
                <td><span id="ph" style="font-weight: bold;"></span></td>
            </tr>
            <tr>
                <td width="40%" align="right" class="FontW">验证码：</td>
                <td><input type="text" id="yzm" name="yzm" required><img src="${pageContext.request.contextPath}/user/checkCode.do" id="checkCode" onclick="getPic()" style="margin-left:8px; vertical-align:bottom" width="83" height="36"></td>
            </tr>
            <tr>
                <td width="40%" align="right"></td>
                <td><input type="button" name="" class="Submit_b" value="注 册" onclick="Register()">( 已经是会员，<a href="${pageContext.request.contextPath}/login.jsp" class="BlueA">请登录</a> )</td>
            </tr>
        </table>
    </form>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>
