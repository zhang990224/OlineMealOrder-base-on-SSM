<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/6/7
  Time: 22:48
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>校园网上订餐-我的购物车</title>
    <meta name="keywords" content="DeathGhost,DeathGhost.cn,web前端设,移动WebApp开发" />
    <meta name="description" content="DeathGhost.cn::H5 WEB前端设计开发!" />
    <meta name="author" content="DeathGhost"/>
    <link href="style/style.css" rel="stylesheet" type="text/css" />
    <!--
    Author: DeathGhost
    Author URI: http://www.deathghost.cn
    -->
</head>
<script>
    function changeNum(id,num,i,pr) {
        var price = document.getElementsByClassName("tott")[i-1];
        var number = document.getElementsByClassName("shuliang")[i-1];
        $.ajax({
            url:"${pageContext.request.contextPath}/shop/updateCart.do",
            type:"POST",
            async:"true",
            data:{"menu_id":id,"menu_num":num},
            success:function (data) {
                if (data==1) {
                    price.innerHTML = (pr * num);
                }else{
                    alert("不能购买大于库存的数量");
                    number.value = num-1;
                }
            },dataType:"text"
        });
    }

    function selectAll() {
        var all1 = document.getElementsByClassName("allselect")[0];
        var dan = document.getElementsByClassName("danxuan");
        var price = document.getElementsByClassName("tott");
        var totalprice = 0;
        var allPrice = document.getElementById("zong1");
        var sl = document.getElementById("sl");
        if (all1.checked) {
            for (var a = 0;a<dan.length;a++){
                dan[a].checked = false;
            }
            for (var i = 0;i<price.length;i++){
                totalprice = totalprice +  parseInt(price[i].innerHTML);
                allPrice.innerHTML = totalprice;
            }
            sl.innerHTML = dan.length;
            $("#jz1").css("display", "none");
            $("#jz2").css("display", "block");
        }else{
            allPrice.innerHTML = "0.00";
            sl.innerHTML = "0";
            $("#jz2").css("display", "none");
            $("#jz1").css("display", "block");
        }
    }

    function selectDan() {
        var all = document.getElementsByClassName("allselect")[0];
        var dan = document.getElementsByClassName("danxuan");
        var price = document.getElementsByClassName("tott");
        var sl = document.getElementById("sl");
        var totalprice = 0;
        var checked = 0;
        var allPrice = document.getElementById("zong1");
        for (var a = 0;a<dan.length;a++){
            if (dan[a].checked) {
                totalprice = totalprice +  parseInt(price[a].innerHTML);
                allPrice.innerHTML = totalprice;
                all.checked = false;
                checked++;
            }
            if (checked==0){
                allPrice.innerHTML = "0.00";
                sl.innerHTML = "0";
                $("#jz2").css("display", "none");
                $("#jz1").css("display", "block");
            }else{
                sl.innerHTML = checked;
                $("#jz1").css("display", "none");
                $("#jz2").css("display", "block");
            }
        }
    }

