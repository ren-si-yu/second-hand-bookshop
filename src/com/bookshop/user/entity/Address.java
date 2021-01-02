package com.bookshop.user.entity;

/**
 * @ Author     : Rain
 * @ Classname  : Address
 * @ Date       : 2019/6/3 18:56
 * @ Description:
 */

public class Address {

    private int id;
    private int zipCode;
    private String loginEmail;
    private String userName;
    private String userAddress;
    private String userPhone;
    private int first;

    public int getFirst() {
        return first;
    }

    public void setFirst(int first) {
        this.first = first;
    }

    @Override
    public String toString() {
        return "Address{" +
                "id=" + id +
                ", zipCode=" + zipCode +
                ", loginEmail='" + loginEmail + '\'' +
                ", userName='" + userName + '\'' +
                ", userAddress='" + userAddress + '\'' +
                ", userPhone='" + userPhone + '\'' +
                ", first=" + first +
                '}';
    }

    public int getZipCode() {
        return zipCode;
    }

    public void setZipCode(int zipCode) {
        this.zipCode = zipCode;
    }

    public String getLoginEmail() {
        return loginEmail;
    }

    public void setLoginEmail(String loginEmail) {
        this.loginEmail = loginEmail;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
