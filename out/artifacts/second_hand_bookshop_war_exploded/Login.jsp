<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/5/30
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>

    <title>用户登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/Login.css">
    <link rel="stylesheet" href="css/Index.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ssl.captcha.qq.com/TCaptcha.js"></script>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script>
        $(function () {
            $(".btn").click(function () {
                $(this).button('loading').delay(1000).queue(function () {
                    $(this).button('reset');
                    $(this).dequeue();
                });
            });
        });
    </script>


    <script>
        $(function () {
            $("[data-toggle='popover']").popover();
        });
    </script>
    <script>
        window.callback = function (res) {
            console.log(res)
            // res（用户主动关闭验证码）= {ret: 2, ticket: null}
            // res（验证成功） = {ret: 0, ticket: "String", randstr: "String"}
            if (res.ret === 0) {
                //取stamp，
                var stamp = document.getElementById("stamp");//设置盖章按钮为不可用
                stamp.disabled = false;
            }
        }
    </script>
    <script>
        function check_email() {
            var value = document.getElementById("email").value;
            var reg = /^[0-9A-Za-z][\.-_0-9A-Za-z]*@[0-9A-Za-z]+(\.[0-9A-Za-z]+)+$/;
            if (!reg.test(value)) {
                alert("邮箱格式不正确");
                return false;
            }
        }


        /*密码验证*/
        function checkPwd() {
            var value = document.getElementById("pwd").value;
            var reg = /^[a-zA-Z0-9]{4,10}$/;
            if (reg.test(value) == false) {
                alert("密码不能含有非法字符，长度在4-10之间");
                return false;
            }

        }


    </script>
    <script>
        function down() {
            var url = "http://www.baidu.com";
            var request = new XMLHttpRequest();
            request.open("GET", url);


        }
    </script>

</head>
<body>


<div class="I1">
    <a href="Index.jsp"><img src="img/Logo.png"></a>
    <h1>Second-hand BookShop</h1>

</div>
<br><br><br>
<div class="Register">
    <h3>欢迎登录BookShop</h3>
    <br>
    <form action="user_login.action" method="post"
          class="form-horizontal" role="form" action="Index.jsp" onsubmit="return checkRepwd()">
        <p><s:property value="fieldErrors.loginError[0]"/></p>
        <div class="form-group" style="margin-left: 150px">

            <div class="col-sm-8">
                <input name="loginEmail"
                       class="form-control"
                       placeholder="请输入邮箱" type="email" id="email" required="required" onblur="return check_email()">
            </div>
        </div>
        <br>

        <div class="form-group" style="margin-left: 150px">

            <div class="col-sm-8">
                <input name="loginPwd"
                       class="form-control" title="注意"
                       data-container="body" data-toggle="popover" data-placement="right"
                       data-content="密码不能含有非法字符，长度在4-10之间"
                       placeholder="请输入密码" type="password" id="pwd" required="required" onblur="return checkPwd()">
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="remember"> 记住密码
                    </label>
                    <label>
                        <a href="Forget1.jsp">忘记密码？</a>
                    </label>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-8">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    关闭
                </button>
                <button type="submit" class="btn btn-primary" id="stamp">登录</button>

                <%-- <button type="submit"  class="btn btn-primary" disabled="disabled" id="stamp">登录</button>--%>
            </div>
        </div>
    </form>
    <%--
        <div class="form-group" style="margin-left: 150px">

            <div class="col-sm-6">
                <button id="TencentCaptcha" class="btn btn-danger"
                        data-appid="2049738981"
                        data-cbfn="callback" style="width: 260px">请先进行验证
                </button>
            </div>
        </div>
        <br><br>
    --%>


</div>


<br><br><br><br><br><br><br><br>

<div class="jumbotron text-center" style="margin-bottom:0;clear: left;">
    <p>关于我们 | 用户反馈 | 版权所有</p>
    <p>地址：中国河南省郑州市金水区文化路97号</p>
</div>


</body>
</html>