</script>
<body>
<jsp:include page="header.jsp"/>
<!--Start content-->
<form action="#">
    <div class="gwc" style=" margin:auto;">
        <table cellpadding="0" cellspacing="0" class="gwc_tb1">
            <tr>
                <td class="tb1_td1"><input id="Checkbox1" type="checkbox" id="allsel"  class="allselect" onclick="selectAll()"/></td>
                <td class="tb1_td1">全选</td>
                <td class="tb1_td3">商品</td>
                <td class="tb1_td5">数量</td>
                <td class="tb1_td6">单价</td>
                <td class="tb1_td6">小结</td>
                <td class="tb1_td7">操作</td>
            </tr>
        </table>
        <c:forEach items="${cart}" var="ca" varStatus="c">
            <table cellpadding="0" cellspacing="0" class="gwc_tb2">
                <tr>
                    <td colspan="7" class="shopname Font14 FontW">店铺：${ca.menu.shop.shop_name}</td>
                </tr>
                <tr>
                    <td class="tb2_td1"><input type="checkbox" value="${ca.menu_id}" name="newslist" class="danxuan" onclick="selectDan()"/></td>
                    <td class="tb2_td2"><a href="detailsp.html" target="_blank"><img src="${pageContext.request.contextPath}/${ca.menu.menu_img}"/></a></td>
                    <td class="tb2_td3"><a href="detailsp.html" target="_blank">${ca.menu.menu_name}</a></td>
                    <td class="tb1_td5">
                        <input class="shuliang" type="number" min="1" style="width: 70px;height: 35px;border:2px solid #ccc;text-align: center;font-size:16px;color:#ff6700;" onchange="changeNum(${ca.menu_id},this.value,${c.count},${ca.menu.menu_price});" value=${ca.menu_num}>
                    </td>
                    <td class="tb1_td6"><label class="tot" style="color:#ff5500;font-size:14px; font-weight:bold;">${ca.menu.menu_price}</label></td>
                    <td class="tb1_td6"><label class="tott" style="color:#ff5500;font-size:14px; font-weight:bold;">${ca.menu.menu_price*ca.menu_num}</label></td>
                    <td class="tb1_td7"><a href="#tishimodal1" class="modaltrigger" onclick="disC(${ca.menu_id},${c.count})">删除</a></td>
                </tr>
            </table>
        </c:forEach>
        <table cellpadding="0" cellspacing="0" class="gwc_tb3">
            <tr>
                <td class="tb3_td2 GoBack_Buy Font14"><a href="${pageContext.request.contextPath}/shop/disAllShop.do?page=1&shop_type=全部&shop_price=全部" target="_blank">继续购物</a></td>
                <td class="tb3_td2">已选商品
                    <label id="sl" style="color:#ff5500;font-size:14px; font-weight:bold;">0</label>
                    件</td>
                <td class="tb3_td3">合计(不含运费):<span>￥</span><span style=" color:#ff5500;">
        <label id="zong1" style="color:#ff5500;font-size:14px; font-weight:bold;">0.00</label>
        </span></td>
                <td class="tb3_td4"><span id="jz1">结算</span><div onclick="addOrder()"><a href="#" style=" display:none;" class="jz2" id="jz2">结算</a></div></td>
            </tr>
        </table>
    </div>
</form>
<jsp:include page="footer.jsp"/>
<div id="tishimodal1" style="display:none;">
    <p style="font-size: 16px;font-weight: bold;">是否从购物车移除该商品</p><div style="display: none"><span id="ci_id"></span><span id="ic"></span></div>
    <input type="button" name="btn1" id="btn1" class="flatbtn-blu" value="确定" tabindex="1" onclick="deleteCart()">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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

    function disC(ci_id,i) {
        var c = document.getElementById("ci_id");
        var ic = document.getElementById("ic");
        c.innerHTML = ci_id;
        ic.innerHTML = i-1;
    }

    function deleteCart() {
        var c = document.getElementById("ci_id");
        var ic = document.getElementById("ic").innerHTML;
        var cart = document.getElementsByClassName("gwc_tb2")[ic];
        $.ajax({
            url:"${pageContext.request.contextPath}/shop/deleteCart.do",
            type:"POST",
            async:"true",
            data:{"menu_id":c.innerHTML},
            success:function (data) {
                if (data=="1"){
                    cart.style.display = "none";
                }else{
                    alert("未登录，操作失败");
                }
            },error:function (){
                alert("操作失败");
            }, dataType:"text"

        });
    }

    function addOrder() {
        var dan = document.getElementsByClassName("danxuan");
        var all = document.getElementsByClassName("allselect")[0];
        var checked = 0;
        var id=new Array();
        if (all.checked){
            for (var a = 0;a<dan.length;a++){
                id[a] = dan[a].value
            }
            if (dan.length>0){
                location.href = "${pageContext.request.contextPath}/shop/confirmCart.do?isall=2&id="+id;
            }
        } else{
            for (var a = 0;a<dan.length;a++){
                if (dan[a].checked) {
                    id[checked] = dan[a].value
                    checked++;
                }
                if(a==dan.length-1){
                    if (checked>0){
                        location.href = "${pageContext.request.contextPath}/shop/confirmCart.do?isall=2&id="+id;
                    }else{
                        alert("没有选择购物车中任何商品");
                    }
                }
            }
        }
    }
</script>
</body>
