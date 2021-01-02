<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 76147
  Date: 2019/6/3
  Time: 22:49
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>20177721047任思雨</title>
</head>
<body>


<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            收货人
        </h3>
        <span><s:property value="#session.address.userName"/></span>
        <h3 class="panel-title">
            邮编
        </h3>
        <span><s:property value="#session.address.zipCode"/></span>
        <h3 class="panel-title">
            收货人手机号
        </h3>
        <span><s:property value="#session.address.userPhone"/></span>

        <h3 class="panel-title">
            收货地址
        </h3>
        <span><s:property value="#session.address.userAddress"/></span>

        <h3 class="panel-title">
            图书
        </h3>
        <span><s:property value="#session.order.bookName"/></span>
        <h3 class="panel-title">
            数量
        </h3>
        <span><s:property value="#session.order.bookNum"/></span>
        <h3 class="panel-title">
            总价
        </h3>
        <span><s:property value="#session.order.price"/></span>

    </div>
    <div class="panel-body">


    </div>
</div>
<form action="buy_addOrderNum.action" class="form-horizontal" role="form">

    <h4 class="modal-title" id="myModalLabel">
        请卖家发货
    </h4>

    <ul class="list-group">
        <li class="list-group-item">请卖家尽快发货</li>
        <li class="list-group-item">
            支持的物流有顺丰、韵达、中通、天天、申通等
        </li>
        <li class="list-group-item">
            您只需要在下面的文本框中输入订单号，之后点击提交即可
        </li>

        <li class="list-group-item">谢谢您的配合</li>
    </ul>


    <div class="form-group">
        <h3>请填写订单号：</h3>
        <label for="firstname" class="col-sm-2 control-label">运单号</label>
        <div class="col-sm-10">
            <input name="orderNumber" type="text" class="form-control" id="firstname"
                   placeholder="订单号">

        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">发货</button>
        </div>
    </div>
</form>
</body>
</html>
