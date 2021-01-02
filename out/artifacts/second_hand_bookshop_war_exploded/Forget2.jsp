<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/5/21
  Time: 20:54
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
<s:debug></s:debug>
<div class="big">

    <div class="big1" style="margin-left: 480px;">

        <a href="Forget1.jsp">
        <div style="float: left;">
            <span style="display: block;width: 30px;height: 30px;border-radius:35px;background-color: dodgerblue;margin-left:15px;">&nbsp;&nbsp;1</span>
            <br>
            输入账号
        </div>
        </a>
        <div class="progress-bar" role="progressbar" aria-valuenow="60"
             aria-valuemin="0" aria-valuemax="100" style="width:200px;height:5px;margin-top:40px;border-radius:5px;margin-left: 20px;margin-right: 20px;background-color: dodgerblue">
            <span class="sr-only">40% 完成</span>

        </div>


        <div style="float: left">
            <span style="display: block;width: 30px;height: 30px;border-radius:35px;background-color: dodgerblue;margin-left:15px;">&nbsp;&nbsp;2</span>
            <br>
            身份验证
        </div>

        <div class="progress-bar" role="progressbar" aria-valuenow="60"
             aria-valuemin="0" aria-valuemax="100" style="width:200px;height:5px;margin-top:40px;border-radius:5px;margin-left: 20px;margin-right: 20px;background: linear-gradient(90deg,dodgerblue,darkgray);">
            <span class="sr-only">40% 完成</span>

        </div>

        <div style="float: left">
            <span style="display: block;width: 30px;height: 30px;border-radius:35px;background-color:#aaaaaa;margin-left:15px;">&nbsp;&nbsp;3</span>
            <br>
            设置新密码
        </div>

        <div class="progress-bar" role="progressbar" aria-valuenow="60"
             aria-valuemin="0" aria-valuemax="100" style="width:200px;height:5px;margin-top:40px;border-radius:5px;margin-left: 20px;margin-right: 20px;background: linear-gradient(90deg,darkgray,darkgray);">
            <span class="sr-only">40% 完成</span>

        </div>
        <div style="float: left">
            <span style="display: block;width: 30px;height: 30px;border-radius:35px;background-color:#aaaaaa;margin-left:15px;">&nbsp;&nbsp;4</span>
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;完成
        </div>


    </div>
</div>



<div class="Register">
    <h3>修改密码</h3>
    <br>
    <form action="alterPwd_checkout.action"
            class="form-horizontal" role="form" >

我们已向您的邮箱发送验证码，请输入验证码！
        <br>
        <br>
        <div class="input-group" style="margin-left: 273px;width: 260px">

            <input name="checkNumber"
                    type="text" class="form-control" id="yanzhengma"
                   placeholder="请输入验证码">

            <s:property value="#session.checkFailure"></s:property>


        </div>

        <br>





        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-8">
                <a class="btn btn-primary btn-lg" role="button" href="Forget2.jsp">
                    上一步</a>
                <input type="submit" value="下一步">
            </div>
        </div>
    </form>
</div>



</body>
</html>

