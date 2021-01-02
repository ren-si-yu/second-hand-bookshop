<%--
  Created by IntelliJ IDEA.
  User: 76147
  Date: 2019/6/5
  Time: 16:10
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <meta charset="utf-8"/>
    <title>admin</title>
    <link rel="stylesheet" href="css/style.css"/>
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet"
          type="text/css"/>
    <script src="${pageContext.request.contextPath}/jquery-2.1.1/jquery.min.js" type="text/javascript"></script>
    <style>
        #from {
            background-color: #96b97d;
        }

        .mycenter {
            margin-top: 100px;
            margin-left: auto;
            margin-right: auto;
            height: 350px;
            width: 500px;
            padding: 5%;
            padding-left: 5%;
            padding-right: 5%;
        }

        .mycenter mysign {
            width: 440px;
        }

        .mycenter input, checkbox, button {
            margin-top: 2%;
            margin-left: 10%;
            margin-right: 10%;
        }

        .mycheckbox {
            margin-top: 10px;
            margin-left: 40px;
            margin-bottom: 10px;
            height: 10px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $('#btn').click(function (e) {
                window.location.href = "${pageContext.request.contextPath}/admin_login.action";
            });
        });
    </script>
</head>
<body>
<form id="from">
    <div class="mycenter">
        <div class="mysign">
            <div class="col-lg-11 text-center text-info">
                <h2>
                    请登录</h2>
            </div>
            <div class="col-lg-10">
                <input type="text" class="form-control" name="username" placeholder="请输入账户名" required
                       autofocus/>
            </div>
            <div class="col-lg-10">
            </div>
            <div class="col-lg-10">
                <input type="password" class="form-control" name="password" placeholder="请输入密码" required
                       autofocus/>
            </div>
            <div class="col-lg-10">
            </div>
           <%-- <div class="col-lg-10 mycheckbox checkbox">
                <input type="checkbox" class="col-lg-1">记住密码</input>
            </div>--%>
            <div class="col-lg-10">
            </div>
            <div class="col-lg-10">
                <button type="button" id="btn" class="btn btn-success col-lg-12">
                    登录
                </button>
            </div>
        </div>
    </div>
</form>
</body>
</html>