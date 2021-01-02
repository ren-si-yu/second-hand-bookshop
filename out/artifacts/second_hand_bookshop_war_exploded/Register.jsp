<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/5/16
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>

    <title>用户注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/Register.css">
    <link rel="stylesheet" href="css/Index.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ssl.captcha.qq.com/TCaptcha.js"></script>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <%--发送邮箱验证码js--%>
    <script>
        function down() {
            alert("确定要发送给：" + document.getElementById("email").value + "\n" + "由于某些原因可能会被存放到垃圾箱");
            var param = "?email=" + document.getElementById("email").value;
            var url = "${pageContext.request.contextPath}/sendEmailRegister" + param;
            var request = new XMLHttpRequest();
            request.open("POST", url);
            request.send();
            request.onreadystatechange = function () {
                //若响应完成且请求成功
                if ( request.status === 200) {
                    // alert("邮箱未注册");
                    document.getElementById("fat-btn").click();
                } else if (request.status == 333) {
                    alert("邮箱已注册");
                    return false;
                } else {
                    alert("未知错误！！！");
                    return false;
                }
            }

        };
    </script>

    <script>
        $(function () {
            $(".btn").click(function () {
                $(this).button('loading').delay(60000).queue(function () {
                    $(this).button('reset');
                    $(this).dequeue();
                });
            });
        });
    </script>
    <script>
        $(function () {
            $('#myModal').modal('hide')
        });
    </script>
    <script>
        $(function () {
            $('#myModal').on('hide.bs.modal', function () {
                alert('您还未进行登陆是否关闭？');
            })
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

        function checkRepwd() {
            var pwd = document.getElementById("pwd").value;
            var repwd = document.getElementById("repwd").value;
            if (pwd != repwd) {

                alert("两次输入的密码不一致");
                return false;
            }

        }

    </script>
</head>
<body>
<s:debug></s:debug>


<div class="I1">
    <a href="Index.jsp"><img src="img/Logo.png" style="height: 200px;width: 200px"></a>
    <h1>Second-hand BookShop</h1>

</div>
<br><br><br>
<div class="Register" style="background-color: whitesmoke">
    <h3>欢迎注册BookShop</h3>
    <br>


    <form method="post" action="user_register.action"
          name="form1" class="form-horizontal" role="form" onsubmit="return checkRepwd()">

        <div class="form-group" style="margin-left: 260px">

            <div class="col-sm-6">
                <input name="loginEmail"
                       class="form-control" title="注意"
                       data-container="body" data-toggle="popover" data-placement="right"
                       data-content="注册成功后用户名不允许修改"
                       placeholder="请输入邮箱" type="email" id="email" required="required" onchange="return check_email()">
            </div>
        </div>

        <div class="input-group" style="margin-left: 273px;width: 250px">
            <s:textfield name="CDKEY"
                         type="text" class="form-control" id="yanzhengma"
                         placeholder="输入验证码"></s:textfield>


            <%--  <input name="CDKEY"
                     type="text" class="form-control" id="yanzhengma"
                     placeholder="输入验证码" required="required">--%>
            <span class="input-group-btn">
						<button id="fat-btn" class="btn btn-default" data-loading-text="已发送..."
                                type="button" onmousedown="return down()"> 发送校验码
                        </button>

					</span>


        </div>

        <div class="form-group" style="margin-left: 260px">

            <div class="col-sm-6">
                <%--<p><s:fielderror name="keyError" theme="simple"></s:fielderror></p>--%>
                <p style="color: red"><s:property value="fieldErrors.keyError[0]"/></p>
            </div>
        </div>

        <div class="form-group" style="margin-left: 260px">

            <div class="col-sm-6">
                <input name="loginPwd"
                       class="form-control" title="注意"
                       data-container="body" data-toggle="popover" data-placement="right"
                       data-content="密码不能含有非法字符，长度在4-10之间"
                       placeholder="请输入密码" type="password" id="pwd" required="required" onblur="return checkPwd()">
            </div>
        </div>
        <div class="form-group" style="margin-left: 260px">

            <div class="col-sm-6">
                <input class="form-control"
                       placeholder="请再次输入密码" type="password" id="repwd" required="required">
            </div>
        </div>


        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-8">
                <label>
                    <input type="checkbox" required="required" checked="checked">
                </label>
                <a>*服务条款</a>
                <button type="submit" class="btn btn-primary" id="stamp">同意并注册</button>
            </div>
        </div>
    </form>
    <div class="form-group" style="margin-left: 260px">

        <div class="col-sm-6">
            <button id="TencentCaptcha" class="btn btn-danger"
                    data-appid="2049738981"
                    data-cbfn="callback" style="width: 250px">请先进行验证
            </button>
        </div>
    </div>
    <br><br>

    <p style="float: right;margin-right: 30px">已有账号？ <a href="#" data-toggle="modal" data-target="#myModal"><span
            class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;立即登录>></a></p>


    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        登录
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-5">
                                <input type="email" class="form-control" id="email"
                                       placeholder="请输入用户名" onblur="return check_email()">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="lastname"
                                       placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> 记住密码
                                    </label>
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    <label>
                                        <a href="Forget1.jsp">忘记密码？</a>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        关闭
                    </button>
                    <button type="button" class="btn btn-primary">
                        登录
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


</div>


<br><br><br><br><br><br><br><br>

<div class="jumbotron text-center" style="margin-bottom:0;clear: left;">
    <p>关于我们 | 用户反馈 | 版权所有</p>
    <p>地址：中国河南省郑州市金水区文化路97号</p>
</div>


</body>
</html>
