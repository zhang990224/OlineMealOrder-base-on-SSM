<%--
  Created by IntelliJ IDEA.
  User: fdg
  Date: 2020/2/14
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>admin_shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style1.css">
</head>
<style>
    a{
        text-decoration: none;
        color: #999999;
        font-weight: bold;
    }
</style>
<body>
<div style="width:1472px;height: 30px;background-color: #000000;padding: 15px;">
    <div style="height: 30px;color: white;font-size: 16px;display: inline-block;">欢迎来到管理员界面，</div>
    <div style="width: 60px;height: 30px;color: white;font-size: 16px;display: inline-block;">${admin.getUsername()}</div>
    <div style="height: 30px;color: red;font-size: 16px;display: inline-block;"><a href="${pageContext.request.contextPath}/user/cannelAdmin.do">【安全退出】</a></div>
</div>
<div style="width: 200px;height:673px;border:double;text-align: center;float: left;">
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;"><a href="${pageContext.request.contextPath}/admin_index.jsp">首页</a></div>
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;"><a href="${pageContext.request.contextPath}/user/disUser.do?page=1&username=">用户管理</a></div>
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;font-size: 16px;"><a href="${pageContext.request.contextPath}/shop/disShop.do?page=1&shop=">店铺管理</a></div>
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;"><a href="${pageContext.request.contextPath}/order/disOrder.do?page=1&orderId=">订单管理</a></div>
    <div style="margin-top: 30px;margin-right: 20px;font-weight: bold;"><a href="${pageContext.request.contextPath}/shop/disSell.do">业绩管理</a></div>
</div>
<div style="width: 1293px;height:673px;border:double;float: left;">
    <div style="font-weight: bold;font-size: 22px;margin: 10px;">店铺管理</div>
    <form action="${pageContext.request.contextPath}/shop/AddShop.do" method="post" id="forma" enctype="multipart/form-data">
        <div style="margin: 10px;">
            店铺名称：<input type="text" name="sname" id="sname" style="height: 30px;margin-right: 10px"/>
            店铺类型：<select name="stype" id="stype" style="width: 100px; height: 30px;margin-right: 70px;">
            <option value="甜品饮品">甜品饮品</option>
            <option value="汉堡披萨">汉堡披萨</option>
            <option value="炸鸡烤串">炸鸡烤串</option>
            <option value="快餐便当">快餐便当</option>
            <option value="包子粥店">包子粥店</option>
            <option value="米粉面馆">米粉面馆</option>
            <option value="麻辣烫">麻辣烫</option>
            <option value="鸭脖卤味">鸭脖卤味</option>
            <option value="烧烤海鲜">烧烤海鲜</option>
        </select>
            店铺特色：<input type="text" name="sspecial" id="sspecial" style="height: 30px;margin-right: 10px;"/>
        </div>
        <div style="margin:10px;">
            店铺优惠：<input type="text" name="sdiscount" id="sdiscount" style="height: 30px;margin-right: 10px"/>
            商品价格：<select name="sprice" id="sprice" style="width: 100px; height: 30px;margin-right: 70px;">
            <option value="20元以下">20元以下</option>
            <option value="20-50元">20-50元</option>
            <option value="50-80元">50-80元</option>
            <option value="80-120元">80-120元</option>
            <option value="120元以上">120元以上</option>
        </select>
            上传图片：<input type="file" name="upload" id="upload" style="height: 30px;"/>
        </div>
        <div style="margin: 10px;">
            店铺地址：<input type="text" name="saddress" id="saddress" style="height: 30px;margin-right: 10px"/>
            联系方式：<input type="text" name="sphone" id="sphone" style="height: 30px;margin-right: 10px"/>
            营业时间：<input type="text" name="sopentime" id="sopentime" style="height: 30px;margin-right: 10px"/>
            <input type="button" value="开店" id="shang" onclick="jianyan()" style="height: 30px;width:50px;margin-left: 50px;background-color: white;color: black;cursor: pointer;font-weight: bold;"/>
            <span id="tishi" style="color: red;"></span>
        </div>
    </form>

