package com.bookshop.admin.entity;

import com.bookshop.user.entity.Seller;

/**
 * @ Author     : Rain
 * @ Classname  : Seller
 * @ Date       : 2019/5/31 9:33
 * @ Description:
 */

public class SellerTemp {

    /*        <th>邮箱</th>
        <th>昵称</th>
        <th>书架名称</th>
        <th>已售图书</th>
        <th>在售图书</th>
        <th>当月销量</th>*/
    private Seller seller;
    private Long sold;
    private Long onSale;

    public Seller getSeller() {
        return seller;
    }

    public void setSeller(Seller seller) {
        this.seller = seller;
    }

    public Long getSold() {
        return sold;
    }

    public void setSold(Long sold) {
        this.sold = sold;
    }

    public Long getOnSale() {
        return onSale;
    }

    public void setOnSale(Long onSale) {
        this.onSale = onSale;
    }
}
