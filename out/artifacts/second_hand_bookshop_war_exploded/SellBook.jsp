<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/5/24
  Time: 13:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>卖家中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/Index.css">
    <link rel="stylesheet" href="css/BuyCar.css">
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
    <h1 style="margin-left:45%; ">卖家中心</h1>

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
                            <a href="${pageContext.request.contextPath}/page_getBuyBookPage.action?typeOrName=<s:property value="typeOrName"/>&page=1">买书</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/seller_checkSeller.action">卖书</a>
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

<s:debug></s:debug>
<div style="width: 1500px;margin: 10px auto">

    <div class="panel panel-default">
        <div class="panel-heading">书架的图书</div>

        <ul id="myTab" class="nav nav-tabs">
            <li class="active"><a href="#1" data-toggle="tab"> <span class="glyphicon glyphicon-th"></span></a></li>
            <li><a href="${pageContext.request.contextPath}/seller_getMyBookByStatus.action?status=0"
                   data-toggle="tab1">待出售</a></li>
            <li><a href="${pageContext.request.contextPath}/seller_getMyBookByStatus.action?status=1"
                   data-toggle="tab2">待发货</a></li>
            <li><a href="${pageContext.request.contextPath}/seller_getMyBookByStatus.action?status=2"
                   data-toggle="tab3">已售出</a></li>
            <li><a href="${pageContext.request.contextPath}/seller_getMyBookByStatus.action?status=-1"
                   data-toggle="tab4">已下架</a></li>

        </ul>

        <div id="myTabContent" class="tab-content">

            <div class="tab-pane fade in active" id="1">

                <table class="table">
                    <tr>
                        <th></th>
                        <th>书籍详情</th>
                        <th></th>
                        <th>价格</th>
                        <th>数量</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    <s:if test="#session.status==0||#session.status==-1">
                        <s:iterator value="#session.bookList" status="index">

                            <s:if test="bookId!=null">
                                <tr style="color: #2aabd2">
                                    <td>
                                        <label>
                                            <input type="checkbox" value="">
                                        </label>
                                    </td>
                                    <td><img src="<s:property value="bookImg"/>"
                                             alt="通用的占位符缩略图" style="height: 150px;width: 100px;float: left">
                                    </td>
                                    <td style="width: 150px"><p style="width: 500px;font-size: 10px">
                                        <s:property value="bookName"></s:property>
                                    </p>
                                    </td>
                                    <td><s:property value="currentPrice"/></td>
                                    <td><s:property value="bookStock"/></td>
                                    <td><s:if test="status==0">待出售</s:if><s:elseif
                                            test="status==1">待发货</s:elseif>
                                        <s:elseif test="ststus==2">已售出</s:elseif>
                                        <s:elseif test="status==-1">已下架</s:elseif>
                                    </td>
                                    <td>
                                        <s:if test="status==-1">
                                            <a href="${pageContext.request.contextPath}/book_onShelfBook.action?bookId=<s:property value="bookId"/>">上架图书</a>
                                        </s:if>
                                        <s:elseif test="status!=1">
                                            <a href="${pageContext.request.contextPath}/book_offShelfBook.action?bookId=<s:property value="bookId"/>">下架图书</a>
                                        </s:elseif>
                                            <%-- <a href="${pageContext.request.contextPath}/book_deleteBook.action?bookId=<s:property value="bookId"/>"
                                                role="button" class="btn btn-default">删除</a>
         --%>
                                            <%--<s:if test="status==1"> <a
                                                    href="${pageContext.request.contextPath}/book_deleteBook.action?bookId=<s:property value="bookId"/>"
                                                    role="button" class="btn btn-default">发货</a></s:if>--%>
                                        <s:if test="status==1">
                                            <a id="modal-246448"
                                               href="${pageContext.request.contextPath}/buy_fahuo.action?bookId=<s:property value="bookId"/>"
                                               role="button"
                                               class="btn btn-default" data-toggle="modal">发货</a>
                                        </s:if>
                                        <s:else>
                                            <a href="${pageContext.request.contextPath}/book_deleteBook.action?bookId=<s:property value="bookId"/>"
                                               role="button" class="btn btn-default">删除</a>
                                        </s:else>
                                    </td>
                                        <%--  <td>
                                                  <s:if test="status==-1"><a href="${pageContext.request.contextPath}/
                                              book_onShelfBook.action?bookName=<s:property value="bookId"/>">上架图书</a></s:if><s:else><a
                                                      href="${pageContext.request.contextPath}/
                                              book_offShelfBook.action?bookName=<s:property value="bookId"/>">下架图书</a></s:else><a
                                                      href="${pageContext.request.contextPath}/
                                              book_editBook.action?bookName=<s:property value="bookId"/>">编辑信息</a></td>--%>
                                </tr>
                            </s:if>

                        </s:iterator>
                    </s:if>
                    <s:elseif test="#session.status==1"><%--发货--%>
                        <s:iterator value="#session.orderList" status="index">

                            <s:if test="orderStatus==0||orderStatus==1">
                                <tr style="color: #2aabd2">
                                    <td>
                                        <label>
                                            <input type="checkbox" value="">
                                        </label>
                                    </td>
                                    <td>
                                    </td>
                                    <td style="width: 150px"><p style="width: 500px;font-size: 20px">
                                        <s:property value="bookName"></s:property>
                                    </p>
                                    </td>
                                        <%--0已支付未发货
                                                                                    1已支付已发货
                                                                                    2已支付成交--%>
                                    <td><s:property value="price"/></td>
                                    <td><s:property value="bookNum"/></td>
                                    <td><s:if test="orderStatus==0">待发货</s:if><s:elseif
                                            test="orderStatus==1">已发货</s:elseif>

                                    </td>
                                    <td>

                                        <s:if test="orderStatus==0">
                                            <a id="modal-246448"
                                               href="${pageContext.request.contextPath}/buy_fahuo.action?id=<s:property value="id"/>&bookId=<s:property value="bookId"/>"
                                               role="button"
                                               class="btn btn-default" data-toggle="modal">发货</a>
                                        </s:if>
                                        <s:elseif test="orderStatus==1">发货成功</s:elseif>
                                            <%-- <s:else>
                                                 <a href="${pageContext.request.contextPath}/book_deleteBook.action?bookId=<s:property value="bookId"/>"
                                                    role="button" class="btn btn-default">删除</a>
                                             </s:else>--%>
                                    </td>
                                        <%--  <td>
                                                  <s:if test="status==-1"><a href="${pageContext.request.contextPath}/
                                              book_onShelfBook.action?bookName=<s:property value="bookId"/>">上架图书</a></s:if><s:else><a
                                                      href="${pageContext.request.contextPath}/
                                              book_offShelfBook.action?bookName=<s:property value="bookId"/>">下架图书</a></s:else><a
                                                      href="${pageContext.request.contextPath}/
                                              book_editBook.action?bookName=<s:property value="bookId"/>">编辑信息</a></td>--%>
                                </tr>
                            </s:if>

                        </s:iterator>

                    </s:elseif>
                    <s:elseif test="#session.status==2"><%--已成交--%>
                        <s:iterator value="#session.orderList" status="index">

                            <s:if test="orderStatus==2">
                                <tr style="color: #2aabd2">
                                    <td>
                                        <label>
                                            <input type="checkbox" value="">
                                        </label>
                                    </td>
                                    <td>
                                    </td>
                                    <td style="width: 150px"><p style="width: 500px;font-size: 20px">
                                        <s:property value="bookName"></s:property>
                                    </p>
                                    </td>
                                        <%--0已支付未发货
                                                                                    1已支付已发货
                                                                                    2已支付成交--%>
                                    <td><s:property value="price"/></td>
                                    <td><s:property value="bookNum"/></td>
                                    <td><s:if test="orderStatus==0">待发货</s:if><s:elseif
                                            test="#session.status==1&&orderStatus==1">已发货</s:elseif>
                                        <s:elseif test="#session.status==2&&orderStatus==2">成交</s:elseif>
                                        <s:elseif test="#session.status==-1">已下架</s:elseif>
                                    </td>
                                    <td>

                                        <s:if test="orderStatus==0">
                                            <a id="modal-246448"
                                               href="${pageContext.request.contextPath}/buy_fahuo.action?bookId=<s:property value="bookId"/>"
                                               role="button"
                                               class="btn btn-default" data-toggle="modal">发货</a>
                                        </s:if>
                                        <s:elseif test="orderStatus==2"><a
                                                href="user_personCenter.action">查看余额</a></s:elseif>
                                            <%-- <s:else>
                                                 <a href="${pageContext.request.contextPath}/book_deleteBook.action?bookId=<s:property value="bookId"/>"
                                                    role="button" class="btn btn-default">删除</a>
                                             </s:else>--%>
                                    </td>
                                        <%--  <td>
                                                  <s:if test="status==-1"><a href="${pageContext.request.contextPath}/
                                              book_onShelfBook.action?bookName=<s:property value="bookId"/>">上架图书</a></s:if><s:else><a
                                                      href="${pageContext.request.contextPath}/
                                              book_offShelfBook.action?bookName=<s:property value="bookId"/>">下架图书</a></s:else><a
                                                      href="${pageContext.request.contextPath}/
                                              book_editBook.action?bookName=<s:property value="bookId"/>">编辑信息</a></td>--%>
                                </tr>
                            </s:if>

                        </s:iterator>

                    </s:elseif>

                </table>
            </div>


        </div>
    </div>

    <p>
        <a class="btn btn-info btn-lg btn-block" href="${pageContext.request.contextPath}/seller_sellBook.action"
           role="button">上架图书</a>
    </p>

</div>


</body>
</html>
