<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/2/20
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>提示-下单成功</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div style="margin-top: 50px;text-align: center;">
    <span style="font-size: 22px;font-weight: bold;">下单成功(#^.^#)</span>
    <div>
        <img src="${pageContext.request.contextPath}/images/success.jpg" style="width: 200px;height: 200px">
    </div>
    <br/>
    <tr style="font-weight: bold;font-size: 16px">订单ID：<td id="oid">${order_id}</td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</tr>
    <br/>
    <div style="margin-right: 100px;float: left;margin-left: 645px;margin-top: 50px;">
        <a style="text-decoration: none" href="${pageContext.request.contextPath}/order/disOrderById.do?page=1&pageSize=6">查看订单</a>
    </div>
    <div style="float: left;margin-top: 50px;">
        <a style="text-decoration: none" href="#tishimodal1" class="modaltrigger">模拟支付</a>
    </div>
</div>
<div id="tishimodal1" style="display:none;">
    <p style="font-size: 16px;font-weight: bold;">是否确定进行支付</p><div style="display: none"></div>
    <input type="button" name="btn1" id="btn1" class="flatbtn-blu" value="确定" tabindex="1" onclick="UpdatePay()">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" name="btn1" id="btn2" class="flatbtn-blu" value="取消" tabindex="2" >
</div>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.leanModal.min.js"></script>
<script type="text/javascript">
    $(function(){
        //弹出层调用语句
        $('.modaltrigger').leanModal({
            top:110,
            overlay:0.45,
            closeButton:".flatbtn-blu",
            backdrop:'static',
            keyboard:false
        });
    });

    function UpdatePay() {
        var order_id = ${order_id};
        $.ajax({
            url:"${pageContext.request.contextPath}/order/updatePayState.do",
            type:"POST",
            async:true,
            data:{"paystate":1,"order_id":order_id,"isOrder":1},
            success:function (data) {
                if (data==1){
                    alert("支付成功");
                }else{
                    alert(data);
                }
            },dataType:"text"
        })
    }
</script>
</body>
</html>
