<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 76147
  Date: 2019/6/1
  Time: 17:22
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/default.css">
    <link href="../dist/pagination.css" rel="stylesheet" type="text/css">

    <style>
        .div1 {
            border: 1px solid black;
        }

        figure {
            display: none;
        }
    </style>
</head>
<body>

<div class="div1">
    <ul class="ul1">
        <li class="li" onclick="ma(this)">第一行</li>
        <figure><img src="../img/shangchuan.png" alt=""></figure>

        <li class="li" onclick="ma(this)">第二行</li>
        <figure><img src="killIE.jpg" alt=""></figure>
        <li class="li" onclick="ma(this)">第三行</li>
        <figure><img src="killIE.jpg" alt=""></figure>
        <li class="li" onclick="ma(this)">第四行</li>
        <figure><img src="killIE.jpg" alt=""></figure>
    </ul>
</div>
<script>
    function ma(item) {
        $(".ul1 .li").next().slideUp();   //如果你不想隐藏原来的，就把这行注释了
        $(item).next().slideDown();
    }
</script>
</body>
</html>
