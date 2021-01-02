<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<%@ page import="com.alipay.api.*" %>
<%@ page import="com.alipay.api.request.*" %>
<%@ page import="com.bookshop.alipay.config.AlipayConfig" %>

<body>
<%
    //获得初始化的AlipayClient
//	AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.URL, AlipayConfig.APPID, AlipayConfig.RSA_PRIVATE_KEY, "json", AlipayConfig.CHARSET, AlipayConfig.ALIPAY_PUBLIC_KEY, AlipayConfig.SIGNTYPE);
    AlipayClient alipayClient = new
            DefaultAlipayClient("https://openapi.alipaydev.com/gateway.do", "2016092900624574", "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCu9AoKpBBN753inP+iJ/l8v7Pg43PFZXdnmJ4E7qHa/1oALzfOpqGs7Gd63jex5VRIq07nRoqTemsR11uvBZ33ScprMllmsOEEqXYQdr7MdPUqHBw9Lb6loz56832fLtKbQeT5wDInCzKmzOvTu6R0wDJKRvVLNAAfgBnLe57wqiBZSnLYSUgmNxhQ2EKbIRC+dc+QOsRLXV9wFMpdE/HAZbhNs7P3M1CzFPds9AbzZwNZv6zCGqeK+1TMnz9Me+dnczpJhhLllDDh6tMTQRihVUl4FjzMNQQQVAm9fLS6ozzO+AjZhbP9cHv9B16Eh8T4Jr1HoONN6MwokW9gJARRAgMBAAECggEBAJZClOlEtZgqR6EdFFVSHe3tu/FXiNQt7Fq2cmlsBulPTR5Bb5318X/SXqHhf1Yzz6rGLvNl25kEmDbvjxgIK/76inZ8/Nm86tYVMYi8Y+y4OuRa1koZIteiGASDYg44qbuc4as7ThfIf01RTO5CB+IaPFcdEInxdHWZkQ35861gFHYCxlCR+9wWU782m7kv5MeTxP1nMmqdvQ0GF11w1o20kXEnYDM+FXWMGjfZHCZVR4txnTNRrLufjg+Ysj0tyg7mPYOwsWVl9xq8VHo0joBMcjtxb4dPnkgwxSSMZ2zztMACnh1zprxS1c6oxPRwLwGKpEi+h7rV3llrqstuah0CgYEA3xKx2ss74IzrzCIn8H3InvQerMkPtUjm8pLf1t5kwalRJA3ga6gkAHy4CUkMrhwB25HWg+cvJUnVYjn4p1sSCbdIDL6FJ/g5HC5Rgiihvju/0DEssw8ZBVrlhZhJAvtyVlquuIRq8/fFlla9Ao1V4pqZDkWcdoaPhfTYvQcuUCcCgYEAyMcIrSOYlZNO1jcg4eiuFMikNKkRYXoazzffegDJct9NO/6MB66JhczLRxxchlkNDL5b59zio8XUR0WUVWU/3O4XByE/8MoOYjZDruDSNPwRWAozb565AvP2q/Zwssg9vawsCE211xFMjzOC8bPQV981UtRSu3bMftV61QkaWscCgYAasT/68Eqv6ezlNkkVK9fvvUJWZpCsnpaT/CMwsNfZnIsLB2YNO8djD4luAwGza8KFJYRHsEgh7B3ObSVl0S3tX7MNY1bHm5op1xkFvBruinO/U8MHggz6aRAB1mEWLERYNO2nQqERpFpOTP686XCXduxNmuLIA/30h4HPzKYsDQKBgEqcPAsrKS6cWTWdsuiAcQBkNzEiisTwfTn4B2HtHO9FMAxVYXARWiWQnxHD5lY+jWzo6HpXSRmXEHWT07WQNJVDHOeXYY13aLTyeWBpR3RNH5zZ3ZdjIlmIk2f/4o1tgBQWAR7s0eAkG5EzkTuEmK2u0r//CueDFCcl6cl04ohNAoGAWOcJeyOS6WfgyATCkb6tpy3PoXLGAnwk9H2zHEpn81acXnCGoFcq4T0vKgITURFyhLAJOLstybPyA+nYApz4LZudrI//y7AdjZyoR0YbQyL2OGX4gSan4fEq+nBH6+6ZpwgngJ3ARhQJgsp//28DMquCpD4U+LIj3RvQ7DJ9NwU=", "json", "utf-8",
            "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlGA5YVaWhQ0k8iTes44uRl8s9s6KpO4cskZ8w6OkFS2NOrQNr07876pfjspaNofSzf5lKWHqTvv2XGCC/vfp0+3aIQgZrkU01GS8dGCgVKOezsGZXypmiwhPWrbjZc9jK/EIIe6F2BnCAYlZsik+Q+Mjh5ykOJcbI6Z37Rry0EaHCu2wyqbyl2bSS9KIBQ/NWqpdccmu7cGguBZfXk7dvpnkgTlgP2194I3qLhFv3qltcnkZUyU6goFN90AfDrzOvicIUsjQDtj6T/Zj03U37sA+BUZk4XwXcDrc6AD0887nUmAB5uMiH2pKxcFVVgveGAclZnvwTj7wVINSNrQZwwIDAQAB", "RSA2");
    //设置请求参数
    AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
    alipayRequest.setReturnUrl(AlipayConfig.return_url);
    alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

    //商户订单号，商户网站订单系统中唯一订单号，必填
    String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"), "UTF-8");
    //付款金额，必填
    String total_amount = new String(request.getParameter("WIDtotal_amount").getBytes("ISO-8859-1"), "UTF-8");
    //订单名称，必填
    String subject = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"), "UTF-8");
    //商品描述，可空
    String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"), "UTF-8");

    alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\","
            + "\"total_amount\":\"" + total_amount + "\","
            + "\"subject\":\"" + subject + "\","
            + "\"body\":\"" + body + "\","
            + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

    //若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
    //alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
    //		+ "\"total_amount\":\""+ total_amount +"\","
    //		+ "\"subject\":\""+ subject +"\","
    //		+ "\"body\":\""+ body +"\","
    //		+ "\"timeout_express\":\"10m\","
    //		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
    //请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节

    //请求
    String result = alipayClient.pageExecute(alipayRequest).getBody();

    //输出
    out.println(result);

%>
</body>
</html>
