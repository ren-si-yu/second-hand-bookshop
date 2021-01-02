package com.bookshop.user.service.impl;

import com.bookshop.user.dao.SellerDAO;
import com.bookshop.user.entity.Seller;
import com.bookshop.user.service.SellerService;

/**
 * @ Author     : Rain
 * @ Classname  : SellerServiceImpl
 * @ Date       : 2019/6/1 8:02
 * @ Description:
 */

public class SellerServiceImpl implements SellerService {
    private SellerDAO sellerDAO;

    public void setSellerDAO(SellerDAO sellerDAO) {
        this.sellerDAO = sellerDAO;
    }

    @Override
    public Seller find(String email) {
        return sellerDAO.find(email);
    }

    @Override
    public Seller find(Seller seller) {
        return sellerDAO.find(seller);
    }

    @Override
    public void save(Seller seller) {
        sellerDAO.save(seller);
    }
}