<div style="clear:both"></div>
    <div style="margin-top: 15px;margin-left: 10px;">
            <input type="text" id="shopId" value="${shop}">
            <input type="submit" value="搜索" id="sear"  style="height: 30px;width:50px;background-color: white;color: black;cursor: pointer;font-weight: bold;" onclick="search()"/>
            （有${num}件商品）
        </form>
    </div>
<div style="margin:10px;">
        <table style=" text-align: center" >
            <tr>
                <th style="width: 50px;">序号</th>
                <th style="width: 120px;">店铺名称</th>
                <th style="width: 80px;">店铺图片</th>
                <th style="width: 120px;">店铺类型</th>
                <th style="width: 120px;">平均价位</th>
                <th style="width: 120px;">联系方式</th>
                <th style="width: 150px;">店铺地址</th>
                <th style="width: 100px;">店铺优惠</th>
                <th style="width: 100px;">营业时间</th>
                <th style="width: 80px;">店铺状态</th>
            </tr>
            <c:forEach items="${all.list}" var="shop" varStatus="s">
            <tr>
                <td style="height: 80px;border: 1px dashed;">${s.count}</td>
                <td style="height: 80px;border: 1px dashed;"><a href="#headmodal" class="modaltrigger" onclick="DisShop(${shop.id},'${shop.shop_name}','${shop.shop_img}','${shop.shop_type}','${shop.shop_price}','${shop.shop_special}','${shop.shop_phone}','${shop.shop_address}','${shop.shop_discount}','${shop.opentime}',${shop.shop_state})">${shop.shop_name}</a></td>
                <td style="height: 80px;border: 1px dashed;"><a href="#headmodal1" class="modaltrigger" onclick="DisCategoryItem()"><img src="${pageContext.request.contextPath}/${shop.shop_img}" style="width: 70px;height: 70px;" class="himg"></a></td>
                <td style="height: 80px;border: 1px dashed;" class="st">${shop.shop_type}</td>
                <td style="height: 80px;border: 1px dashed;" class="spr">${shop.shop_price}</td>
                <td style="height: 80px;border: 1px dashed;display: none" class="ss">${shop.shop_special}</td>
                <td style="height: 80px;border: 1px dashed;" class="sph">${shop.shop_phone}</td>
                <td style="height: 80px;border: 1px dashed;" class="sa">${shop.shop_address}</td>
                <td style="height: 80px;border: 1px dashed;" class="sd">${shop.shop_discount}</td>
                <td style="height: 50px;border: 1px dashed;" class="so">${shop.opentime}</td>
                <td style="height: 50px;border: 1px dashed;" class="s">
                    <a href="${pageContext.request.contextPath}/shop/disMenuByShop.do?page=1&id=${shop.id}">
                        <c:if test="${shop.shop_state==1}">开店中</c:if>
                        <c:if test="${shop.shop_state==0}">关店中</c:if>
                    </a>
                </td>
            </tr>
            </c:forEach>
            <tr>
                <td style="height: 30px;">
                    <c:if test="${all.currentPage > 1}">
                        <a href="${pageContext.request.contextPath}/shop/disShop.do?page=${all.currentPage-1}&shop=">上一页</a>
                    </c:if>
                </td>
                当前第${all.currentPage}页/总${all.totalPage}页
                <td style="height: 30px;">
                    <c:if test="${all.currentPage < all.totalPage}">
                        <a href="${pageContext.request.contextPath}/shop/disShop.do?page=${all.currentPage+1}&shop=">下一页</a>
                    </c:if>
                </td>
            </tr>
        </table>
    </div>
