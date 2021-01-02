<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 76147
  Date: 2019/6/5
  Time: 16:32
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>20177721047任思雨</title>
</head>
<body>
<s:form action="admin_login" method="POST" onsubmit="return dosubmit()">
    <s:textfield name="admin.adminName" label="admin"></s:textfield>
    <s:password name="admin.adminPwd" label="密码"></s:password>
    <s:submit label="登录"></s:submit>
</s:form>

<script type="text/javascript">
    var isCommitted = false;//表单是否已经提交标识，默认为false
    function dosubmit() {
        if (isCommitted == false) {
            isCommitted = true;
            return true;
        } else {
            return false;
        }
    }
</script>
</body>
</html>
