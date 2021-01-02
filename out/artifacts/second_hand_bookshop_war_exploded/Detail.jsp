<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/5/24
  Time: 13:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<div class="myTop">

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
                            <li><a href="PersonCenter.jsp">个人中心</a></li>
                            <li class="divider"></li>
                            <li><a href="Address.jsp">收货地址</a></li>

                        </ul>
                    </li>
                    <li><a href="BuyCar.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;购物车</a>
                    </li>
                    <li><a href="Order.jsp">我的订单</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="I1">
        <img src="img/Logo.png">
        <h1>Second-hand BookShop</h1>

    </div>

    <s:debug/>
    <nav>
        <div class="row clearfix">
            <div class="col-md-12 column">
                <nav class="navbar navbar-default" role="navigation" style="padding: 0 9%">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="index.action">首页</a>
                    </div>

                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li>
                                <a href="${pageContext.request.contextPath}/page_getBuyBookPage.action?typeOrName=<s:property value="typeOrName"/>&page=1">买书</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/seller_checkSeller.action">卖书</a>
                            </li>

                            <li>
                                <pre style="border: 0">                                                        </pre>
                            </li>

                            <li>
                                <form action="page_getBuyBookPage.action?typeOrName=type&page=1" method="get"
                                      class="bar6">
                                    <input type="text" name="param" placeholder="请输入您要搜索的内容...">
                                    <input type="text" hidden="hidden" name="typeOrName" value="name">
                                    <input type="text" hidden="hidden" name="page" value="1">
                                    <button type="submit"></button>
                                </form>
                            </li>
                        </ul>


                    </div>

                </nav>
            </div>
        </div>
    </nav>
</div>

<div>
    <div style="margin-left: 22%;float: left;width: 281px;height: 365px">
        <img
                style="width: 281px;height: 365px"
                src="<s:property value="bookDetail.bookImg"/>"
                alt="无法显示">
    </div>
    <form action="buy_addOrder.action" method="post">
        <table class="table table-hover" style="float: left;width: 30%;margin-left: 5%">
            <caption></caption>
            <thead>
            <tr>

                <th colspan="2"><s:property value="bookDetail.bookName"/></th>

            </tr>
            </thead>
            <tbody>
            <tr>
                <td>原价:&nbsp;&nbsp;&nbsp;&nbsp;<font style="text-decoration: line-through red"><s:property
                        value="bookDetail.marketPrice"/></font></td>
                <td></td>

            </tr>
            <tr>
                <td>现价:&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-size:50px;color: #b92c28"><s:property
                        value="bookDetail.currentPrice"/></font></td>
                <td></td>

            </tr>
            <tr>
                <td>购买数量：
                    <input type="number" name="bookNum" min="1" max="<s:property value="bookDetail.bookStock"/>"
                           step="1" value="1">
                    <input name="bookId" value="<s:property value="bookDetail.bookId"/>" hidden="hidden" type="text">
                    <input name="goodName" value="<s:property value="bookDetail.bookName"/>" hidden="hidden"
                           type="text">
                    <input name="goodPrice" value="<s:property value="bookDetail.currentPrice"/>" hidden="hidden"
                           type="text">
                    <input name="sellerEmail" value="<s:property value="bookDetail.sellerEmail"/>" hidden="hidden"
                           type="text">
                </td>

                <td></td>
            </tr>
            <tr>
                <td>库存：<s:property
                        value="bookDetail.bookStock"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;运费：6.00(统一)
                </td>
                <td></td>
            </tr>
            <tr>
                <td>发货地址：<s:property value="bookDetail.bookshelfAddress"/></td>
                <td></td>
            </tr>
            <tr>

                <td>
                    <%--  <a href="${pageContext.request.contextPath}/buy_addOrder.action?bookId=<s:property value="#pageVar.bookId"/>&goodName=<s:property value="#pageVar.bookName"/>&goodPrice=<s:property value="#pageVar.currentPrice"/>&sellerEmail=<s:property value="#pageVar.sellerEmail"/>"
                         class="btn btn-danger btn-lg" role="button" >
                          立即购买
                      </a>--%>
                    <s:if test="bookDetail.bookStock==0">
                        <input type="submit" disabled="disabled" class="btn btn-danger btn-lg" value="库存为0">

                    </s:if>
                    <s:else>
                        <input type="submit" class="btn btn-danger btn-lg" value="立即购买">
                    </s:else>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="${pageContext.request.contextPath}/buy_addCarts.action?bookId=<s:property value="bookDetail.bookId"/>&
sellerEmail=<s:property value="bookDetail.sellerEmail"/>" class="btn btn-warning btn-lg" role="button">
                        加入购物车
                    </a>
                </td>
                <td></td>
            </tr>

            </tbody>
        </table>
    </form>


</div>


<br><br><br>
<hr>
<br><br><br>


<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="tabbable" id="tabs-566185">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#panel-377640" data-toggle="tab">书籍详情</a>
                    </li>
                    <li>
                        <a href="#panel-782257" data-toggle="tab">顾客评价</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="panel-377640">
                        <p>
                            <s:property value="bookDetail.bookDesc"/>
                        </p>
                    </div>
                    <div class="tab-pane" id="panel-782257">
                        <p>
                            已关闭顾客评价
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
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
    <title>书籍详情</title>
</head>
</html>
