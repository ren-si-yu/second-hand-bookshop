package com.bookshop.user.dao;

import com.bookshop.user.entity.Seller;

/**
 * @ Author     : Rain
 * @ Classname  : SellerDAO
 * @ Date       : 2019/6/1 7:59
 * @ Description:
 */

public interface SellerDAO {
    Seller find(String email);
    Seller find(Seller seller);

    void save(Seller seller);
}
