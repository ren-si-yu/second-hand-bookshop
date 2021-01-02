<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
Created by IntelliJ IDEA.
User: 11
Date: 2019/5/27
Time: 9:37
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/Index.css">
    <link rel="stylesheet" href="css/SellBook1.css">
    <script src="jquery-2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="img/info.js"></script>
    <script type="text/javascript" src="js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="js/SellBook1.js"></script>
    <title>上架图书</title>
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

<div>
    <form name="book1" method="post" action="book_addBook.action" enctype="multipart/form-data">
        <div style="margin-left: 22%;float: left;width: 281px;height: 365px;padding-top: 5%">
            <div style="position: relative;">
                <!--设置input的position为absolute，使其不按文档流排版，并设置其包裹整个布局 -->
                <!-- 设置opactity为0，使input变透明 -->
                <!-- 只接受jpg，gif和png格式 -->
                <input name="image" required="required"
                       id="upload-input" style="position: absolute; top: 0; bottom: 0; left: 0;right: 0; opacity: 0;"
                       type="file" accept="image/gif, image/jpg, image/png" onchange="showImg(this)"/>
                <!-- 自定义按钮效果 -->
                <div style="text-align: top">
                    <span style="font-size: 22px;">点击上传图片：</span>
                    <img id="upload" src="img/shangchuan.png"
                         style="width:180px; height: 90px; vertical-align: middle;"/>
                </div>
            </div>
            <div id="imgContainer" style="margin-top: 10px;"></div>
            <p class="help-block">请上传尺寸大小为280*360的图片<br>可上传一个或多个</p>
        </div>

        <table class="table table-hover" style="float: left;width: 30%;margin-left: 5%">
            <caption></caption>
            <thead>
            <tr>

                <th colspan="2">
                    名称：
                    <input name="bookName" required="required" type="text" class="form-control" id="bookname"
                           placeholder="请输入书籍名称"></th>

            </tr>
            </thead>
            <tbody>
            <tr>
                <td>书籍分类:
                    <div class="demo">
                        <select name="category1" id="province" onchange="getCity()" class="select">
                            <option value="-1">请选择</option>
                            <script type="text/javascript">
                                for (var i = 0; i < provinceArr.length; i++) {
                                    document.write("<option value='" + i + "'>" + provinceArr[i] + "</option>");

                                }
                            </script>
                        </select>
                    </div>
                    <div class="demo">

                        <select name="category2" id="city" class="select">
                            <option value="-1">请选择</option>
                            <!-- 利用js把省份添加到下拉列表里-->
                            <script type="text/javascript">
                                for (var i = 0; i < cityArr.length; i++) {
                                    document.write("<option value='" + i + "'>" + cityArr[i] + "</option>");

                                }
                            </script>
                        </select>
                    </div>
                </td>
                <td></td>
            <tr>
                <td>原价:&nbsp;&nbsp;&nbsp;&nbsp;<input name="marketPrice" required="required" type="text"
                                                      class="form-control" id="yuanjia"
                                                      placeholder="请输入书籍原价"></td>
                <td></td>

            </tr>
            <tr>
                <td>现价:&nbsp;&nbsp;&nbsp;&nbsp;<input name="currentPrice" required="required" type="text"
                                                      class="form-control" id="xianjia"
                                                      placeholder="请输入书籍现价"></td>
                <td></td>

            </tr>
            <tr>
                <td>库存：<input name="bookStock" required="required" type="text" class="form-control" id="kucun"
                              placeholder="请输入库存"></td>
                <td></td>
            </tr>
            <tr>
                <td>出版日期：<input name="publishDate" required="required" type="date" class="form-control" id="kucun"
                                placeholder="请输入出版日期"></td>
                <td></td>
            </tr>
            <tr>
                <td>作者：<input name="author" required="required" type="text" class="form-control" id="kucun"
                              placeholder="请输入作者姓名"></td>
                <td></td>
            </tr>
            <tr>
                <td>页数：<input name="page" required="required" type="text" class="form-control" id="kucun"
                              placeholder="请输入页数"></td>
                <td></td>
            </tr>
            <tr>
                <td>ISBN：<input name="isbn" required="required" type="text" class="form-control" id="kucun"
                                placeholder="请输入ISBN"></td>
                <td></td>
            </tr>
            <tr>
                <td>出版社：<input name="bookPress" required="required" type="text" class="form-control" id="kucun"
                               placeholder="请输入出版社"></td>
                <td></td>
            </tr>


            <tr>
                <td>详情介绍<textarea name="bookDesc" required="required" rows="5" class="form-control" id="name"
                                  placeholder="请添加书籍详情介绍"></textarea>
                </td>
                <td></td>
            </tr>

            </tbody>

<tr>
    <td>
        <button type="submit" class="btn btn-danger btn-lg">上架图书</button>
    </td>
</tr>

        </table>


    </form>


</div>


</body>

</html>
