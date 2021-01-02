package com.bookshop.user.entity;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @ Author     : Rain
 * @ Classname  : Order
 * @ Date       : 2019/6/3 15:41
 * @ Description:
 */

public class Order {

    private int id;
    private int bookId;

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    private String loginEmail;
    private int orderStatus;
    private String orderNumber;
    private Date payDate;
    private String bookName;
    private String sellerEmail;
    private String address;
    private int bookNum;
    private BigDecimal price;

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getBookNum() {
        return bookNum;
    }

    public void setBookNum(int bookNum) {
        this.bookNum = bookNum;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", loginEmail='" + loginEmail + '\'' +
                ", orderStatus=" + orderStatus +
                ", orderNumber='" + orderNumber + '\'' +
                ", payDate=" + payDate +
                ", bookName='" + bookName + '\'' +
                ", sellerEmail='" + sellerEmail + '\'' +
                ", address='" + address + '\'' +
                '}';
    }

    public Order(String loginEmail, int bookId,int bookNum,BigDecimal price, int orderStatus, String orderNumber, Date payDate, String bookName, String sellerEmail, String address) {
        this.bookId = bookId;
        this.price = price;
        this.loginEmail = loginEmail;
        this.orderStatus = orderStatus;
        this.orderNumber = orderNumber;
        this.payDate = payDate;
        this.bookName = bookName;
        this.sellerEmail = sellerEmail;
        this.address = address;
        this.bookNum = bookNum;
    }

    public Order() {
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLoginEmail() {
        return loginEmail;
    }

    public void setLoginEmail(String loginEmail) {
        this.loginEmail = loginEmail;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Date getPayDate() {
        return payDate;
    }

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getSellerEmail() {
        return sellerEmail;
    }

    public void setSellerEmail(String sellerEmail) {
        this.sellerEmail = sellerEmail;
    }

}
