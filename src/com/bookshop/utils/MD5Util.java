package com.bookshop.utils;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 * @ Author     : Rain
 * @ Classname  : MD5Util
 * @ Date       : 2019/5/21 11:19
 * @ Description: 广泛用于加密和解密技术，常用于文件校验。校验？不管文件多大，经过MD5后都能生成唯一的MD5值。
 * 好比现在的ISO校验，都是MD5校验。怎么用？当然是把ISO经过MD5后产生MD5的值。
 */




public class MD5Util {

/**
    MD5(Message Digest algorithm 5，信息摘要算法)
    通常我们不直接使用上述MD5加密。通常将MD5产生的字节数组交给BASE64再加密一把，得到相应的字符串
    Digest:汇编
*/
    public static final String KEY_MD5 = "MD5";

    public static String getResult(String inputStr) {
        System.out.println("=======加密前的数据:" + inputStr);
        BigInteger bigInteger = null;

        try {
            MessageDigest md = MessageDigest.getInstance(KEY_MD5);
            byte[] inputData = inputStr.getBytes();
            md.update(inputData);
            bigInteger = new BigInteger(md.digest());
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("MD5加密后:" + bigInteger.toString(16));
        System.out.println("MD5加密后:" + bigInteger.toString(32));
        System.out.println(bigInteger.toString(32).equals("2nhh2fb33b7fiua3kvlic2iqlr"));
        return bigInteger.toString(16);
    }

    public static void main(String args[]) {
        try {
            String inputStr = "简单加密8888888888888888888";
            getResult(inputStr);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}

