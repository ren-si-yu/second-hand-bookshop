<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/5/14
  Time: 14:21
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
        function check_email() {
            var value = document.getElementById("email").value;
            var reg = /^[0-9A-Za-z][\.-_0-9A-Za-z]*@[0-9A-Za-z]+(\.[0-9A-Za-z]+)+$/;
            if (!reg.test(value)) {
                alert("邮箱格式不正确");

                return false;
            }
        }
    </script>
    <title>Second-hand BookShop</title>


</head>

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
<%--<div class="I2" style="border: #0f0f0f ; margin: auto;">
</div>

<div class="foot" style="height: 300px"></div>--%>

<div class="I2" style="border: #0f0f0f ; ">
    <div class="panel-group" id="accordion"
         style="text-align: center;width:15%;margin-left: 10%;float:left">

        <%--一个小单位--%>
        <s:iterator value="#session.categoriesList" var="cate" status="out">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#collapse<s:property value="#out.index+1"/>" style="text-decoration: none;">
                            <s:property value="categoryName"/><span
                                class="glyphicon glyphicon-chevron-down" style="margin-right: 1%"></span>
                        </a>
                    </h4>
                </div>
                <div id="collapse<s:property value="#out.index+1"/>" class="panel-collapse collapse">
                    <s:iterator value="categorysecond" var="inner">
                        <a href="${pageContext.request.contextPath}/page_getBuyBookPage.action?typeOrName=type&param=<s:property value="categorySecondName"/>&page=1"
                           class="list-group-item "><s:property value="categorySecondName"/></a>
                    </s:iterator>
                </div>
            </div>
        </s:iterator>
        <%--        <s:iterator value="#session.categoriesList" status="out">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#collapse<s:property value="#out.index+1"/>" style="text-decoration: none;">
                                    <s:property value="categoryName"/><span
                                        class="glyphicon glyphicon-chevron-down" style="margin-right: 1%"></span>
                                </a>
                            </h4>
                        </div>
                        <div id="collapse<s:property value="#out.index+1"/>" class="panel-collapse collapse">
                            <s:iterator value="categorysecond" var="inner">
                                <a href="${pageContext.request.contextPath}/book_searchByType.action?type=<s:property value="categorySecondName"/>"
                                   class="list-group-item "><s:property value="categorySecondName"/></a>
                            </s:iterator>
                        </div>
                    </div>
                </s:iterator>--%>

    </div>

    <div class="right" style="display: block;float:left; width: 60%">
        <div class="LB" style="display: block;width: 796px;height:326px;float:left; margin-left:150px;">
            <div id="myCarousel" class="carousel slide">
                <!-- 轮播（Carousel）指标 -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <!-- 轮播（Carousel）项目 -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="img/1.png" alt="First slide">
                    </div>
                    <div class="item">
                        <img src="img/2.png" alt="Second slide">
                    </div>
                    <div class="item">
                        <img src="img/3.png" alt="Third slide">
                    </div>
                </div>
                <!-- 轮播（Carousel）导航 -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>

                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>

                </a>
            </div>
        </div>
        <div class="row" style="">

            <s:iterator value="myPage.list" var="pageVar" status="pageIterator">

                <div class="col-sm-6 col-md-3" style="width:260px;margin: 20px">
                    <div class="thumbnail">
                        <a href="buy_detail.action?bookId=<s:property value="#pageVar.bookId"/>&sellerEmail=<s:property value="#pageVar.sellerEmail"/>"><img
                                style="width: 100px;height: 150px"
                                src="<s:property value="#pageVar.bookImg"/>"
                                alt="无法显示"></a>
                        <div class="caption">
                            <h3><s:property value="#pageVar.bookName"/></h3>
                            <h4>原价：<font style="text-decoration: line-through red"><s:property
                                    value="#pageVar.marketPrice"/></font> 现价：<s:property value="#pageVar.currentPrice"/>
                            </h4>
                            <p>
                                <s:if test="#pageVar.bookStock==0">
                                    <a href=""
                                       class="btn btn-primary" role="button">
                                        库存为0
                                    </a>
                                </s:if><s:else>
                                <a href="${pageContext.request.contextPath}/buy_addOrder.action?bookNum=1&bookId=<s:property value="#pageVar.bookId"/>&goodName=<s:property value="#pageVar.bookName"/>&goodPrice=<s:property value="#pageVar.currentPrice"/>&sellerEmail=<s:property value="#pageVar.sellerEmail"/>"
                                   class="btn btn-primary" role="button">
                                    立即购买
                                </a>
                            </s:else>

                                <a href="${pageContext.request.contextPath}/buy_addCarts.action?bookId=<s:property value="#pageVar.bookId"/>&
