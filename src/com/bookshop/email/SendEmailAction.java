package com.bookshop.email;

import com.bookshop.user.entity.Users;
import com.bookshop.user.service.UsersService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Validateable;
import org.apache.struts2.ServletActionContext;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * @ Author     : Rain
 * @ Classname  : SendEmailAction
 * @ Date       : 2019/5/29 14:34
 * @ Description:
 */

public class SendEmailAction extends ActionSupport implements Validateable {

    private String email;
    private String number;
    private UsersService usersService;

    public void setUsersService(UsersService usersService) {
        this.usersService = usersService;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public String ToFindPwd() {

        System.out.println("发送到找回密码" + email);

        int num = usersService.findByEmailExist(email);
        if (num == 0) {
            ActionContext.getContext().getSession().put("emailExistError", "该邮箱不存在或未注册");
            return "emailNotExist";
        } else {
            this.number = GetBindNum();
            ActionContext.getContext().getSession().put("number", this.number);
            try {
                new EmailUtil().sendMessage(email, this.number);
            } catch (Exception e) {
                e.printStackTrace();
                ActionContext.getContext().getSession().put("emailSendError", "发送邮件失败");
                return "sendToFindPwdFailure";
            }
            return "sendToFindPwdSuccess";
        }

    }

    public String ToRegister() throws Exception {
        System.out.println(email);
        this.number = GetBindNum();

        Users user = usersService.findUserByEmail(email);
//        int num = usersService.findByEmailExist(email);
        if (user.getStatus() == 0) {
            try {
                new EmailUtil().sendMessage(email, this.number);

                user.setLoginEmail(email);
                user.setCDKEY(number);
                user.setStatus(0);
                user.setLoginPwd("wuxiao");
                usersService.save(user);
                //让sendEmail方法抛出异常
                ActionContext.getContext().getSession().put("emailError", "发送异常，请稍后发送...");

            } catch (Exception e) {
                e.printStackTrace();
                return "sendEmailToRegisterFailure";
            }
        } else if (user.getStatus() == 1) {
//            ActionContext.getContext().getSession().put("emailError", "该邮箱已注册");
            System.out.println("该邮箱已注册");

            //这段必须在下面
            ServletActionContext.getResponse().setStatus(333);

        }

        return SUCCESS;
    }

    private String GetBindNum() {

        String[] beforeShuffle = new String[]{"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
                "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i",
                "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
        List list = Arrays.asList(beforeShuffle);
        Collections.shuffle(list);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < list.size(); i++) {
            sb.append(list.get(i));
        }
        String afterShuffle = sb.toString();
        String result = afterShuffle.substring(3, 9);
        return result;
    }
}
