package com.bookshop.alipay.config;

public class AlipayConfig {
    // 商户appid
    public static String APPID = "2016092900624574";
    // 私钥 pkcs8格式的
    public static String RSA_PRIVATE_KEY = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCu9AoKpBBN753inP+iJ/l8v7Pg43PFZXdnmJ4E7qHa/1oALzfOpqGs7Gd63jex5VRIq07nRoqTemsR11uvBZ33ScprMllmsOEEqXYQdr7MdPUqHBw9Lb6loz56832fLtKbQeT5wDInCzKmzOvTu6R0wDJKRvVLNAAfgBnLe57wqiBZSnLYSUgmNxhQ2EKbIRC+dc+QOsRLXV9wFMpdE/HAZbhNs7P3M1CzFPds9AbzZwNZv6zCGqeK+1TMnz9Me+dnczpJhhLllDDh6tMTQRihVUl4FjzMNQQQVAm9fLS6ozzO+AjZhbP9cHv9B16Eh8T4Jr1HoONN6MwokW9gJARRAgMBAAECggEBAJZClOlEtZgqR6EdFFVSHe3tu/FXiNQt7Fq2cmlsBulPTR5Bb5318X/SXqHhf1Yzz6rGLvNl25kEmDbvjxgIK/76inZ8/Nm86tYVMYi8Y+y4OuRa1koZIteiGASDYg44qbuc4as7ThfIf01RTO5CB+IaPFcdEInxdHWZkQ35861gFHYCxlCR+9wWU782m7kv5MeTxP1nMmqdvQ0GF11w1o20kXEnYDM+FXWMGjfZHCZVR4txnTNRrLufjg+Ysj0tyg7mPYOwsWVl9xq8VHo0joBMcjtxb4dPnkgwxSSMZ2zztMACnh1zprxS1c6oxPRwLwGKpEi+h7rV3llrqstuah0CgYEA3xKx2ss74IzrzCIn8H3InvQerMkPtUjm8pLf1t5kwalRJA3ga6gkAHy4CUkMrhwB25HWg+cvJUnVYjn4p1sSCbdIDL6FJ/g5HC5Rgiihvju/0DEssw8ZBVrlhZhJAvtyVlquuIRq8/fFlla9Ao1V4pqZDkWcdoaPhfTYvQcuUCcCgYEAyMcIrSOYlZNO1jcg4eiuFMikNKkRYXoazzffegDJct9NO/6MB66JhczLRxxchlkNDL5b59zio8XUR0WUVWU/3O4XByE/8MoOYjZDruDSNPwRWAozb565AvP2q/Zwssg9vawsCE211xFMjzOC8bPQV981UtRSu3bMftV61QkaWscCgYAasT/68Eqv6ezlNkkVK9fvvUJWZpCsnpaT/CMwsNfZnIsLB2YNO8djD4luAwGza8KFJYRHsEgh7B3ObSVl0S3tX7MNY1bHm5op1xkFvBruinO/U8MHggz6aRAB1mEWLERYNO2nQqERpFpOTP686XCXduxNmuLIA/30h4HPzKYsDQKBgEqcPAsrKS6cWTWdsuiAcQBkNzEiisTwfTn4B2HtHO9FMAxVYXARWiWQnxHD5lY+jWzo6HpXSRmXEHWT07WQNJVDHOeXYY13aLTyeWBpR3RNH5zZ3ZdjIlmIk2f/4o1tgBQWAR7s0eAkG5EzkTuEmK2u0r//CueDFCcl6cl04ohNAoGAWOcJeyOS6WfgyATCkb6tpy3PoXLGAnwk9H2zHEpn81acXnCGoFcq4T0vKgITURFyhLAJOLstybPyA+nYApz4LZudrI//y7AdjZyoR0YbQyL2OGX4gSan4fEq+nBH6+6ZpwgngJ3ARhQJgsp//28DMquCpD4U+LIj3RvQ7DJ9NwU=";
    // 服务器异步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/second_hand_bookshop_war_exploded/alipay/notify_url.jsp";
    // 页面跳转同步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问 商户可以自定义同步跳转地址
    public static String return_url = "http://localhost:8080/second_hand_bookshop_war_exploded/alipay/return_url.jsp";
    // 请求网关地址
    public static String URL = "https://openapi.alipaydev.com/gateway.do?charset=utf-8";
    // 编码
    public static String CHARSET = "UTF-8";
    // 返回格式
    public static String FORMAT = "json";
    // 支付宝公钥
    public static String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlGA5YVaWhQ0k8iTes44uRl8s9s6KpO4cskZ8w6OkFS2NOrQNr07876pfjspaNofSzf5lKWHqTvv2XGCC/vfp0+3aIQgZrkU01GS8dGCgVKOezsGZXypmiwhPWrbjZc9jK/EIIe6F2BnCAYlZsik+Q+Mjh5ykOJcbI6Z37Rry0EaHCu2wyqbyl2bSS9KIBQ/NWqpdccmu7cGguBZfXk7dvpnkgTlgP2194I3qLhFv3qltcnkZUyU6goFN90AfDrzOvicIUsjQDtj6T/Zj03U37sA+BUZk4XwXcDrc6AD0887nUmAB5uMiH2pKxcFVVgveGAclZnvwTj7wVINSNrQZwwIDAQAB";
    // 日志记录目录
    public static String log_path = "C:\\";
    // RSA2
    public static String SIGNTYPE = "RSA2";


}

/*http://localhost:8080/second_hand_bookshop_war_exploded/alipay/return_url.jsp?charset=UTF-8&out_trade_no=20196303118982&method=alipay.trade.page.pay.return&total_amount=0.01&sign=U0QFoJnmpJ2loccW9Fi8jbkZmjh4UqpCJ0NUMWgwvOnelXP6G1lCE2WlbWo9aSGRuFWhILJ5tTr4uD2gwkzsR7QXVle%2B7j3H34x3HKBV9FKw5tHYlkPXWWZyMKSWeP9JR1X0Ck0fD%2FpDSPmlJEXgKnmBEiD8YJaDCvrrEIaAYMOJ7JZ5%2Fo26qLvVkBQn5rxQXuSfCDqW4gpOJ60rnN22WIgOM0TICMCQMBuOIkRIKn3YNXlqM%2F2oMtFoc7EA6IZYV9AnqdSrV5pvx3mQurOTGPFoZn%2FSRZik2j3EQpLbSzFtup2hctzunIeRbhg%2BAcG4U3BjUPg97ZFuNq8lC96k6Q%3D%3D&trade_no=2019060322001473331000046712&auth_app_id=2016092900624574&version=1.0&app_id=2016092900624574&sign_type=RSA2&seller_id=2088102177818991&timestamp=2019-06-03+00%3A31%3A58*/