sellerEmail=<s:property value="#pageVar.sellerEmail"/>" class="btn btn-default" role="button">
                                    加入购物车
                                </a>
                            </p>
                        </div>
                    </div>

                </div>

            </s:iterator>

            <div class="fenye" style="display: block;clear: left;">
                <center>
                    <ul class="pagination pagination-lg">
                        <li <s:if test="!myPage.isHasPre||myPage.page<1">class="disabled" </s:if>><a
                                href="${pageContext.request.contextPath}/page_getBookPage.action?typeOrName=<s:property value="typeOrName"/>&page=<s:property value="myPage.page-5"/>">&laquo;</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/page_getBookPage.action?typeOrName=<s:property value="typeOrName" />&page=<s:property value="myPage.page" default="1"/>">
                                <s:property value="myPage.page"/></a></li>
                        <li>
                            <a href="${pageContext.request.contextPath}/page_getBookPage.action?typeOrName=<s:property value="typeOrName"/>&page=<s:property value="myPage.page+1"/>">
                                <s:property value="myPage.page+1"/></a></li>
                        <li>
                            <a href="${pageContext.request.contextPath}/page_getBookPage.action?typeOrName=<s:property value="typeOrName"/>&page=<s:property value="myPage.page+2"/>">
                                <s:property value="myPage.page+2"/></a></li>
                        <li>
                            <a href="${pageContext.request.contextPath}/page_getBookPage.action?typeOrName=<s:property value="typeOrName"/>&page=<s:property value="myPage.page+3"/>">
                                <s:property value="myPage.page+3"/></a></li>
                        <li>
                            <a href="${pageContext.request.contextPath}/page_getBookPage.action?typeOrName=<s:property value="typeOrName"/>&page=<s:property value="myPage.page+4"/>">
                                <s:property value="myPage.page+4"/></a></li>
                        <li <s:if test="!myPage.isHasNext||myPage.page+5>myPage.totalPage">class="disabled" </s:if>><a
                                href="${pageContext.request.contextPath}/page_getBookPage.action?typeOrName=<s:property value="typeOrName"/>&page=<s:property value="myPage.page+9"/>">&raquo;</a>
                        </li>
                    </ul>
                </center>
            </div>

        </div>

    </div>

</div>

<div class="rightdown" style="width: 50px;height: 300px;position: fixed;right: 0px;bottom: 200px">
    <a href="#" class="list-group-item"><span class="glyphicon glyphicon-arrow-up"></span>回到顶部</a>
    <a href="${pageContext.request.contextPath}/buy_showCarts.action" class="list-group-item"><span
            class="glyphicon glyphicon-shopping-cart"></span>查看购物车</a>


    <%--<a href="javaScript:void(0)" class="list-group-item" id="code2s"><span class="glyphicon glyphicon-user"></span> 联系客服</a>--%>

    <a id="modal-399674" href="#modal-container-399674" role="button" class="list-group-item"
       data-toggle="modal"><span class="glyphicon glyphicon-user"></span>联系管理员</a>



</div>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">

            <div class="modal fade" id="modal-container-399674" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                           
                        </div>
                        <div class="modal-body">
                           <img src="img/qrcode_1559788585309.png">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>

                </div>

            </div>

        </div>
    </div>
</div>

</div>
<div class="jumbotron text-center" style="margin-bottom:0;clear: left;">
    <p>关于我们 | 用户反馈 | 版权所有</p>
    <p>地址：中国河南省郑州市金水区文化路97号</p>
</div>


</body>

</html>
