<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/6/1
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>卖家提现查询</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="width:1200px;height: 600px;">

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">卖家提现信息查询</a>
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
    <caption>买家信息</caption>
    <thead>
    <tr>
        <th>邮箱</th>
        <th>昵称</th>
        <th>书架名称</th>
        <th>提现时间</th>
        <th>提现金额</th>
        <th>提现支付宝账号</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>64654@qq.com</td>
        <td>小白</td>
        <td>小白的书架</td>
        <td>2019/4/5</td>

        <td>¥200</td>
        <td>6425242</td>
        <td><button type="button" class="btn btn-default">确认提现</button></td>
    </tr>
    <tr>
        <td>64654@qq.com</td>
        <td>小白</td>
        <td>小白的书架</td>
        <td>2019/4/5</td>

        <td>¥200</td>
        <td>6425242</td>
        <td><button type="button" class="btn btn-default">确认提现</button></td>
    </tr>
    <tr>
        <td>64654@qq.com</td>
        <td>小白</td>
        <td>小白的书架</td>
        <td>2019/4/5</td>

        <td>¥200</td>
        <td>6425242</td>
        <td><button type="button" class="btn btn-default">确认提现</button></td>
    </tr>
    </tbody>
</table>

</body>
</html>
