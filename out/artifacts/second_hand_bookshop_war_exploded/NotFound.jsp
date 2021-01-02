<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/5/22
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>未找到指定网页</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    <div class="jumbotron">
        <h1>404！</h1>

        <p style="margin-left: 300px;color: red">不好意思未找到指定页面,3秒后跳转至主页面...</p>
        <br>
        <p><a class="btn btn-primary btn-lg" role="button" href="${pageContext.request.contextPath}/index.action">
            <<< 返回主页</a>
        </p>
    </div>
</div>
</body>
</html>
