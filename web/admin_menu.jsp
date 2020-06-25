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
    <div style="font-weight: bold;font-size: 22px;margin: 10px;">菜谱管理</div>
    <form action="${pageContext.request.contextPath}/shop/AddMenu.do" method="post" id="forma" enctype="multipart/form-data">
        <div style="margin: 10px;">
            菜谱名称：<input type="text" name="mname" id="mname" style="height: 30px;margin-right: 10px"/>
            上传图片：<input type="file" name="upload" id="upload" style="height: 30px;"/>
        </div>
        <div style="margin:10px;">
            菜谱价格：<input type="number" min="0" name="mprice" id="mprice" style="height: 30px;margin-right: 10px"/>
            菜谱库存：<input type="number" min="1" name="mcount" id="mcount" style="height: 30px;margin-right: 20px"/>
            <input type="button" value="添加" id="shang" onclick="addMenu()" style="height: 30px;width:50px;margin-left: 50px;background-color: white;color: black;cursor: pointer;font-weight: bold;"/>

        </div>
        <input type="text" id="shop_id" name="shop_id" style="display: none;" value="${shop_id}" />
        <span type="text" id="menu_id" name="menu_id" style="display: none;" ></span>
    </form><br>
<div style="margin:10px;">
        <table style=" text-align: center" >
            <tr>
                <th style="width: 50px;">序号</th>
                <th style="width: 120px;">菜谱名称</th>
                <th style="width: 80px;">菜谱图片</th>
                <th style="width: 120px;">菜谱价格（元）</th>
                <th style="width: 100px;">菜谱销量</th>
                <th style="width: 100px;">菜谱库存</th>
                <th style="width: 100px;">操作</th>
            </tr>
            <c:forEach items="${all.list}" var="menu" varStatus="m">
            <tr>
                <td style="height: 80px;border: 1px dashed;">${m.count}</td>
                <td style="height: 80px;border: 1px dashed;"><a href="#headmodal" class="modaltrigger" onclick="DisMenu(${menu.menu_id},'${menu.menu_name}','${menu.menu_img}',${menu.menu_price},${menu.menu_count})">${menu.menu_name}</a></td>
                <td style="height: 80px;border: 1px dashed;"><img src="${pageContext.request.contextPath}/${menu.menu_img}" style="width: 70px;height: 70px;" class="himg"></td>
                <td style="height: 80px;border: 1px dashed;" class="st">${menu.menu_price}</td>
                <td style="height: 80px;border: 1px dashed;" class="spr">${menu.menu_sell}</td>
                <td style="height: 80px;border: 1px dashed;" class="ss">${menu.menu_count}</td>
                <td style="height: 50px;border: 1px dashed;"><a href="#tishimodal1" class="modaltrigger" onclick="dism(${menu.menu_id})">删除</a></td>
            </tr>
            </c:forEach>
            <tr>
                <td style="height: 30px;">
                    <c:if test="${all.currentPage > 1}">
                        <a href="${pageContext.request.contextPath}/shop/disMenuByShop.do?page=${all.currentPage-1}&id=${shop_id}">上一页</a>
                    </c:if>
                </td>
                当前第${all.currentPage}页/总${all.totalPage}页
                <td style="height: 30px;">
                    <c:if test="${all.currentPage < all.totalPage}">
                        <a href="${pageContext.request.contextPath}/shop/disMenuByShop.do?page=${all.currentPage+1}&id=${shop_id}">下一页</a>
                    </c:if>
                </td>
            </tr>
        </table>
    </div>
</div><span id="sid" style="display: none;"></span><span id="state" style="display: none;"></span>
</div><span id="which" style="display: none;"></span><span id="ia" style="display: none;"></span>
<div id="headmodal" style="display:none;">
    <h3>信息：<span id="mname1" style="font-weight: bold;font-size: 18px;"></span></h3>
    商品封面：<img src="" id="fengmian" style="width: 80px;height: 80px;">&nbsp;<a href="#headmodal2" class="modaltrigger" id="genggai">更改</a><br>
    菜谱价格：<input type="number" min="0" name="mprice1" id="mprice1" style="height: 30px;"/><br>
    菜谱库存：<input type="number" min="1" name="mcount1" id="mcount1" style="height: 30px;"/>
    <a href="#" id="baocun" onclick="UpdateMenu()">保存</a>&nbsp;&nbsp;
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
<div id="tishimodal1" style="display:none;">
    <p style="font-size: 16px;font-weight: bold;">是否要删除该菜单？请三思呀</p><div style="display: none"><span id="m_id"></span></div>
    <input type="button" name="btn1" id="btn3" class="flatbtn-blu" value="确定" tabindex="1" onclick="deleteMenu()">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" name="btn1" id="btn4" class="flatbtn-blu" value="取消" tabindex="2" >
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

    function addMenu(){
        var mname = document.getElementById("mname").value;
        var mimg = document.getElementById("upload").value;
        var mprice = document.getElementById("mprice").value;
        var mcount = document.getElementById("mcount").value;
        if (mname!=""&&mimg!=""&&mprice!=""&&mcount!="") {
            alert("添加成功！");
            document.getElementById("forma").submit();
        }else{
            alert("内容不能留空喔！")
        }
    }

    function dism(id) {
        var m_id = document.getElementById("m_id");
        m_id.innerHTML = id;
    }

    function deleteMenu() {
        var m_id = document.getElementById("m_id").innerHTML;
        location.href="${pageContext.request.contextPath}/shop/deleteMenuById.do?menu_id="+m_id+"&shop_id=${shop_id}";
    }

    function DisMenu(id,mn,mi,mp,mc) {
        var mname = document.getElementById("mname1");
        var mimg = document.getElementById("fengmian");
        var mprice = document.getElementById("mprice1");
        var mcount = document.getElementById("mcount1");
        var imghead = document.getElementById("imghead");
        var menuId = document.getElementById("menu_id");
        mname.innerHTML = mn;
        mimg.src="${pageContext.request.contextPath}/"+mi;
        imghead.src="${pageContext.request.contextPath}/"+mi;
        mprice.value = mp;
        mcount.value = mc;
        menuId.innerHTML = id;
    }

    function UpdateMenu() {
        var mprice = document.getElementById("mprice1").value;
        var mcount = document.getElementById("mcount1").value;
        var menuId = document.getElementById("menu_id").innerHTML;
        if (mprice!=""&&mcount!="") {
            $.ajax({
                url:"${pageContext.request.contextPath}/shop/updateMenuById.do",
                async:true,
                type:"POST",
                data: {"id":menuId,"price":mprice,"count":mcount},
                success:function (data) {
                    if (data==1){
                        alert("保存成功");
                        location.href="${pageContext.request.contextPath}/shop/disMenuByShop.do?page=1&id=${shop_id}";
                    }else {
                        alert("没有权限，未登录")
                    }
                },
                error:function () {
                    alert("保存失败");
                },
                dataType:"text"
            });
        }else{
            alert("不能空内容");
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
        var menuId = document.getElementById("menu_id").innerHTML;
        $.ajax({
            url:"${pageContext.request.contextPath}/shop/updateHead.do",
            async:true,
            type:"POST",
            data: {"id":menuId,"head":hi,"which":2},
            success:function (data) {
                alert(data);
                location.href="${pageContext.request.contextPath}/shop/disMenuByShop.do?page=1&id=${shop_id}";
            },
            error:function () {
                alert("更新失败");
            },
            dataType:"text"
        });
    }
</script>
</body>
</html>
