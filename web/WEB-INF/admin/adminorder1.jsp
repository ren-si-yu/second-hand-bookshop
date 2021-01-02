<%--
  Created by IntelliJ IDEA.
  User: 76147
  Date: 2019/6/5
  Time: 22:23
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>已发货待收货订单</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="width:1200px;height: 600px;">

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">订单信息查询</a>
        </div>
        <form class="navbar-form navbar-left" role="search" style="margin-left: 500px">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default">搜索</button>
        </form>
    </div>
</nav>

<table class="table table-hover">
    <caption>订单信息</caption>
    <thead>
    <tr>
        <th>产品名称</th>
        <th>付款日期</th>
        <th>卖家</th>
        <th>买家</th>
        <th>订单信息</th>
        <th>状态</th>

    </tr>
    </thead>
    <tbody>
    <s:iterator value="#session.orderList">
        <tr>
            <td>
                <br><br><s:property value="bookName"/>
            </td>
            <td>
                <br><br><s:property value="payDate"/>
            </td>
            <td><br><br><s:property value="sellerEmail"/></td>
            <td><br><br><s:property value="loginEmail"/></td>
            <td><br><br><s:property value="orderNumber"/></td>
            <td><br><br>已付款已发货</td>

        </tr>
    </s:iterator>

    </tbody>
</table>

</body>
</html>
