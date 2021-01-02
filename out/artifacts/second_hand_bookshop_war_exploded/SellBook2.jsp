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
    <script src="img/info.js"></script>
    <script type="text/javascript" src="js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="js/SellBook1.js"></script>
    <title>上架图书</title>
</head>
<body>
<nav class="navbar navbar-default" role="navigation" style="margin-bottom:10px;margin-top: 0px;">
    <div class="container-fluid">

        <div style="float: right">

            <ul class="nav navbar-nav">

                <li data-toggle="modal" data-target="#myModal" style=" border: 0; ">
                    <a href="#"><span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;登录</a></li>

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
                                        <label for="firstname" class="col-sm-2 control-label">用户名</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" id="firstname"
                                                   placeholder="请输入用户名">
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


                <li><a href="Register.jsp">注册</a></li>
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
                        <li><a href="#">jmeter</a></li>
                        <li><a href="#">EJB</a></li>
                        <li><a href="#">Jasper Report</a></li>
                        <li class="divider"></li>
                        <li><a href="#">分离的链接</a></li>
                        <li class="divider"></li>
                        <li><a href="#">另一个分离的链接</a></li>
                    </ul>
                </li>
                <li><a href="BuyCar.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;购物车</a></li>
                <li><a href="Order.jsp">我的订单</a></li>
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
    <form action="book_addBook.action"
          name="book1" method="get">
        <div style="margin-left: 22%;float: left;width: 281px;height: 365px;padding-top: 5%">
            <div style="position: relative;">
                <!--设置input的position为absolute，使其不按文档流排版，并设置其包裹整个布局 -->
                <!-- 设置opactity为0，使input变透明 -->
                <!-- 只接受jpg，gif和png格式 -->
                <input name="image"
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
            <p class="help-block">请上传尺寸大小为280*360的图片<br></p>
        </div>

        <table class="table table-hover" style="float: left;width: 30%;margin-left: 5%">
            <caption></caption>
            <thead>
            <tr>

                <th colspan="2">
                    名称：
                    <input name="bookName" required="required"
                           type="text" class="form-control" id="bookname"
                           placeholder="请输入书籍名称"></th>

            </tr>
            </thead>
            <tbody>
            <tr>
                <td>书籍分类:
                    <div class="demo">
                        <select name="category1" id="province" onchange="getCity()" class="select">
                            <option value=""></option>
                            <script type="text/javascript">
                                for (var i = 0; i < provinceArr.length; i++) {
                                    document.write("<option value='" + i + "'>" + provinceArr[i] + "</option>");

                                }
                            </script>
                        </select>
                    </div>
                    <div class="demo">

                        <select name="category2" id="city" class="select">
                            <option value=""></option>
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
                <td>原价:&nbsp;&nbsp;&nbsp;&nbsp;<input name="marketPrice" required="required"
                                                      type="text" class="form-control" id="yuanjia"
                                                      placeholder="请输入书籍原价"></td>
                <td></td>

            </tr>
            <tr>
                <td>现价:&nbsp;&nbsp;&nbsp;&nbsp;<input name="currentPrice" required="required"
                                                      type="text" class="form-control" id="xianjia"
                                                      placeholder="请输入书籍现价"></td>
                <td></td>

            </tr>
            <tr>
                <td>库存数量：<input name="bookStock"
                        type="text" class="form-control" id="kucun"
                                placeholder="请输入库存"></td>
                <td></td>
            </tr>


            <tr>
                <td>详情介绍<textarea name="bookDesc" rows="5" class="form-control" id="name"
                                  placeholder="请添加书籍详情介绍"></textarea>
                </td>
                <td></td>
            </tr>

            </tbody>

        </table>

    </form>


</div>
<div style="margin-top: 34%;margin-left: 45%">
    <a class="btn btn-warning btn-lg" href="SellBook.jsp" role="button">确认修改</a>
</div>


</body>
</html>
