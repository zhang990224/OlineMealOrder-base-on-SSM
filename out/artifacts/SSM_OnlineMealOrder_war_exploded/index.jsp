<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/6/4
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html>
<head>
  <meta charset="utf-8" />
  <title>校园网上订餐</title>
  <meta name="keywords" content="DeathGhost,DeathGhost.cn,web前端设,移动WebApp开发" />
  <meta name="description" content="DeathGhost.cn::H5 WEB前端设计开发!" />
  <meta name="author" content="DeathGhost"/>
  <!--
  Author: DeathGhost
  Author URI: http://www.deathghost.cn
  -->
  <script>

  </script>
</head>
<body>
<jsp:include page="header.jsp"/>
<!--Start content-->
<section class="Cfn">
  <aside class="C-left">
    <div class="S-time">服务时间：周一~周六<time>08:00</time>-<time>23:00</time></div>
    <div class="C-time">
      <img src="${pageContext.request.contextPath}/upload/dc.jpg"/>
    </div>
    <a href="list.html" target="_blank"><img src="${pageContext.request.contextPath}/images/by_button.png"></a>
    <a href="list.html" target="_blank"><img src="${pageContext.request.contextPath}/images/dc_button.png"></a>
  </aside>
  <div class="F-middle">
    <ul class="rslides f426x240">
      <li><a href="javascript:"><img src="${pageContext.request.contextPath}/upload/01.jpg"/></a></li>
      <li><a href="javascript:"><img src="${pageContext.request.contextPath}/upload/02.jpg" /></a></li>
      <li><a href="javascript:"><img src="${pageContext.request.contextPath}/upload/03.jpg"/></a></li>
    </ul>
  </div>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>

