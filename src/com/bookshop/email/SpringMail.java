/*
package com.bookshop.email;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.Properties;

*/
/**
 * @ Author     : Rain
 * @ Classname  : EmailUtil
 * @ Date       : 2019/5/21 23:17
 * @ Description:
 *//*


public class EmailUtil {


    private static Transport transport;
    private static Message msg;
    private static Properties props;

    static {
        //1、连接邮件服务器的参数配置
        props = new Properties();
        FileInputStream fileInputStream = null;
        */
/**
         * 首先要获取真是路径
         * 方法一
         *//*

//        System.out.println(ServletActionContext.getServletContext().getRealPath("email.properties"));
//        InputStream in = ServletActionContext.getServletContext().getClassLoader()
//                .getResourceAsStream("com/bookshop/email/email.properties");
        */
/**
         * 方法二
         *//*


        InputStream in = EmailUtil.class.getClassLoader().getResourceAsStream("com/bookshop/email/email.properties");
        */
/**
         * 错误用法
         *//*

//            File file = new File("com/bookshop/email/email.properties");
//            System.out.println(file.getName());
//            fileInputStream = new FileInputStream(file);

        try {
            props.load(in);
        } catch (IOException e) {
            e.printStackTrace();
        }


        //2、创建定义整个应用程序所需的环境信息的 Session 对象
        Session session = Session.getInstance(props);
        //设置调试信息在控制台打印出来
        session.setDebug(true);
        //3、创建邮件的实例对象
        try {
            msg = getMimeMessage(session);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //4、根据session对象获取邮件传输对象Transport
        try {
            transport = session.getTransport();
        } catch (NoSuchProviderException e) {
            e.printStackTrace();
        }
        //设置发件人的账户名和密码
        try {
            transport.connect(props.getProperty("senderAccount"), props.getProperty("senderPassword"));
        } catch (MessagingException e) {
            e.printStackTrace();
        }


    }

    */
/**
     * 获得创建一封邮件的实例对象
     *
     * @param session
     * @return
     * @throws MessagingException
     * @throws AddressException
     *//*


    public static MimeMessage getMimeMessage(Session session) throws Exception {
        //创建一封邮件的实例对象
        MimeMessage msg = new MimeMessage(session);
        //设置发件人地址
        msg.setFrom(new InternetAddress(props.getProperty("senderAddress")));
        */
