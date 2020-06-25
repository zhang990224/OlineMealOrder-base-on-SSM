<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/6/9
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>确认订单-校园网上订餐</title>
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
<section class="Psection MT20" id="Cflow">
    <!--如果用户未添加收货地址，则显示如下-->
    <div class="confirm_addr_f">
        <span class="flow_title">收货地址：</span>
        <!--如果未添加地址，则显示此表单-->
        <form class="add_address" action="#" style="display:none;">
            <p><i>收件人姓名：</i><input type="text" name="" required></p>
            <p>
                <i>选择所在地：</i>
                <select name="">
                    <option>广东省</option>
                </select>
                <select name="">
                    <option>广州市</option>
                </select>
                <select name="">
                    <option>白云区</option>
                </select>
            </p>
            <p><i>街道地址：</i><input type="text" required size="50"></p>
            <p><i>手机号码：</i><input type="text" name="" required pattern="[0-9]{11}"></p>
            <p><i></i><input name="" type="submit" value="确定"></p>
        </form>
        <!--已保存的地址列表-->
        <form action="#">
            <ul class="address">
                <c:forEach items="${address}" var="ad" varStatus="a">
                    <li class="style1" onclick="cunId(${ad.id});"><input type="radio" id="${a.count}" class="ad" name="rdColor" onclick="changeColor(${a.count});"/><label> ${ad.receiver_address}（${ad.receiver_name}收）<span class="fontcolor">${ad.receiver_phone}</span></label></li>
                </c:forEach>
                <span style="display: none" id="cunId"></span>
                <li><a href ="#headmodal" class="modaltrigger"><img src="${pageContext.request.contextPath}/images/newaddress.png"/></a></li>
            </ul>
        </form>
        <!--add new address-->
        <form action="#">
            <div id="light" class="O-L-content">
                <ul>
                    <li><span><label>选择所在地：</label></span><p><em>*</em><select name=""><option>广东省</option></select> <select name=""><option>广州市</option></select> <select name=""><option>白云区</option></select></p></li>
                    <li><span><label>街道地址：</label></span><p><em>*</em><textarea name="" cols="80" rows="5"></textarea></p></li>
                    <li><span><label>收件人姓名：</label></span><p><em>*</em><input name="" type="text"></p></li>
                    <li><span><label>手机号码：</label></span><p><em>*</em><input name="" type="text" pattern="[0-9]{11}" required></p></li>
                    <div class="button-a"><input type="button" value="确 定" class="C-button" /><a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"><span><input name="" type="button" value="取 消"  class="Cancel-b"/></span></a></div>
                    <div class="close-botton"><a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"></a></div>
            <div id="fade" class="overlay"></div>
            </ul>
            </div>
            <!--End add new address-->
        </form>
    </div>
    <!--配送方式及支付，则显示如下-->
    <!--check order or add other information-->
    <div class="pay_delivery">
        <span class="flow_title">配送方式：</span>
        <table>
            <th width="30%">配送方式</th>
            <th width="30%">运费</th>
            <th width="40%">说明</th>
            <tr>
                <td>送货上门</td>
                <td>￥3.00</td>
                <td>配送说明信息...</td>
            </tr>
        </table>
        <span class="flow_title">在线支付方式：</span>
        <form action="#">
            <ul>
                <li><input type="radio" name="pay" id="alipay" value="alipay" /><label for="alipay"><i class="alipay"></i></label></li>
            </ul>
        </form>
    </div>
    <form action="#">
        <div class="inforlist">
            <span class="flow_title">商品清单</span>
            <table>
                <th>名称</th>
                <th>数量</th>
                <th>价格</th>
                <th>小计</th>
                <c:set var="pricesum" value="0"></c:set>
                <c:forEach items="${carts}" varStatus="c" var="ca">
                    <tr>
                        <td>${ca.menu.menu_name}</td>
                        <td>${ca.menu_num}</td>
                        <td>￥${ca.menu.menu_price}</td>
                        <td>￥${ca.menu.menu_price*ca.menu_num}</td>
                    </tr>
                    <c:set var="pricesum" value="${pricesum + ca.menu.menu_price*ca.menu_num}"></c:set>
                </c:forEach>
            </table>
            <div class="Sum_infor">
                <p class="p1">配送费用：￥3.00（统一价格）</p>
                <p class="p2">合计：<span>￥<span id="pricesum">${pricesum+3}</span></span></p>
                <input type="button" value="提交订单" onclick="addOrder()"  class="p3button"/>
            </div>
        </div>
    </form>
    </div>
</section>
<script>
    //Test code,You can delete this script /2014-9-21DeathGhost/
    $(document).ready(function(){
        var submitorder =$.noConflict();
        submitorder(".p3button").click(function(){
            submitorder("#Cflow").hide();
            submitorder("#Aflow").show();
        });
    });
</script>
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
            location.href="${pageContext.request.contextPath}/shop/addAddress.do?name="+n+"&phone="+p+"&address="+a+"&isall=${isall}&iscart=2";
        } else{
            alert("信息不能留空");
        }
    }

    function cunId(id) {
        var cunId = document.getElementById("cunId");
        cunId.innerHTML = id;
    }

    function addOrder() {
        var cunId = document.getElementById("cunId");
        var price = document.getElementById("pricesum");
        var ad = document.getElementsByClassName("ad");
        var ji = 0;
        for (var a = 0;a<ad.length;a++){
            if (ad[a].checked){
                ji++;
            }
        }
        if (ji==1){
            location.href="${pageContext.request.contextPath}/order/createOrder.do?address_id="+cunId.innerHTML+"&price="+price.innerHTML;
        } else{
            alert("请选择收货地址");
        }
    }
</script>
</body>
</html>
