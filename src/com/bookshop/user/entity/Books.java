package com.bookshop.user.entity;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @ Author     : Rain
 * @ Classname  : Books
 * @ Date       : 2019/6/1 7:33
 * @ Description:
 */

public class Books {


    private Integer id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    private Integer bookId;

    private String bookName;
    private String bookImg;

    private BigDecimal marketPrice;

    private BigDecimal currentPrice;
    private Integer bookStock;

    private Integer status;

    private String bookDesc;

    private Date createTime;

    private String bookshelfAddress;

    private String typeNo1;

    private String publishDate;

    private String author;
    private Integer page;
    private String isbn;

    private String bookPress;

    private String sellerEmail;

    public String getSellerEmail() {
        return sellerEmail;
    }

    public void setSellerEmail(String sellerEmail) {
        this.sellerEmail = sellerEmail;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookImg() {
        return bookImg;
    }

    public void setBookImg(String bookImg) {
        this.bookImg = bookImg;
    }

    public BigDecimal getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(BigDecimal marketPrice) {
        this.marketPrice = marketPrice;
    }

    public BigDecimal getCurrentPrice() {
        return currentPrice;
    }

    public void setCurrentPrice(BigDecimal currentPrice) {
        this.currentPrice = currentPrice;
    }

    public Integer getBookStock() {
        return bookStock;
    }

    public void setBookStock(Integer bookStock) {
        this.bookStock = bookStock;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getBookDesc() {
        return bookDesc;
    }

    public void setBookDesc(String bookDesc) {
        this.bookDesc = bookDesc;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getBookshelfAddress() {
        return bookshelfAddress;
    }

    public void setBookshelfAddress(String bookshelfAddress) {
        this.bookshelfAddress = bookshelfAddress;
    }

    public String getTypeNo1() {
        return typeNo1;
    }

    public void setTypeNo1(String typeNo1) {
        this.typeNo1 = typeNo1;
    }

    public String getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getBookPress() {
        return bookPress;
    }

    public void setBookPress(String bookPress) {
        this.bookPress = bookPress;
    }



    @Override
    public String toString() {
        return "Books{" +
                ", bookId=" + bookId +
                ", bookName='" + bookName + '\'' +
                ", bookImg='" + bookImg + '\'' +
                ", marketPrice=" + marketPrice +
                ", currentPrice=" + currentPrice +
                ", bookStock=" + bookStock +
                ", isSale=" + status +
                ", bookDesc='" + bookDesc + '\'' +
                ", createTime=" + createTime +
                ", bookshelfAddress='" + bookshelfAddress + '\'' +
                ", typeNo1='" + typeNo1 + '\'' +
                ", publishDate='" + publishDate + '\'' +
                ", author='" + author + '\'' +
                ", page=" + page +
                ", isbn=" + isbn +
                ", bookPress='" + bookPress + '\'' +
                ", sellerEmail='" + sellerEmail + '\'' +
                '}';
    }
}
