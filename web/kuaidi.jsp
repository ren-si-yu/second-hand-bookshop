<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>快递查询</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <script src="jquery-2.1.1/jquery.min.js"></script>
    <link rel="styleshe et" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="//cdn.trackingmore.com/plugins/v1/buttonCurrent.js"></script>
</head>
<body>
<div style="width: 100%;margin:0 auto;text-align:center;">
    <nav class="navbar navbar-default" role="navigation" style="margin-bottom:10px;margin-top: 0px;">
        <div class="container-fluid">

            <div style="float: right">


                <ul class="nav navbar-nav">
                    <li>

                        访问数：<s:property
                            value="#application.uv"></s:property>(<%=application.getAttribute("uv") == null ? 0 : application.getAttribute("uv")%>
                        )

                    </li>

                    <li>
                        当前在线人数：<s:property
                            value="#application.userCount"></s:property>(<%=application.getAttribute("userCount") == null ? 0 : application.getAttribute("userCount")%>
                        )

                    </li>

                    <li data-toggle="modal" data-target="#myModal" style=" border: 0; ">

                        <%if (session.getAttribute("user") == null) {%>
                        <a href="Login.jsp"><span
                                class="glyphicon glyphicon-log-in"></span>登录
                        </a>
                        <%
                        } else {%>
                        <a href="#"><span
                                class="glyphicon glyphicon-log-in"></span><%= "欢迎" + session.getAttribute("user")%>
                        </a>
                        <%}%>
                    </li>

                    <li><%if (session.getAttribute("user") == null) {%>
                        <a href="Register.jsp">注册</a>
                        <%
                        } else if (session.getAttribute("user") != null) {

                        %>
                        <a href="user_loginOut.action">退出</a>
                        <% }%></li>
                    <li><a href="SellBook.jsp">我要出书</a></li>
                    <li>
                        <a href="kuaidi.jsp">
                            物流查询
                        </a>

                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            我的服务
                            <b class="caret"></b>
                        </a>

                        <ul class="dropdown-menu">
                            <li><a href="Forget1.jsp">修改密码</a></li>
                            <li class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/user_personCenter.action">个人中心</a></li>
                            <li class="divider"></li>
                            <li><a href="address_searchAddress.action">收货地址</a></li>

                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/buy_showCarts.action"><span
                            class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;购物车</a>
                    </li>
                    <li><a href="buy_searchOrder.action">我的订单</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="I1">
        <a href="Index.jsp"><img src="img/Logo.png" style=" width: 200px;
    height: 200px;
    margin-left: 20%;
    float: left;"></a>
        <h1 style="margin-left:20%;margin-top:3%;float: left">物流信息查询</h1>

    </div>
</div>

<div style="display: block;margin-left:2%;margin-top:12%;">

    <form role="form" action="//track.trackingmore.com" method="get" onsubmit="return false">
        <div class="TM_input-group" style="margin: 20px auto">
            <input type="text" class="TM_my_search_input_style " id="button_tracking_number" placeholder="请输入快递单号"
                   name="button_tracking_number" value="" autocomplete="off" maxlength="100"
                   style="border-color: #fb6e50;width: 500px;">
            <span class="TM_input-group-btn" style="float: left;margin-left: 30px">
               <button class="TM_my_search_button_style " id="query" type="button" onclick="return doTrack()"
                       style="background-color: #fb6e50">查询</button>
           </span>
        </div>
        <input type="hidden" name="lang" value="cn"/>
        <input id="button_express_code" type="hidden" name="lang" value=""/>
    </form>
    <div id="TRNum"></div>
</div>

</body>
</html>