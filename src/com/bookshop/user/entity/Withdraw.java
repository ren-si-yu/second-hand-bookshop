package com.bookshop.user.entity;

import java.math.BigDecimal;

/**
 * @ Author     : Rain
 * @ Classname  : Withdraw
 * @ Date       : 2019/6/3 15:20
 * @ Description:
 */

public class Withdraw {
    private int id;
    private int withdrawId;
    private String sellerEmail;
    private String alipayNum;
    private String creatTime;
    private BigDecimal withdrawMoney;
    private int withdrawStatus;

    public int getWithdrawStatus() {
        return withdrawStatus;
    }

    public void setWithdrawStatus(int withdrawStatus) {
        this.withdrawStatus = withdrawStatus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getWithdrawId() {
        return withdrawId;
    }

    public void setWithdrawId(int withdrawId) {
        this.withdrawId = withdrawId;
    }

    public String getSellerEmail() {
        return sellerEmail;
    }

    public void setSellerEmail(String sellerEmail) {
        this.sellerEmail = sellerEmail;
    }

    public String getAlipayNum() {
        return alipayNum;
    }

    public void setAlipayNum(String alipayNum) {
        this.alipayNum = alipayNum;
    }

    public String getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(String creatTime) {
        this.creatTime = creatTime;
    }

    public BigDecimal getWithdrawMoney() {
        return withdrawMoney;
    }

    public void setWithdrawMoney(BigDecimal withdrawMoney) {
        this.withdrawMoney = withdrawMoney;
    }
}
