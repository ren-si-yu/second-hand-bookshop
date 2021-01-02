<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/5/21
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>重置密码</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/Forget1.css">

    <script src="jquery-2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $("[data-toggle='popover']").popover();
        });
    </script>
</head>
<body>
<h1><center>安全中心</center></h1>
<div class="big">

    <div class="big1" style="margin-left: 480px;">
        <a href="Forget1.jsp">
            <div style="float: left">
                <span style="display: block;width: 30px;height: 30px;border-radius:35px;background-color: dodgerblue;margin-left:15px;">&nbsp;&nbsp;1</span>
                <br>
                输入账号
            </div>
        </a>

        <div class="progress-bar" role="progressbar" aria-valuenow="60"
             aria-valuemin="0" aria-valuemax="100" style="width:200px;height:5px;margin-top:40px;border-radius:5px;margin-left: 20px;margin-right: 20px;background-color: dodgerblue;">
            <span class="sr-only">40% 完成</span>

        </div>

        <a href="Forget2.jsp">
            <div style="float: left">
                <span style="display: block;width: 30px;height: 30px;border-radius:35px;background-color: dodgerblue;margin-left:15px;">&nbsp;&nbsp;2</span>
                <br>
                身份验证
            </div>
        </a>
        <div class="progress-bar" role="progressbar" aria-valuenow="60"
             aria-valuemin="0" aria-valuemax="100" style="width:200px;height:5px;margin-top:40px;border-radius:5px;margin-left: 20px;margin-right: 20px;background-color: dodgerblue;">
            <span class="sr-only">40% 完成</span>

        </div>
        <a href="Forget3.jsp">
        <div style="float: left">
            <span style="display: block;width: 30px;height: 30px;border-radius:35px;background-color: dodgerblue;margin-left:15px;">&nbsp;&nbsp;3</span>
            <br>
            设置新密码
        </div>
        </a>
        <div class="progress-bar" role="progressbar" aria-valuenow="60"
             aria-valuemin="0" aria-valuemax="100" style="width:200px;height:5px;margin-top:40px;border-radius:5px;margin-left: 20px;margin-right: 20px;background-color: dodgerblue;">
            <span class="sr-only">40% 完成</span>

        </div>
        <div style="float: left">
            <span style="display: block;width: 30px;height: 30px;border-radius:35px;background-color: dodgerblue;margin-left:15px;">&nbsp;&nbsp;4</span>
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;完成
        </div>


    </div>
</div>



<div class="Register">
    <br><br>

    <h3>恭喜您！密码修改成功，正在跳转登录！</h3>
    <br>
    <form class="form-horizontal" role="form" >




        <br>





        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-8">
                <a class="btn btn-primary btn-lg" role="button" href="Index.jsp">
                    没跳转？点击试试</a>
            </div>
        </div>
    </form>
</div>



</body>
</html>

