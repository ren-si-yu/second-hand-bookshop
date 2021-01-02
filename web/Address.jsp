<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/5/27
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/Index.css">
    <script src="jquery-2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
    <title>收货地址</title>
    <style>
        .fakeimg {
            height: 200px;
            background: #aaa;
        }
    </style>
</head>

<body>


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
    <img src="img/Logo.png">
    <h1>Second-hand BookShop</h1>

</div>

<nav>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <nav class="navbar navbar-default" role="navigation" style="padding: 0 9%">
                <div class="navbar-header">
                    <a class="navbar-brand" href="Index.jsp">首页</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">

                        <li>
                            <a href="Index.jsp">买书</a>
                        </li>
                        <li>
                            <a href="SellBook.jsp">卖书</a>
                        </li>

                        <li>
                            <pre style="border: 0">                                                        </pre>
                        </li>

                        <li>
                            <form class="bar6">
                                <input type="text" placeholder="请输入您要搜索的内容...">
                                <button type="submit"></button>
                            </form>
                        </li>
                    </ul>


                </div>

            </nav>
        </div>
    </div>
</nav>


<div style="width: 1500px;margin: 10px auto">

    <div class="panel panel-default">
        <div class="panel-heading">我的收货地址</div>
        <table class="table" style="text-align: center">
            <th style="text-align: center">收货人</th>
            <th style="text-align: center">收货地址</th>
            <th style="text-align: center">邮政编码</th>
            <th style="text-align: center">电话/手机</th>
            <th style="text-align: center">操作</th>
            <th style="text-align: center"></th>


            <s:iterator value="#session.addressList">
                <tr>
                    <td>
                        <s:property value="userName"></s:property>
                    </td>
                    <td>
                        <s:property value="userAddress"/>
                    </td>

                    <td>
                        <s:property value="zipCode"></s:property>
                    </td>
                    <td>
                        <s:property value="userPhone"></s:property>
                    </td>
                    <td>
                        &nbsp;|&nbsp;<a
                            href="address_delAddress.action?id=<s:property value="id"/>">删除</a>|&nbsp;<br>
                    </td>
                    <s:if test="first==1">
                        <td>默认</td>
                    </s:if>
                    <s:else>
                        <td><a href="address_updateAddress.action?id=<s:property value="id"/>">设为默认收货地址</a></td>
                    </s:else>
                </tr>
            </s:iterator>

        </table>
    </div>
    <br><br><br><br><br>
    <p>

        <s:debug/>

        <a class="btn btn-info btn-lg btn-block" href="Map.jsp" role="button">添加收货地址</a>
    </p>
</div>
</body>
</html>
