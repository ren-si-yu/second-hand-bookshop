package com.bookshop.user.action;

import com.bookshop.user.service.UsersService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @ Author     : Rain
 * @ Classname  : AlterPwdAction
 * @ Date       : 2019/5/31 23:07
 * @ Description:
 */

public class AlterPwdAction extends ActionSupport {

    private String loginEmail;
    private String loginPwd;
    private String checkNumber;

    public String getCheckNumber() {
        return checkNumber;
    }

    public void setCheckNumber(String checkNumber) {
        this.checkNumber = checkNumber;
    }

    private UsersService usersService;


    public String getLoginEmail() {
        return loginEmail;
    }

    public void setLoginEmail(String loginEmail) {
        this.loginEmail = loginEmail;
    }

    public void setUsersService(UsersService usersService) {
        this.usersService = usersService;
    }

    public String getLoginPwd() {
        return loginPwd;
    }

    public void setLoginPwd(String loginPwd) {
        this.loginPwd = loginPwd;
    }

    public String checkout() {

        String number = (String) ActionContext.getContext().getSession().get("number");
        if (this.checkNumber.equals(number)){

            return "checkSuccess";
        }else {
            ActionContext.getContext().getSession().put("checkFailure","验证码错误");
            return "checkFailure";
        }
    }

    public String alterPwd() {
        usersService.alterPwd(loginEmail,loginPwd);
        return "alterSuccess";
    }
}
