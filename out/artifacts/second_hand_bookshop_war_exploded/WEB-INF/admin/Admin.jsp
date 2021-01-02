<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/6/1
  Time: 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Bootstrap 实例 - 悬停表格</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="width:1200px;height: 600px;">

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">管理员信息查询</a>
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
    <caption>管理员信息</caption>
    <thead>
    <tr>
        <th>邮箱</th>
        <th>权限</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>64654@qq.com</td>
        <td>用户管理</td>
        <td><button type="button" class="btn btn-default">修改权限</button></td>
    </tr>
    <tr>
        <td>64654@qq.com</td>
        <td>图书管理</td>
        <td><button type="button" class="btn btn-default">修改权限</button></td>
    </tr>
    <tr>
        <td>64654@qq.com</td>
        <td>目录管理</td>
        <td><button type="button" class="btn btn-default">修改权限</button></td>
    </tr>
    <tr>
        <td>64654@qq.com</td>
        <td>提现确认</td>
        <td><button type="button" class="btn btn-default">修改权限</button></td>
    </tr>
    </tbody>
</table>

</body>
</html>
