package com.bookshop.user.entity;

/**
 * @ Author     : Rain
 * @ Classname  : Seller
 * @ Date       : 2019/5/31 9:33
 * @ Description:
 */

public class Seller {

    private int sellerId;
    private String bookshelfName;
    private String bookshelfAddress;
    private String sellerIdPhone;

    public String getSellerIdPhone() {
        return sellerIdPhone;
    }

    public void setSellerIdPhone(String sellerIdPhone) {
        this.sellerIdPhone = sellerIdPhone;
    }

    public String getAlipayNum() {
        return alipayNum;
    }

    public void setAlipayNum(String alipayNum) {
        this.alipayNum = alipayNum;
    }

    private String alipayNum;
    private String loginEmail;


    public int getSellerId() {
        return sellerId;
    }

    public void setSellerId(int sellerId) {
        this.sellerId = sellerId;
    }


    public String getBookshelfName() {
        return bookshelfName;
    }

    public void setBookshelfName(String bookshelfName) {
        this.bookshelfName = bookshelfName;
    }

    public String getBookshelfAddress() {
        return bookshelfAddress;
    }

    public void setBookshelfAddress(String bookshelfAddress) {
        this.bookshelfAddress = bookshelfAddress;
    }


    public String getLoginEmail() {
        return loginEmail;
    }

    public void setLoginEmail(String loginEmail) {
        this.loginEmail = loginEmail;
    }


    @Override
    public String toString() {
        return "Seller{" +
                "bookshelfName='" + bookshelfName + '\'' +
                ", bookshelfAddress='" + bookshelfAddress + '\'' +
                ", sellerIdPhone=" + sellerIdPhone +
                ", alipayNum=" + alipayNum +
                ", loginEmail='" + loginEmail + '\'' +
                '}';
    }

}
