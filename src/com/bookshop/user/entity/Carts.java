package com.bookshop.user.entity;

import java.math.BigDecimal;

public class Carts {
    private int cartId;

    @Override
    public String toString() {
        return "Carts{" +
                "cartId=" + cartId +
                ", loginEmail='" + loginEmail + '\'' +
                ", bookName='" + bookName + '\'' +
                ", bookImg='" + bookImg + '\'' +
                ", currentPrice=" + currentPrice +
                ", sellerEmail='" + sellerEmail + '\'' +
                ", bookNum=" + number +
                '}';
    }

    public Carts(String loginEmail, String bookName, String bookImg, BigDecimal currentPrice, String sellerEmail, int bookNum) {
        this.loginEmail = loginEmail;
        this.bookName = bookName;
        this.bookImg = bookImg;
        this.currentPrice = currentPrice;
        this.sellerEmail = sellerEmail;
        this.number = bookNum;
    }

    public Carts() {
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    private String loginEmail;


    private String bookName;


    private String bookImg;


    private BigDecimal currentPrice;


    private String sellerEmail;




    private int number;


    public String getLoginEmail() {
        return this.loginEmail;
    }


    public void setLoginEmail(String loginEmail) {
        this.loginEmail = loginEmail;
    }

    public String getBookName() {
        return this.bookName;
    }


    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookImg() {
        return this.bookImg;
    }


    public void setBookImg(String bookImg) {
        this.bookImg = bookImg;
    }

    public BigDecimal getCurrentPrice() {
        return currentPrice;
    }

    public void setCurrentPrice(BigDecimal currentPrice) {
        this.currentPrice = currentPrice;
    }

    public String getSellerEmail() {
        return sellerEmail;
    }

    public void setSellerEmail(String sellerEmail) {
        this.sellerEmail = sellerEmail;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }
}