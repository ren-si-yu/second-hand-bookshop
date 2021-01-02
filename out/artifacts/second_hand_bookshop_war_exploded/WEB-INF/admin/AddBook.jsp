<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/6/1
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="../css/SellBook1.css">
    <script src="../jquery-2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="../js/info.js"></script>
    <script type="text/javascript" src="../js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="../js/SellBook1.js"></script>
    <title>上架图书</title>
</head>
<body style="width:1200px;height: 600px;">

        <div style="width: 281px;height: 365px;float: left">
            <div style="position: relative;">
                <!--设置input的position为absolute，使其不按文档流排版，并设置其包裹整个布局 -->
                <!-- 设置opactity为0，使input变透明 -->
                <!-- 只接受jpg，gif和png格式 -->
                <input id="upload-input" style="position: absolute; top: 0; bottom: 0; left: 0;right: 0; opacity: 0;" type="file" accept="image/gif, image/jpg, image/png" onchange="showImg(this)" multiple />
                <!-- 自定义按钮效果 -->
                <div>
                    <span style="font-size: 22px;">点击上传图片：</span>
                    <img id="upload" src="../img/shangchuan.png" style="width:180px; height: 90px; vertical-align: middle;" />
                </div>
            </div>
            <div id="imgContainer" style="margin-top: 10px;"></div>
            <p class="help-block">请上传尺寸大小为280*360的图片<br>可上传一个或多个</p>
        </div>

        <form name="book1" method="post" action="SellBook.jsp">
        <table class="table table-hover" style="float: left;width: 30%;">
            <caption></caption>
            <thead>
            <tr>

                <th colspan="2">
                    名称：
                    <input type="text" class="form-control" id="bookname"
                           placeholder="请输入书籍名称"></th>

            </tr>
            </thead>
            <tbody>
            <tr>
                <td>书籍分类:
                    <div class="demo">
                        <select name="province" id="province" onchange="getCity()" class="select">
                            <option value=""></option>
                            <!-- 利用js把省份添加到下拉列表里-->
                            <script type="text/javascript">
                                for (var i = 0; i < provinceArr.length; i++) {
                                    document.write("<option value='" + i + "'>" + provinceArr[i] + "</option>");

                                }
                            </script>
                        </select>
                    </div>
                    <div class="demo">

                        <select name="city" id="city" class="select" >
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
                <td>原价:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" id="yuanjia"
                                                      placeholder="请输入书籍原价"></td>
                <td></td>

            </tr>
            <tr>
                <td>现价:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" id="xianjia"
                                                      placeholder="请输入书籍现价"></td>
                <td></td>

            </tr>
            <tr>
                <td>库存数量：<input type="text" class="form-control" id="kucun"
                                placeholder="请输入库存"></td>
                <td></td>
            </tr>


            <tr>
                <td>详情介绍<textarea rows="5" class="form-control" id="name"
                                  placeholder="请添加书籍详情介绍"></textarea>
                </td>
                <td></td>
            </tr>
            <tr>
                <td><button type="submit" class="btn btn-default">上架图书</button></td>
            </tr>
            </tbody>

        </table>

    </form>


</div>



</body>
</html>
