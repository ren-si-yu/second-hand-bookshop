<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/6/2
  Time: 19:00
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Index.css">
    <script src="${pageContext.request.contextPath}/jquery-2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=0A3nGCsiIhXITpRXALmuj5XpAsc4XPeM"></script>

    <style type="text/css">
        body, html {
            width: 100%;
            height: 100%;
            margin: 0;
            font-family: "微软雅黑";
            font-size: 14px;
        }

        #r-result {
            width: 100%;
        }
    </style>
    <title>添加收货地址</title>

</head>

<body>


<nav class="navbar navbar-default" role="navigation" style="margin-bottom:10px;margin-top: 0px;">
    <div class="container-fluid">

        <div style="float: right">

            <ul class="nav navbar-nav">

                <li data-toggle="modal" data-target="#myModal" style=" border: 0; ">
                    <a href="#"><span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;登录</a></li>


                <li><a href="Register.jsp">注册</a></li>
                <li><a href="SellBook.jsp">我要出书</a></li>
                <li>
                    <a href="kuaidi.jsp">
                        物流查询
                    </a>

                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        我的服务
                        <b class="caret"></b>
                    </a>

                    <ul class="dropdown-menu">
                        <li><a href="Forget1.jsp">修改密码</a></li>
                        <li><a href="#">EJB</a></li>
                        <li><a href="#">Jasper Report</a></li>
                        <li class="divider"></li>
                        <li><a href="#">收货地址</a></li>
                        <li class="divider"></li>
                        <li><a href="#">另一个分离的链接</a></li>
                    </ul>
                </li>
                <li><a href="BuyCar.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;购物车</a></li>
                <li><a href="Order.jsp">我的订单</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="I1">
    <img src="${pageContext.request.contextPath}/img/Logo.png">
    <h1>Second-hand BookShop</h1>

</div>

<nav>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <nav class="navbar navbar-default" role="navigation" style="padding: 0 9%">
                <div class="navbar-header">
                    <a class="navbar-brand" href="Index.jsp">首页</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">

                        <li>
                            <a href="Index.jsp">买书</a>
                        </li>
                        <li>
                            <a href="SellBook.jsp">卖书</a>
                        </li>

                        <li>
                            <pre style="border: 0">                                                        </pre>
                        </li>

                        <li>
                            <form class="bar6">
                                <input type="text" placeholder="请输入您要搜索的内容...">
                                <button type="submit"></button>
                            </form>
                        </li>
                    </ul>


                </div>

            </nav>
        </div>
    </div>
</nav>


<div>


    <div id="l-map"></div>
    <h2>
        <center>添加新的收货地址</center>
    </h2>
    <s:debug/>
    <form action="address_addAddress.action" method="post" style="width:20%;margin-left: 40%;margin-top:3%">
        <input name="address.userName" required="required" type="text" class="form-control" id="name"
               placeholder="请输入收货人姓名">
        <br>
        <div id="r-result"><input name="address.userAddress" required="required" type="text" class="form-control" id="suggestId"
                                  size="20" value="百度"
                                  placeholder="请输入收货地址"/></div>

        <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>

        <br>
        <input name="address.zipCode" required="required" type="text" class="form-control" id="name"
               placeholder="请输入邮政编码">
        <br>
        <input name="address.userPhone" required="required" type="text" class="form-control" id="name"
               placeholder="请输入联系电话">

        <button type="submit" class="btn btn-success " style="margin-left:32%;margin-top: 8%;width:40%">提交</button>
    </form>


</div>
</body>
</html>
<script type="text/javascript">
    // 百度地图API功能
    function G(id) {
        return document.getElementById(id);
    }

    var map = new BMap.Map("l-map");
    map.centerAndZoom("北京", 12);                   // 初始化地图,设置城市和地图级别。

    var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
        {
            "input": "suggestId"
            , "location": map
        });

    ac.addEventListener("onhighlight", function (e) {  //鼠标放在下拉列表上的事件
        var str = "";
        var _value = e.fromitem.value;
        var value = "";
        if (e.fromitem.index > -1) {
            value = _value.province + _value.city + _value.district + _value.street + _value.business;
        }
        str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

        value = "";
        if (e.toitem.index > -1) {
            _value = e.toitem.value;
            value = _value.province + _value.city + _value.district + _value.street + _value.business;
        }
        str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
        G("searchResultPanel").innerHTML = str;
    });

    var myValue;
    ac.addEventListener("onconfirm", function (e) {    //鼠标点击下拉列表后的事件
        var _value = e.item.value;
        myValue = _value.province + _value.city + _value.district + _value.street + _value.business;
        G("searchResultPanel").innerHTML = "onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

        setPlace();
    });

    function setPlace() {
        map.clearOverlays();    //清除地图上所有覆盖物
        function myFun() {
            var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
            map.centerAndZoom(pp, 18);
            map.addOverlay(new BMap.Marker(pp));    //添加标注
        }

        var local = new BMap.LocalSearch(map, { //智能搜索
            onSearchComplete: myFun
        });
        local.search(myValue);
    }
</script>