<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/5/21
  Time: 17:38
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
<h1>
    <center>安全中心</center>
</h1>
<div class="big">

    <div class="big1" style="margin-left: 480px;">

        <div style="float: left">
            <span style="display: block;width: 30px;height: 30px;border-radius:35px;background-color: dodgerblue;margin-left:15px;">&nbsp;&nbsp;1</span>
            <br>
            输入账号
        </div>

        <div class="progress-bar" role="progressbar" aria-valuenow="60"
             aria-valuemin="0" aria-valuemax="100"
             style="width:200px;height:5px;margin-top:40px;border-radius:5px;margin-left: 20px;margin-right: 20px;background: linear-gradient(90deg,dodgerblue,darkgray);">
            <span class="sr-only">40% 完成</span>

        </div>


        <div style="float: left">
            <span style="display: block;width: 30px;height: 30px;border-radius:35px;background-color: #aaaaaa;margin-left:15px;">&nbsp;&nbsp;2</span>
            <br>
            身份验证
        </div>

        <div class="progress-bar" role="progressbar" aria-valuenow="60"
             aria-valuemin="0" aria-valuemax="100"
             style="width:200px;height:5px;margin-top:40px;border-radius:5px;margin-left: 20px;margin-right: 20px;background: linear-gradient(90deg,darkgray,darkgray);">
            <span class="sr-only">40% 完成</span>

        </div>

        <div style="float: left">
            <span style="display: block;width: 30px;height: 30px;border-radius:35px;background-color: #aaaaaa;margin-left:15px;">&nbsp;&nbsp;3</span>
            <br>
            设置新密码
        </div>

        <div class="progress-bar" role="progressbar" aria-valuenow="60"
             aria-valuemin="0" aria-valuemax="100"
             style="width:200px;height:5px;margin-top:40px;border-radius:5px;margin-left: 20px;margin-right: 20px;background: linear-gradient(90deg,darkgray,darkgray);">
            <span class="sr-only">40% 完成</span>

        </div>
        <div style="float: left">
            <span style="display: block;width: 30px;height: 30px;border-radius:35px;background-color:#aaaaaa;margin-left:15px;">&nbsp;&nbsp;4</span>
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;完成
        </div>


    </div>
</div>

<s:debug></s:debug>
<div class="Register">
    <h3>修改密码</h3>
    <br>
    <form action="sendEmailFindPwd.action" method="post"
          class="form-horizontal" role="form">
        <div class="form-group" style="margin-left: 260px">

            <div class="col-sm-6">
                <input name="email"
                       type="text" class="form-control" id="usename" title="注意"
                       data-container="body" data-toggle="popover" data-placement="right"
                       data-content="输入注册账号时所使用的邮箱"
                       placeholder="请输入邮箱">
                <s:property value="#session.emailExistError"></s:property>
            </div>
        </div>


        <br> <br>


        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-8">
                <a class="btn btn-primary btn-lg" role="button" href="Index.jsp">
                    回到首页登录</a>
                <input type="submit" value="下一步"/>
            </div>
        </div>
    </form>
</div>


</body>
</html>
