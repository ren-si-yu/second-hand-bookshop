<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/5/31
  Time: 16:33
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


    <title>个人中心</title>
    <style>
        .fakeimg {
            height: 200px;
            background: #aaa;
        }
    </style>

</head>

<body>


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
                                <input type="text" placeholder="请输入您要搜索的内容.">
                                <button type="submit"></button>
                            </form>
                        </li>
                    </ul>


                </div>

            </nav>
        </div>
    </div>
</nav>


<div class="jumbotron" style="width: 30%;margin-left: 8%;float: left">
    <div class="container">
        <h3>
            <center>公告</center>
        </h3>
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <p>
                        <em>HelloBook</em> 是一个测试系统，由 <strong>任思雨和慕玉红</strong>
                        编写，用作大作业。
                        <small></small>

                    </p>
                    <ol>
                        <li>
                            切勿泄露密码。
                        </li>
                        <li>
                            切勿私下交易，否则后果自负。
                        </li>

                    </ol>
                </div>
            </div>
        </div>

    </div>
</div>


<div class="panel panel-info" style="width: 25%;float: left;margin-left: 3%">
    <div class="panel-heading">
        <h3 class="panel-title">我的信息</h3>
    </div>
    <s:debug/>
    <div class="panel-body">
        <ul class="nav nav-pills">
            <li class="active"><a href="#"><span class="glyphicon glyphicon-credit-card"></span>账户余额<span class="badge"><s:property
                    value="user.money"/></span></a>
            </li>

            <li style="margin-left: 35%">
                <form action="user_withdraw.action" method="post">
                    <input name="withdrawMoney" type="number" style="width: 100px;"
                           oninput="if(value><s:property
                                   value="user.money"/>)value=<s:property
                                   value="user.money"/>;if(value<0)value=0"/>
                    <%--<a href="${pageContext.request.contextPath}/"
                       class="btn btn-success btn-lg">提现</a>--%>
                    <input type="submit" value="提现" >
                </form>
            </li>
            </form>
            <li class="active">
                <small>支付宝提现以及转账到卡，基础免费额度为2万元，超过基础免费额度，按照每笔0.1%的比例收取提现费用，10000元提现需要的费用为10元</small>
            </li>


            <li class="active"><a href="SellBook.jsp"><span class="glyphicon glyphicon-book"></span>在售图书<span
                    class="badge"><s:property value="onSale"/></span></a></li>
            <li style="margin-left: 45%"><a href="${pageContext.request.contextPath}/buy_showCarts.action"
                                            class="btn btn-success btn-lg">查看</a></li>
            <br><br><br><br>
            <br><br><br><br>
            <li class="active"><a href="SellBook.jsp"><span class="glyphicon glyphicon-book"></span>已售图书<span
                    class="badge"><s:property value="sold"/></span></a></li>
            <li style="margin-left: 45%"><a href="#" class="btn btn-success btn-lg">查看</a></li>


        </ul>
        <br><br>


    </div>

</div>


<div style="margin-left:5%;float: left">
    <form class="form-horizontal" role="form" action="user_altPersonCenter.action">
        <div class="form-group">
            <label for="inputPassword" class="col-sm-3 control-label">
                邮箱
            </label>
            <div class="col-sm-12">
                <input class="form-control" id="disabledInput" type="email"
                       placeholder="<s:property value="user.loginEmail"/>" disabled="disabled">
                <input name="loginEmail" value="<s:property value="#session.user"/>" hidden="hidden"/>

            </div>
        </div>
        <div class="form-group">
            <label for="username" class="col-sm-3 control-label">昵称</label>
            <div class="col-sm-12">
                <input name="userName" type="text" class="form-control" id="username"
                       placeholder="请输入昵称" value="<s:property value="user.userName"/>">
            </div>
        </div>
        <div class="form-group">
            <label for="tel" class="col-sm-3 control-label">手机号</label>
            <div class="col-sm-12">
                <input name="userPhone" type="tel" class="form-control" id="tel"
                       placeholder="请输入手机号" value="<s:property value="user.userPhone"/>">
            </div>
        </div>
        <div class="form-group">
            <label for="tel" class="col-sm-3 control-label">我的小书店</label>
            <div class="col-sm-12">
                <input name="bookshelfName" type="tel" class="form-control" id="tel"
                       placeholder="我的小书店" value="<s:property value="seller.bookshelfName"/>">
            </div>
        </div>

        <input class="btn btn-warning" style="margin-left: 22%;width: 30%" type="submit" value="提交">

    </form>

</div>


<div class="jumbotron text-center" style="margin-bottom:0;clear: left;">
    <p>关于我们 | 用户反馈 | 版权所有</p>
    <p>地址：中国河南省郑州市金水区文化路97号</p>
</div>


</body>

</html>