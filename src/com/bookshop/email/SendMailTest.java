package com.bookshop.email;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

/**
 * @ Author     : Rain
 * @ Classname  : SendMailTest
 * @ Date       : 2019/5/17 12:56
 * @ Description: 使用 JavaMail 发送简单的纯文本邮件
 */

public class SendMailTest {

    //发件人地址
//    public static String senderAddress = "rensiyu2340@163.com";
    public static String senderAddress = "hellobooks@foxmail.com";
    //收件人地址
    public static String recipientAddress = "761472239@qq.com";
    //发件人账户名
    public static String senderAccount = "hellobooks";
    //发件人账户密码(这个是授权码)
    public static String senderPassword = "ysfcefffpumxbded";


    public static void main(String[] args) throws Exception {
        //1、连接邮件服务器的参数配置
        Properties props = new Properties();
//        FileInputStream fileInputStream = new FileInputStream("web/WEB-INF/classes/com/bookshop/email/email.properties");
//        props.load(fileInputStream);
        //设置用户的认证方式
        props.setProperty("email.smtp.auth", "true");
        //设置传输协议
        props.setProperty("email.transport.protocol", "smtp");
        //设置发件人的SMTP服务器地址
        props.setProperty("email.smtp.host", "smtp.qq.com");


        //2、创建定义整个应用程序所需的环境信息的 Session 对象
        Session session = Session.getInstance(props);
        //设置调试信息在控制台打印出来
        session.setDebug(true);
        //3、创建邮件的实例对象
        Message msg = getMimeMessage(session);

        //4、根据session对象获取邮件传输对象Transport
        Transport transport = session.getTransport();
        //设置发件人的账户名和密码
        transport.connect(senderAccount, senderPassword);
        //发送邮件，并发送到所有收件人地址，message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人, 抄送人, 密送人
//        transport.sendMessage(msg, msg.getAllRecipients());

        //如果只想发送给指定的人，可以如下写法
        transport.sendMessage(msg, new Address[]{new InternetAddress(recipientAddress)});

        //5、关闭邮件连接
        transport.close();
    }

    /**
     * 获得创建一封邮件的实例对象
     *
     * @param session
     * @return
     * @throws MessagingException
     * @throws AddressException
     */
    public static MimeMessage getMimeMessage(Session session) throws Exception {
        //创建一封邮件的实例对象
        MimeMessage msg = new MimeMessage(session);
        //设置发件人地址
        msg.setFrom(new InternetAddress(senderAddress));
        /**
         * 设置收件人地址（可以增加多个收件人、抄送、密送），即下面这一行代码书写多行
         * MimeMessage.RecipientType.TO:发送
         * MimeMessage.RecipientType.CC：抄送
         * MimeMessage.RecipientType.BCC：密送
         */
//        msg.setRecipient(MimeMessage.RecipientType.CC,new InternetAddress(recipientAddress));
        //设置邮件主题
        msg.setSubject("bookshop 任先生", "UTF-8");

        //设置邮件正文
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
                "</html>", "text/html;charset=GBK");
        //设置邮件的发送时间,默认立即发送
        msg.saveChanges();
        msg.setSentDate(new Date());

        return msg;
    }
}
