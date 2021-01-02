<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/5/22
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
    <script type="text/javascript" src="js/gouwu.js"></script>
    <link href="css/gouwu.css" rel="stylesheet" type="text/css"/>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/Index.css">
    <link rel="stylesheet" href="css/BuyCar.css">
    <script src="jquery-2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

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
    <a href="Index.jsp"><img src="img/Logo.png"></a>
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
<s:debug/>

<div style="width: 1500px;margin: 10px auto">

    <div class="panel panel-default">
        <%-- <div class="panel-heading">店铺名称/商家名称</div>

         <table class="table" id="gwcTable">
             <tr>
                 <th></th>
                 <th>书籍详情</th>
                 <th>书籍名称：</th>
                 <th>单价</th>
                 <th>数量</th>
                 <th>金额</th>
                 <th>操作</th>
             </tr>


             <tr>
                 <td>

                     <input type="checkbox" value="" class="checkCss">

                 </td>
                 <td><img src="img/Struts2+Spring+Hibernate+MyBatis网站开发案例课堂.png"
                          alt="通用的占位符缩略图" style="height: 150px;width: 100px;float: left">
                 </td>
                 <td style="width: 150px"><p style="width: 500px;font-size: 10px"><br><br><br>Struts2+Spring+Hibernate+MyBatis网站开发案例课堂
                 </p>
                 </td>
                 <td>200</td>
                 <td class="count"><input class="reduceCss" id="jia1" value="-" type="button"/>
                     <input type="text" class="inputCountCss" id="inputCountCss1" value="1" size="8"/>
                     <input class="addCss" id="jia2" value="+" type="button"/></td>
                 <td id="stotal3">200</td>

                 <td><a>移出购物车</a></td>
             </tr>

         </table>
     </div>
 --%>

        <div id="listdiv"><h4>购物车</h4>
            <table class="table" id="gwcTable">
                <tr>
                    <th><input type="checkbox" id="checkAll"/>全选</th>
                    <th>商品</th>
                    <th>书籍名称：</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>小计</th>
                    <th>操作</th>

                </tr>
                <s:iterator value="cartsList" status="cart">
                    <tr>
                        <td><input type="checkbox" class="checkCss"/></td>
                        <td><p><img src="<s:property value="bookImg"/>"
                                    alt="无法显示，请换一个浏览器查看" style="height: 150px;width: 100px;float: left"></p>
                        </td>
                        <td><s:property value="bookName"/></td>
                        <td><s:property value="currentPrice"/></td>
                        <td class="count">
                            <input class="reduceCss" id="jia1" value="-" type="button"/>
                            <input type="text" class="inputCountCss" id="inputCountCss1" value="1" size="8"/>
                            <input class="addCss" id="jia2" value="+" type="button"/>
                        </td>

                        <td id="stotal3">200</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/buy_removeCarts.action?cartId=<s:property value="cartId"/>"
                               class="a">移出购物车</a></td>
                    </tr>
                </s:iterator>
            </table>
        </div>

    </div>


    <div class="panel panel-info"
         style="position: fixed;left:210px;bottom: 20px;width: 1500px;background-color: #c4e3f3">

        <div class="t TotalMoney" style="float: left;margin-left: 50%;font-size: 20px">合计：￥<span
                id="priceTotal">0.00</span></div>
        <div class="t" style="float: left;margin-left: 10%;font-size: 20px">已选商品 <span id="countTotal">0</span> 件</div>
        <div class="t jisuanbtn" style="float: left;margin-left: 10%;font-size: 20px">
            <input type="submit" name="btnOrder" id="btnOrder" value="立即结算"/>
        </div>

    </div>
</div>


</body>
</html>
