<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/6/1
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Bootstrap 实例 - 悬停表格</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="width:1200px;height: 600px;">

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">买家提现信息查询</a>
        </div>
        <form class="navbar-form navbar-left" role="search" style="margin-left: 500px">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default">搜索</button>
        </form>
    </div>
</nav>

<table class="table table-hover">
    <caption>买家提现明细</caption>
    <thead>
    <tr>

        <th>邮箱</th>
        <th>id</th>
        <th>提现时间</th>
        <th>提现金额</th>
        <th>提现支付宝账号</th>

        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <s:iterator value="#session.withdrawsList">
        <tr>
            <td><s:property value="sellerEmail"/></td>
            <td><s:property value="withdrawId"/></td>
            <td><s:property value="creatTime"/></td>
            <td><s:property value="withdrawMoney"/></td>
            <td><s:property value="alipayNum"></s:property></td>

            <td>
                <button type="button" class="btn btn-default"><s:if test="withdrawStatus==1">已成功转账给买家</s:if>
                    <s:else><a href="admin_sureWithdraw.action?id=<s:property value="id"/>">确认提现</a></s:else>
                </button>
            </td>
        </tr>
    </s:iterator>
    </tbody>
</table>

</body>
</html>
