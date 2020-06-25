<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/4/25
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>校园订餐后台管理登陆</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--可无视-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/bootstrap.min.css">

<!--主要样式-->
<link type="text/css" href="${pageContext.request.contextPath}/style/style2.css" rel="stylesheet" />

<script>
    if(self!=top)
    {
        parent.location.href='${pageContext.request.contextPath}/admin_login.jsp';
    }
    function CheckLogin(obj){
        if(obj.username.value=='')
        {
            alert('请输入用户名');
            obj.username.focus();
            return false;
        }
        if(obj.password.value=='')
        {
            alert('请输入登录密码');
            obj.password.focus();
            return false;
        }
        return true;
    }
</script>
<style>
    body{
        background: url(style/banner.jpg);
        background-attachment: fixed;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 100%;
    }
</style>
</head>
<body>

<div class="container" align="center">
    <div class="col-md-6" style="margin-top: 8%;">
        <div class="inset">
            <form name="login" id="login" method="post" action="${pageContext.request.contextPath}/user/findAdmin.do" onSubmit="return CheckLogin(document.login);">
                <input type="hidden" name="enews" value="login">
                <div>
                    <h2>校园订餐后台管理</h2>
                    <span style="text-align: left;text-indent: 0.4em;"><label>用户名</label></span>
                    <span><input type="text" name="username" class="textbox" id="username"></span>
                </div>
                <div>
                    <span style="text-align: left;text-indent: 0.4em;"><label>密码</label></span>
                    <span><input  name="password" type="password" class="password" id="password"></span>
                </div>
                <div class="sign">
                    <input type="reset"  class="submit" value="重置"/>
                    <input type="submit" value="登录" class="submit" />
                </div>
                <a href="${pageContext.request.contextPath}/login.jsp">【用户端】</a>
            </form>
        </div>
    </div>
</div>
</body>
</html>
