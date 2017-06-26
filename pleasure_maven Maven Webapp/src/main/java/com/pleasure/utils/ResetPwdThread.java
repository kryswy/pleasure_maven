package com.pleasure.utils;

import java.security.GeneralSecurityException;
import java.util.Properties;


import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



import com.pleasure.dto.User;
import com.sun.mail.util.MailSSLSocketFactory;


public class ResetPwdThread extends Thread {

    private User user = null;

    public ResetPwdThread(User user) {
        this.user = user;
    }

    @Override
    public void run() {

        // 跟smtp服务器建立一个连接
        Properties p = new Properties();
        // 设置邮件服务器主机名
        p.setProperty("mail.host", "smtp.qq.com");// 指定邮件服务器，默认端口 25
        // 发送服务器需要身份验证
        p.setProperty("mail.smtp.auth", "true");// 要采用指定用户名密码的方式去认证
        // 发送邮件协议名称
        p.setProperty("mail.transport.protocol", "smtp");

        // 开启SSL加密，否则会失败
        MailSSLSocketFactory sf = null;
        try {
            sf = new MailSSLSocketFactory();
        } catch (GeneralSecurityException e1) {
            e1.printStackTrace();
        }
        sf.setTrustAllHosts(true);
        p.put("mail.smtp.ssl.enable", "true");
        p.put("mail.smtp.ssl.socketFactory", sf);

        // 创建session
        Session session = Session.getDefaultInstance(p, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                PasswordAuthentication pa = new PasswordAuthentication(
                        "kryswy@vip.qq.com", "hssfbyvibcbybhde");
                return pa;
            }
        });


        try {
            // 声明一个Message对象(代表一封邮件),从session中创建
            MimeMessage msg = new MimeMessage(session);
            // 邮件信息封装
            // 1发件人
            msg.setFrom(new InternetAddress("kryswy@vip.qq.com"));
            // 2收件人
            msg.setRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));
            // 3邮件内容:主题、内容
            msg.setSubject(user.getUserName() + ",请查看您的验证码");

            StringBuilder sbd = new StringBuilder();
            sbd.append(user.getUserName() + "<br/>欢迎！您的验证码为：<br/>");
            //生成6位随机码
            String code=user.getPasswordCode();
            //userDao.ResetPwdCode(code);将6位密码放入数据库
            sbd.append("<h1>"+code+"</h1>");  
            sbd.append("这是一封自动发送的邮件；如果您并未要求但收到这封信件，您不需要进行任何操作。");

            msg.setContent(sbd.toString(), "text/html;charset=utf-8");// 发html格式的文本

            // 发送动作
            Transport.send(msg);

            System.out.println("给" + user.getEmail() + "发送邮件成功。");
        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}