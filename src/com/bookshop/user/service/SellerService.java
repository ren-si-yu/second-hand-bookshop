package com.bookshop.user.service;

import com.bookshop.user.entity.Seller;

/**
 * @ Author     : Rain
 * @ Classname  : SellerService
 * @ Date       : 2019/6/1 8:01
 * @ Description:
 */

public interface SellerService {
    Seller find(String email);
    Seller find(Seller seller);

    void save(Seller seller);

}