/**
         * 设置收件人地址（可以增加多个收件人、抄送、密送），即下面这一行代码书写多行
         * MimeMessage.RecipientType.TO:发送
         * MimeMessage.RecipientType.CC：抄送
         * MimeMessage.RecipientType.BCC：密送
         *//*

        msg.setRecipient(MimeMessage.RecipientType.CC, new InternetAddress(props.getProperty("recipientAddress")));
        //设置邮件主题
        msg.setSubject("bookshop 验证码", "UTF-8");


        //设置邮件的发送时间,默认立即发送
        msg.saveChanges();
        msg.setSentDate(new Date());

        return msg;
    }


    public static void sendMessage() {
        //如果只想发送给指定的人，可以如下写法
        try {
            transport.sendMessage(msg, new Address[]{new InternetAddress(props.getProperty("recipientAddress"))});
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        //5、关闭邮件连接
        try {
            transport.close();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public static void sendMessage(String email) {
        //如果只想发送给指定的人，可以如下写法

        //设置邮件正文
        try {
            msg.setContent("<html>\n" +
                    "<head>\n" +
                    "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>\n" +
                    "    <title></title>\n" +
                    "    <meta charset=\"utf-8\"/>\n" +
                    "\n" +
                    "</head>\n" +
                    "<body>\n" +
                    "<div class=\"qmbox qm_con_body_content qqmail_webmail_only\" id=\"mailContentContainer\" style=\"\">\n" +
                    "    <style type=\"text/css\">\n" +
                    "        .qmbox body {\n" +
                    "            margin: 0;\n" +
                    "            padding: 0;\n" +
                    "            background: #fff;\n" +
                    "            font-family: \"Verdana, Arial, Helvetica, sans-serif\";\n" +
                    "            font-size: 12px;\n" +
                    "            line-height: 24px;\n" +
                    "        }\n" +
                    "\n" +
                    "        .qmbox div, .qmbox p, .qmbox span, .qmbox img {\n" +
                    "            margin: 0;\n" +
                    "            padding: 0;\n" +
                    "        }\n" +
                    "\n" +
                    "        .qmbox img {\n" +
                    "            border: none;\n" +
                    "        }\n" +
                    "\n" +
                    "        .qmbox .contaner {\n" +
                    "            margin: 0 auto;\n" +
                    "        }\n" +
                    "\n" +
                    "        .qmbox .title {\n" +
                    "            margin: 0 auto;\n" +
                    "            background: url(timg.jpg) #CCC repeat-x;\n" +
                    "            height: 30px;\n" +
                    "            text-align: center;\n" +
                    "            font-weight: bold;\n" +
                    "            padding-top: 12px;\n" +
                    "            font-size: 12px;\n" +
                    "        }\n" +
                    "\n" +
                    "        .qmbox .content {\n" +
                    "            margin: 4px;\n" +
                    "        }\n" +
                    "\n" +
                    "        .qmbox .biaoti {\n" +
                    "            padding: 6px;\n" +
                    "            color: #000;\n" +
                    "        }\n" +
                    "\n" +
                    "        .qmbox .xtop, .qmbox .xbottom {\n" +
                    "            display: block;\n" +
                    "            font-size: 1px;\n" +
                    "        }\n" +
                    "\n" +
                    "        .qmbox .xb1, .qmbox .xb2, .qmbox .xb3, .qmbox .xb4 {\n" +
                    "            display: block;\n" +
                    "            overflow: hidden;\n" +
                    "        }\n" +
                    "\n" +
                    "        .qmbox .xb1, .qmbox .xb2, .qmbox .xb3 {\n" +
                    "            height: 1px;\n" +
                    "        }\n" +
                    "\n" +
                    "        .qmbox .xb2, .qmbox .xb3, .qmbox .xb4 {\n" +
                    "            border-left: 1px solid #BCBCBC;\n" +
                    "            border-right: 1px solid #BCBCBC;\n" +
                    "        }\n" +
                    "\n" +
                    "        .qmbox .xb1 {\n" +
                    "            margin: 0 5px;\n" +
                    "            background: #BCBCBC;\n" +
                    "        }\n" +
                    "\n" +
                    "        .qmbox .xb2 {\n" +
                    "            margin: 0 3px;\n" +
                    "            border-width: 0 2px;\n" +
                    "        }\n" +
                    "\n" +
                    "        .qmbox .xb3 {\n" +
                    "            margin: 0 2px;\n" +
                    "        }\n" +
                    "\n" +
                    "        .qmbox .xb4 {\n" +
                    "            height: 2px;\n" +
                    "            margin: 0 1px;\n" +
                    "        }\n" +
                    "\n" +
                    "        .qmbox .xboxcontent {\n" +
                    "            display: block;\n" +
                    "            border: 0 solid #BCBCBC;\n" +
                    "            border-width: 0 1px;\n" +
                    "        }\n" +
                    "\n" +
                    "        .qmbox .line {\n" +
                    "            margin-top: 6px;\n" +
                    "            border-top: 1px dashed #B9B9B9;\n" +
                    "            padding: 4px;\n" +
                    "        }\n" +
                    "\n" +
                    "        .qmbox .neirong {\n" +
                    "            padding: 6px;\n" +
                    "            color: #666666;\n" +
                    "        }\n" +
                    "\n" +
                    "        .qmbox .foot {\n" +
                    "            padding: 6px;\n" +
                    "            color: #777;\n" +
                    "        }\n" +
                    "\n" +
                    "        .qmbox .font_darkblue {\n" +
                    "            color: #006699;\n" +
                    "            font-weight: bold;\n" +
                    "        }\n" +
                    "\n" +
                    "        .qmbox .font_lightblue {\n" +
                    "            color: #008BD1;\n" +
                    "            font-weight: bold;\n" +
                    "        }\n" +
                    "\n" +
                    "        .qmbox .font_gray {\n" +
                    "            color: #888;\n" +
                    "            font-size: 12px;\n" +
                    "        }\n" +
                    "    </style>\n" +
                    "    <div class=\"contaner\">\n" +
                    "\n" +
                    "        <center>\n" +
                    "            <div class=\"content\">\n" +
                    "                <p class=\"biaoti\"><b>亲爱的用户，你好！</b></p><br>\n" +
                    "                <b class=\"xtop\"><b class=\"xb1\"></b><b class=\"xb2\"></b><b class=\"xb3\"></b><b class=\"xb4\"></b></b>\n" +
                    "                <div class=\"xboxcontent\">\n" +
                    "                    <div class=\"neirong\">\n" +
                    "                        <p>我们收到了一项请求，要求通过您的电子邮件为您注册账号<br>请核对你的邮箱：<span id=\"userName\"\n" +
                    "                                                                       class=\"font_darkblue\">761472239@qq.com</span></p>\n" +
                    "                        <br>\n" +
                    "                        <p><b>您的验证码为：</b><br>\n" +
                    "                        <center>\n" +
                    "                    <span class=\"font_lightblue\">\n" +
                    "                        <span id=\"yzm\" data=\"$(captcha)\" onclick=\"return false;\" t=\"7\"\n" +
                    "                              style=\"font-size: 30px;border-bottom: 1px dashed rgb(204, 204, 204); z-index: 1; position: static;\">459685</span>\n" +
                    "                    </span><br>\n" +
                    "                        </center>\n" +
                    "                        <span class=\"font_gray\">(请输入该验证码完成注册，验证码30分钟内有效！)</span><br><br>\n" +
                    "                        </p>\n" +
                    "                        <div class=\"line\"><br><br>如果您并未请求此验证码，则可能是他人正在使用您的邮箱：761472239@qq.com。<b>请勿将此验证码转发给或提供给任何人。</b>\n" +
                    "                        </div>\n" +
                    "                    </div>\n" +
                    "                </div>\n" +
                    "                <b class=\"xbottom\"><b class=\"xb4\"></b><b class=\"xb3\"></b><b class=\"xb2\"></b><b class=\"xb1\"></b></b>\n" +
                    "                <p class=\"foot\"> <br><span data=\"800-820-5100\" onclick=\"return false;\" t=\"7\"\n" +
                    "                                                             style=\"border-bottom: 1px dashed rgb(204, 204, 204); z-index: 1; position: static;\">红雨小组敬上\n" +
                    "</span></p>\n" +
                    "            </div>\n" +
                    "        </center>\n" +
                    "    </div>\n" +
                    "    <style type=\"text/css\">\n" +
                    "        .qmbox style, .qmbox script, .qmbox head, .qmbox link, .qmbox meta {\n" +
                    "            display: none !important;\n" +
                    "        }\n" +
                    "    </style>\n" +
                    "</div>\n" +
                    "</body>\n" +
                    "</html>", "text/html;charset=UTF-8");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        try {
            transport.sendMessage(msg, new Address[]{new InternetAddress(email)});
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        //5、关闭邮件连接
        try {
            transport.close();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public static void sendMessages() {
        //发送邮件，并发送到所有收件人地址，message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人, 抄送人, 密送人
        try {
            transport.sendMessage(msg, msg.getAllRecipients());
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        //5、关闭邮件连接
        try {
            transport.close();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }


}
*/
