<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/6/1
  Time: 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>查询图书</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="width:1200px;height: 600px;">

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">书籍信息查询</a>
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
    <caption>书籍信息</caption>
    <thead>
    <tr>
        <th>书籍详情</th>
        <th>书籍名称</th>
        <th>分类</th>
        <th>单价</th>
        <th>库存</th>
        <th>状态

        </th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <s:iterator value="#session.booksList">
        <tr>
            <td><img src="<s:property value="bookImg"/>"
                     alt="通用的占位符缩略图" style="height: 150px;width: 100px">
            </td>
            <td><p style="width: 100px;font-size: 10px"><br><br><br><s:property value="bookName"/>

            </td>
            <td><br><br><s:property value="typeNo1"/></td>
            <td><br><br><s:property value="currentPrice"/></td>
            <td><br><br><s:property value="bookStock"/></td>
            <td><br><br><s:property value="status"/></td>

            <td>
                <button type="button" class="btn btn-default">

                    <s:if test="status==0">
                    <a href="admin_downBook.action?bookId=<s:property value="bookId"/>">下架商品</a></button>
                </s:if>
                <s:else>-~-</s:else>

            </td>
        </tr>
    </s:iterator>

    </tbody>
</table>

</body>
</html>