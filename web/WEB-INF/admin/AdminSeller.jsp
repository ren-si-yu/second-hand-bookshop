<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/6/1
  Time: 12:29
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
            <a class="navbar-brand" href="#">卖家信息查询</a>
        </div>
        <form class="navbar-form navbar-left" role="search" style="margin-left: 500px">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default">搜索</button>
        </form>
    </div>
</nav>
<s:debug/>
<table class="table table-hover">
    <caption>买家信息</caption>
    <thead>
    <tr>
        <th>邮箱</th>
        <th>书架名称</th>
        <th>已售图书</th>
        <th>在售图书</th>
      <%--  <th>当月销量</th>
        <th>操作</th>--%>
    </tr>
    </thead>
    <tbody>
    <s:iterator value="#session.sellersList">
        <tr>
            <td><s:property value="seller.loginEmail"/></td>
            <td><s:property value="seller.bookshelfName"></s:property></td>
            <td><s:property value="sold"></s:property></td>
            <td><s:property value="onSale"></s:property></td>
           <%-- <td>¥200</td>
            <td>
                <button type="button" class="btn btn-default">冻结账号</button>
            </td>--%>
        </tr>
    </s:iterator>

    </tbody>
</table>

</body>
</html>
