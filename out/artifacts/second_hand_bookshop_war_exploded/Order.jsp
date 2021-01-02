<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/5/24
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的订单</title>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/Index.css">
    <link rel="stylesheet" href="css/BuyCar.css">
    <script src="jquery-2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>
<s:debug/>
<nav class="navbar navbar-default" role="navigation" style="margin-bottom:10px;margin-top: 0px;">
    <div class="container-fluid">

        <div style="float: right">


            <ul class="nav navbar-nav">
                <li>

                    访问数：<s:property
                        value="#application.uv"></s:property>(<%=application.getAttribute("uv") == null ? 0 : application.getAttribute("uv")%>
                    )

                </li>

                <li>
                    当前在线人数：<s:property
                        value="#application.userCount"></s:property>(<%=application.getAttribute("userCount") == null ? 0 : application.getAttribute("userCount")%>
                    )

                </li>

                <li data-toggle="modal" data-target="#myModal" style=" border: 0; ">

                    <%if (session.getAttribute("user") == null) {%>
                    <a href="Login.jsp"><span
                            class="glyphicon glyphicon-log-in"></span>登录
                    </a>
                    <%
                    } else {%>
                    <a href="#"><span
                            class="glyphicon glyphicon-log-in"></span><%= "欢迎" + session.getAttribute("user")%>
                    </a>
                    <%}%>
                </li>

                <li><%if (session.getAttribute("user") == null) {%>
                    <a href="Register.jsp">注册</a>
                    <%
                    } else if (session.getAttribute("user") != null) {

                    %>
                    <a href="user_loginOut.action">退出</a>
                    <% }%></li>
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
                        <li class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/user_personCenter.action">个人中心</a></li>
                        <li class="divider"></li>
                        <li><a href="address_searchAddress.action">收货地址</a></li>

                    </ul>
                </li>
                <li><a href="${pageContext.request.contextPath}/buy_showCarts.action"><span
                        class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;购物车</a>
                </li>
                <li><a href="buy_searchOrder.action">我的订单</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="I1">
    <a href="Index.jsp"><img src="img/Logo.png"></a>
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

<div style="width: 1500px;margin: 10px auto">

    <ul id="myTab" class="nav nav-tabs">

        <li class="active"><a href="#2" data-toggle="tab">+_+</a></li>
        <%--<li><a href="#3" data-toggle="tab">待收货</a></li>--%>

    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade in active" id="1">
            <table class="table">
                <caption>我的订单</caption>
                <thead>
                <tr>
                    <th>产品</th>
                    <th>付款日期</th>
                    <th>状态</th>
                    <th>订单信息</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <s:iterator value="#session.orderList">
                    <tr>
                        <td><s:property value="bookName"/></td>
                        <td><s:property value="payDate"/></td>
                            <%--0已支付未发货
                                1已支付已发货
                                2已支付成交--%>
                        <td><s:if test="orderStatus==0">已支付未发货 </s:if><s:elseif test="orderStatus==1">已支付已发货</s:elseif>
                            <s:elseif test="orderStatus==2">已支付已成交</s:elseif></td>
                        <td><s:property value="orderNumber"/></td>
                        <td><s:if test="orderStatus==1"><a
                                href="buy_success.action?id=<s:property value="id"/>">确认收货</a></s:if>
                            <s:elseif test="orderStatus==0"><a>等待卖家发货</a></s:elseif>
                            <s:elseif test="orderStatus==2"><a>已成交</a></s:elseif>
                        </td>
                    </tr>

                </s:iterator>
                </tbody>
            </table>
        </div>

    </div>
</div>
</body>
</html>