</div><span id="sid" style="display: none;"></span><span id="state" style="display: none;"></span>
</div><span id="which" style="display: none;"></span><span id="ia" style="display: none;"></span>
<div id="headmodal" style="display:none;">
    <h3>信息：<span id="shopname" style="font-weight: bold;font-size: 18px;"></span></h3>
    <div>
        店铺类型：<select name="stype1" id="stype1" style="width: 100px; height: 30px;margin-right: 70px;">
        <option value="甜品饮品">甜品饮品</option>
        <option value="汉堡披萨">汉堡披萨</option>
        <option value="炸鸡烤串">炸鸡烤串</option>
        <option value="快餐便当">快餐便当</option>
        <option value="包子粥店">包子粥店</option>
        <option value="米粉面馆">米粉面馆</option>
        <option value="麻辣烫">麻辣烫</option>
        <option value="鸭脖卤味">鸭脖卤味</option>
        <option value="烧烤海鲜">烧烤海鲜</option></select>
    </div>
    平均价格：<select name="sprice1" id="sprice1" style="width: 100px; height: 30px;margin-right: 70px;">
    <option value="20元以下">20元以下</option>
    <option value="20-50元">20-50元</option>
    <option value="50-80元">50-80元</option>
    <option value="80-120元">80-120元</option>
    <option value="120元以上">120元以上</option></select>
    <br>
    商品封面：<img src="" id="fengmian" style="width: 80px;height: 80px;">&nbsp;<a href="#headmodal2" class="modaltrigger" id="genggai">更改</a><br>
    店铺优惠：<br>
    <textarea class="uk-textarea" style=" height:30px;width:180px;padding: 5px;margin-top: 5px;margin-right: 10px" id="sdiscount1"></textarea><br>
    店铺特色：<br>
    <textarea class="uk-textarea" style=" height:30px;width:180px;padding: 5px;margin-top: 5px;margin-right: 10px" id="sspecial1"></textarea><br>
    店铺地址：<br>
    <textarea class="uk-textarea" style=" height:30px;width:180px;padding: 5px;margin-top: 5px;margin-right: 10px" id="saddress1"></textarea><br>
    联系方式：<br>
    <textarea class="uk-textarea" style=" height:30px;width:180px;padding: 5px;margin-top: 5px;margin-right: 10px" id="sphone1"></textarea><br>
    营业时间：<br>
    <textarea class="uk-textarea" style=" height:30px;width:180px;padding: 5px;margin-top: 5px;margin-right: 10px" id="sopentime1"></textarea><br>
    <a href="#" id="baocun" onclick="UpdateShop()">保存</a>&nbsp;&nbsp;
    <a href="#" id="xiajia" onclick="UpdateShopState()">开店</a>
</div>
<div id="headmodal2" style="display:none;">
    <h2>图片修改</h2>
    <form id="headform" name="headform" method="post" action="#">
        <img style="width: 100px;height: 100px;" id="imghead" src="" alt="">
        <input type="file" id="uploadhead" name="uploadhead"  style="width: 90px;margin-left:20px;margin-right:10px;display: inline-block;" onchange="returnHead()">
        <a style="cursor: pointer;" name="uploadbtn" id="uploadbtn" tabindex="2" onclick="saveHead()">保存</a>
        <span id="hi" style="display: none"></span>
        <br>
        <span style="font-size:12px;">提示:若图片名含特殊字符可能会导致更换失败</span>
    </form>
