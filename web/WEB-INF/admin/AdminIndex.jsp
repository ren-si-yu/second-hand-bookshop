<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/5/31
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Index.css">
    <script src="${pageContext.request.contextPath}/jquery-2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>


    <title>BookShop后台管理</title>

</head>

<body>


<nav class="navbar navbar-default" role="navigation" style="margin-bottom:10px;margin-top: 0px;">
    <div class="container-fluid">

        <div style="float: right">

            <ul class="nav navbar-nav">

                <li data-toggle="modal" data-target="#myModal" style=" border: 0; ">
                    <a href="#"><span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;<s:property
                            value="#session.admin.adminName"/></a></li>

                <li><a href="admin_loginOut.action">退出</a></li>

            </ul>
        </div>
    </div>
</nav>
<s:debug/>
<div class="I1">
    <img src="${pageContext.request.contextPath}/img/Logo.png">
    <h1>BookShop 后台管理系统</h1>

</div>

<nav>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <nav class="navbar navbar-default" role="navigation" style="padding: 0 9%">
                <div class="navbar-header">
                    <a class="navbar-brand" href="AdminIndex.jsp">后台管理</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">


                    </ul>


                </div>

            </nav>
        </div>
    </div>
</nav>

<div class="I2" style="border: #0f0f0f">
    <div class="panel-group" id="accordion" style="text-align: center;width:15%;margin-left: 200px;float:left">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseTwo" style="text-decoration: none;">
                        用户管理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
                            class="glyphicon glyphicon-chevron-down"></span>
                    </a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse">
                <a href="${pageContext.request.contextPath}/admin_searchUser.action" target="iframe_a"
                   class="list-group-item ">买家</a>
                <a href="${pageContext.request.contextPath}/admin_searchSeller.action" target="iframe_a"
                   class="list-group-item ">卖家</a>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseThree" style="text-decoration: none;">
                        图书管理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
                            class="glyphicon glyphicon-chevron-down"></span>
                    </a>
                </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse">
                <a href="${pageContext.request.contextPath}/admin_selectBook.action?good=0" target="iframe_a"
                   class="list-group-item ">查询商品</a>
                <%-- <a href="${pageContext.request.contextPath}/admin_addBook.action" target="iframe_a"
                    class="list-group-item ">增加商品</a>--%>
                <a href="${pageContext.request.contextPath}/admin_selectBook.action?good=1" target="iframe_a"
                   class="list-group-item ">下架商品</a>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseFour" style="text-decoration: none;">
                        订单查询&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
                            class="glyphicon glyphicon-chevron-down"></span>
                    </a>
                </h4>
            </div>
            <div id="collapseFour" class="panel-collapse collapse">

                <a href="${pageContext.request.contextPath}/admin_order.action?status=0" target="iframe_a"
                   class="list-group-item ">已付款</a>
                <a href="${pageContext.request.contextPath}/admin_order.action?status=1" target="iframe_a"
                   class="list-group-item ">已发货</a>
                <a href="${pageContext.request.contextPath}/admin_order.action?status=2" target="iframe_a"
                   class="list-group-item ">已成交</a>

            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseFive" style="text-decoration: none;">
                        提现确认&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
                            class="glyphicon glyphicon-chevron-down"></span>
                    </a>
                </h4>
            </div>
            <div id="collapseFive" class="panel-collapse collapse">

                <a href="${pageContext.request.contextPath}/admin_userCashOut.action" target="iframe_a"
                   class="list-group-item ">提现记录</a>

            </div>
        </div>

    </div>


    <div class="row">


        <iframe name="iframe_a" style="width:1200px;height: 600px;margin-left: 3%;border: 0px"></iframe>


    </div>


</div>


</div>


<div class="jumbotron text-center" style="margin-bottom:0;margin-top: 10%">
    <p>关于我们 | 用户反馈 | 版权所有</p>
    <p>地址：中国河南省郑州市金水区文化路97号</p>
</div>


</body>

</html>

