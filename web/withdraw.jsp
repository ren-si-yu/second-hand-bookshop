<%--
  Created by IntelliJ IDEA.
  User: 11
  Date: 2019/5/31
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>操作成功</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta http-equiv="refresh" content="3;url=${pageContext.request.contextPath}/user_personCenter.action" />
    <script type="text/javascript">
        $(function() {
            var wait = $(".second").html();
            timeOut();
            /**
             * 实现倒计时
             */
            function timeOut() {
                if(wait != 0) {
                    setTimeout(function() {
                        $('.second').text(--wait);
                        timeOut();
                    }, 1000);
                }
            }
        });

    </script>
</head>
<body>

<div class="alert alert-success"style="width: 50%;margin-left:30%;margin-top: 10% ">


    <h3>恭喜您，您已提现成功！</h3>
    <p class="page-404">
        <span>页面正在</span>
        <a href="Index.jsp">跳转</a>
        <span>等待时间：</span>
        <span class="second">3</span>
    </p>


</div>

</body>
</html>