</div>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.leanModal.min.js"></script>
<script type="text/javascript">
    $(function(){
        //弹出层调用语句
        $('.modaltrigger').leanModal({
            top:110,
            overlay:0.45,
            closeButton:"#btn4",
            backdrop:'static',
            keyboard:false
        });
    });

    function deleteCategory() {
        var ciid = document.getElementById("ci_id");
        var cid = document.getElementById("c_id");
        if (ciid.innerHTML!="" && cid.innerHTML!=""){
            location.href="${pageContext.request.contextPath}/category/deleteCategory.do?cid="+cid.innerHTML+"&ciid="+ciid.innerHTML;
        }else{
            alert("没有选择可删除的商品");
        }
    }

    function jianyan() {
        var name = document.getElementById("sname").value;
        var discount = document.getElementById("sdiscount").value;
        var special = document.getElementById("sspecial").value;
        var phone = document.getElementById("sphone").value;
        var address = document.getElementById("saddress").value;
        var opentime = document.getElementById("sopentime").value;
        var imghead = document.getElementById("upload").value;
        if(name==""||discount==""||special==""||phone==""||opentime==""||address==""||imghead==""){
            alert("内容不能有空的喔，不正规操作！")
        }else{
            alert("新店开张");
            document.getElementById("forma").submit();
        }
    }

    function DisShop(sid,sname,simg,stype,sprice,sspecial,sphone,saddress,sdiscount,sopentime,sstate){
        var id = document.getElementById("sid");
        var name = document.getElementById("shopname");
        var discount = document.getElementById("sdiscount1");
        var img = document.getElementById("fengmian");
        var special = document.getElementById("sspecial1");
        var phone = document.getElementById("sphone1");
        var address = document.getElementById("saddress1");
        var opentime = document.getElementById("sopentime1");
        var imghead = document.getElementById("imghead");
        var state = document.getElementById("xiajia");
        var s = document.getElementById("state");
        s.innerHTML = sstate;
        img.src="${pageContext.request.contextPath}/"+simg;
        imghead.src="${pageContext.request.contextPath}/"+simg;
        name.innerHTML = sname;
        id.innerHTML = sid;
        $("#stype1").find("option").each(function(){
            if($(this).text() == stype)	{
                $(this).attr("selected",true);
            }
        });
        $("#sprice1").find("option").each(function(){
            if($(this).text() == sprice)	{
                $(this).attr("selected",true);
            }
        });
        discount.value = sdiscount;
        special.value = sspecial;
        address.value = saddress;
        phone.value = sphone;
        opentime.value = sopentime;
        if (sstate==0){
            state.innerHTML = "开店";
        }else{
            state.innerHTML = "关店";
        }
    }

    function UpdateShopState(){
        var xiajia = document.getElementById("xiajia");
        var id = document.getElementById("sid").innerHTML;
        var s = document.getElementById("state").innerHTML;
        $.ajax({
                url:"${pageContext.request.contextPath}/shop/updateShopStateById.do",
                async:true,
                type:"POST",
                data: {"id":id,"state":s},
                success:function (data) {
                    if (data==1){
                        if (xiajia.innerHTML=="开店"){
                            xiajia.innerHTML == "关店";
                        }else{
                            xiajia.innerHTML == "开店";
                        }alert("状态修改成功");
                        location.href="${pageContext.request.contextPath}/shop/disShop.do?page=1&shop=";
                    }else {
                        alert("没有权限，未登录")
                    }
                },
                error:function () {
                    alert("保存失败");
                },
                dataType:"text"
            });
    }

    function UpdateShop(){
        var id = document.getElementById("sid").innerHTML;
        var discount = document.getElementById("sdiscount1").value;
        var special = document.getElementById("sspecial1").value;
        var phone = document.getElementById("sphone1").value;
        var address = document.getElementById("saddress1").value;
        var opentime = document.getElementById("sopentime1").value;
        var type = document.getElementById("stype1").value;
        var price = document.getElementById("sprice1").value;
        if (id!=""&&discount!=""&&special!=""&&special!=""&&phone!=""&&address!=""&&opentime!=""){
            $.ajax({
                url:"${pageContext.request.contextPath}/shop/updateShopById.do",
                async:true,
                type:"POST",
                data: {"id":id,"discount":discount,"special":special,"phone":phone,"address":address,"opentime":opentime,"type":type,"price":price},
                success:function (data) {
                    if (data==1){
                        alert("保存成功");
                        location.href="${pageContext.request.contextPath}/shop/disShop.do?page=1&shop=";
                    }else {
                        alert("没有权限，未登录")
                    }
                },
                error:function () {
                    alert("保存失败");
                },
                dataType:"text"
            });
        } else{
            alert("保存内容不能为空");
        }
    }

    function returnHead() {
        var formData = new FormData();
        var file = $('#uploadhead')[0].files[0];
        formData.append("upload",file);
        var head = document.getElementById("imghead");
        var hi = document.getElementById("hi");
        $.ajax({
            url:"${pageContext.request.contextPath}/shop/returnHead.do",
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
        var hi = document.getElementById("hi").innerHTML;
        var id = document.getElementById("sid").innerHTML;
        $.ajax({
            url:"${pageContext.request.contextPath}/shop/updateHead.do",
            async:true,
            type:"POST",
            data: {"id":id,"head":hi,"which":1},
            success:function (data) {
                alert(data);
                location.href="${pageContext.request.contextPath}/shop/disShop.do?page=1&shop=";
            },
            error:function () {
                alert("更新失败");
            },
            dataType:"text"
        });
    }

    function search() {
        var shopId = document.getElementById("shopId").value;
        location.href='${pageContext.request.contextPath}/shop/disShop.do?page=1&shop='+shopId;
    }
</script>
</body>
</html>
