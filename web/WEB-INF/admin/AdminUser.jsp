<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/6/1
  Time: 12:08
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
            <a class="navbar-brand" href="#">买家信息查询</a>
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
        <th>昵称</th>
        <th>手机号</th>
        <th>余额</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <s:iterator value="#session.usersList">
        <tr>
            <td><s:property value="loginEmail"></s:property></td>
            <td><s:property value="userName" default="-~-"/></td>
            <td><s:property value="userPhone" default="-~-"/></td>
            <td><s:property value="money" default="0.00"/></td>

            <td>
                <button type="button" class="btn btn-default">
                    <s:if test="status==-1">
                        <a href="admin_freeze.action?status=1&userId=<s:property value="userId"/>">解冻账号</a>
                    </s:if>
                    <s:elseif test="status==1">
                        <a href="admin_freeze.action?status=-1&userId=<s:property value="userId"/>">冻结账号</a>
                    </s:elseif>
                </button>
            </td>
        </tr>
    </s:iterator>

    </tbody>
</table>

</body>
</html>
