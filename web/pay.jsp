<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 76147
  Date: 2019/6/3
  Time: 12:06
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>20177721047任思雨</title>
</head>
<body>
<s:debug/>
<form name=alipayment action=${pageContext.request.contextPath}/alipay/alipay.trade.page.pay.jsp method=post
      target="_blank">
    <div id="body1" class="show" name="divcontent">
        <dl class="content">
            <hr class="one_line">
            <dt>商户订单号 ：</dt>
            <dd>
                <input id="WIDout_trade_no1" disabled="disabled" name="WIDout_trade_no"/>
                <input id="WIDout_trade_no" hidden="hidden" name="WIDout_trade_no"/>

            </dd>
            <hr class="one_line">
            <dt>订单名称 ：</dt>
            <dd>
                <input id="" disabled="disabled" name="WIDsubject" value="<s:property value="#session.goodName"/>"/>
                <input hidden="hidden" id="WIDsubject" name="WIDsubject"
                       value="<s:property value="#session.goodName"/>"/>

            </dd>
            <hr class="one_line">
            <dt>付款金额 ：</dt>
            <dd>
                <input id="" disabled="disabled" name="WIDtotal_amount"
                       value="<s:property value="#session.goodPrice"/>"/>
                <input hidden="hidden" id="WIDtotal_amount" name="WIDtotal_amount"
                       value="<s:property value="#session.goodPrice"/>"/>

            </dd>
            <hr class="one_line">
            <dt>商品描述：</dt>
            <dd>
                <input id="WIDbody" name="WIDbody" value="2019+<s:property value="#session.goodName"/>"/>

            </dd>
            <hr class="one_line">
            <dt>收货地址：</dt>
            <dd>
                <s:property value="#session.address"/>
            </dd>
            <hr class="one_line">
            <dt></dt>
            <dd id="btn-dd">


    <span class="new-btn-login-sp">
    <button class="new-btn-login" type="submit"
            style="text-align: center;">付 款</button>
    </span> <span class="note-help">如果您点击“付款”按钮，即表示您同意该次的执行操作。</span>
            </dd>
        </dl>
    </div>
</form>
</body>
</html>
<script language="javascript">
    var tabs = document.getElementsByName('tab');
    var contents = document.getElementsByName('divcontent');

    (function changeTab(tab) {
        for (var i = 0, len = tabs.length; i < len; i++) {
            tabs[i].onmouseover = showTab;
        }
    })();

    function showTab() {
        for (var i = 0, len = tabs.length; i < len; i++) {
            if (tabs[i] === this) {
                tabs[i].className = 'selected';
                contents[i].className = 'show';
            } else {
                tabs[i].className = '';
                contents[i].className = 'tab-content';
            }
        }
    }

    function GetDateNow() {
        var vNow = new Date();
        var sNow = "";
        sNow += String(vNow.getFullYear());
        sNow += String(vNow.getMonth() + 1);
        sNow += String(vNow.getDate());
        sNow += String(vNow.getHours());
        sNow += String(vNow.getMinutes());
        sNow += String(vNow.getSeconds());
        sNow += String(vNow.getMilliseconds());
        document.getElementById("WIDout_trade_no1").value = sNow;
        document.getElementById("WIDout_trade_no").value = sNow;
        document.getElementById("WIDsubjec t").value = "测试";
        document.getElementById("WIDtotal_amount").value = "0.01";
    }

    GetDateNow();
</script>