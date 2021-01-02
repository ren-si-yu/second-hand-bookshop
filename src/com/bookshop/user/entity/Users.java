package com.bookshop.user.entity;

import java.math.BigDecimal;

/**
 * @ Author     : Rain
 * @ Classname  : Users
 * @ Date       : 2019/5/29 9:17
 * @ Description:
 */

public class Users {
    private int userId;
    private String loginEmail;
    private String loginPwd;
    private String createTime;
    private String userName;

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    private BigDecimal money;

    /*@Override
    public String toString() {
        return "Users{" +
                "loginEmail='" + loginEmail + '\'' +
                ", loginPwd='" + loginPwd + '\'' +
                '}';
    }*/

    private String userPhoto;
    private String userPhone;
    private String CDKEY;
    private int status;


    public Users() {
    }

    public Users(String loginEmail, String loginPwd) {
        this.loginEmail = loginEmail;
        this.loginPwd = loginPwd;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCDKEY() {
        return CDKEY;
    }

    public void setCDKEY(String CDKEY) {
        this.CDKEY = CDKEY;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getLoginEmail() {
        return loginEmail;
    }

    public void setLoginEmail(String loginEmail) {
        this.loginEmail = loginEmail;
    }

    public String getLoginPwd() {
        return loginPwd;
    }

    public void setLoginPwd(String loginPwd) {
        this.loginPwd = loginPwd;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPhoto() {
        return userPhoto;
    }

    public void setUserPhoto(String userPhoto) {
        this.userPhoto = userPhoto;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

}
