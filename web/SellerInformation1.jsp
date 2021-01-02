<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/5/31
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/Index.css">
    <script src="jquery-2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>


    <title>卖家信息完善</title>
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
                        <li class="divider"></li>
                        <li><a href="PersonCenter.jsp">个人中心</a></li>
                        <li class="divider"></li>
                        <li><a href="Address.jsp">收货地址</a></li>

                    </ul>
                </li>
                <li><a href="BuyCar.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;购物车</a></li>
                <li><a href="Order.jsp">我的订单</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="I1">
    <img src="../img/Logo.png">
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


<div class="panel panel-primary" style="width: 30%;margin-left: 35%">
    <div class="panel-heading">
        <h3 class="panel-title">卖家信息完善</h3>
    </div>
    <div class="panel-body" style="padding-left: 20%">
        <form method="post" action="seller_addSeller.action"
              class="form-horizontal" role="form">
            <div class="form-group">
                <label class="col-sm-2 control-label">
                    邮箱
                </label>
                <div class="col-sm-6">
                    <input name="loginEmail" class="form-control" id="disabledInput" type="email"
                           value="<s:property value="#session.user"/>" >
                </div>
            </div>
            <div class="form-group">
                <label for="username" class="col-sm-2 control-label">书架名</label>
                <div class="col-sm-6">
                    <input name="bookshelfName"
                           type="text" class="form-control" id="username"
                           placeholder="请输入书架名">
                </div>
            </div>

            <div class="form-group">
                <label for="tel" class="col-sm-2 control-label">书架地址</label>
                <div class="col-sm-6">
                    <input name="bookshelfAddress"
                           type="tel" class="form-control" id="tel"
                           placeholder="请输入书架地址">
                </div>
            </div>
            <div class="form-group">
                <label for="tel" class="col-sm-2 control-label">手机号</label>
                <div class="col-sm-6">
                    <input name="sellerIdPhone"
                           type="tel" class="form-control" id="tel"
                           placeholder="请输入手机号">
                </div>
            </div>

            <div class="form-group">
                <label for="tel" class="col-sm-2 control-label">收款号</label>
                <div class="col-sm-6">
                    <input name="alipayNum"
                           type="tel" class="form-control" id="tel"
                           placeholder="请输入支付宝收款手机号">
                </div>
            </div>

            <input class="btn btn-warning" style="margin-left: 25%;width: 20%" type="submit" value="提交">

        </form>


    </div>

</div>


<div class="jumbotron text-center" style="margin-bottom:0;clear: left;">
    <p>关于我们 | 用户反馈 | 版权所有</p>
    <p>地址：中国河南省郑州市金水区文化路97号</p>
</div>


</body>

</html>
