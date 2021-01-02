package com.bookshop.user.service.impl;

import com.bookshop.user.dao.BuyDAO;
import com.bookshop.user.entity.Address;
import com.bookshop.user.entity.Order;
import com.bookshop.user.service.BuyService;

import java.util.List;

/**
 * @ Author     : Rain
 * @ Classname  : BuyServiceImpl
 * @ Date       : 2019/6/3 19:04
 * @ Description:
 */

public class BuyServiceImpl implements BuyService {

    private BuyDAO buyDAO;

    public void setBuyDAO(BuyDAO buyDAO) {
        this.buyDAO = buyDAO;
    }

    @Override
    public List<Address> searchAddress(String loginEmail) {
        return buyDAO.searchAddress(loginEmail);
    }

    @Override
    public void saveAddress(Address address) {
        buyDAO.saveAddress(address);
    }

    @Override
    public void updateAddress(Address address) {
        buyDAO.updateAddress(address);
    }

    @Override
    public void firstAddress(String id) {
        buyDAO.firstAddress(id);
    }

    @Override
    public void addOrder(Order order) {
        buyDAO.addOrder(order);
    }



    @Override
    public Address searchFirstAddress(String userEmail) {
        return buyDAO.searchFirstAddress(userEmail);
    }

    @Override
    public List<Order> searchOrder(String loginEmail) {
        return buyDAO.searchOrder(loginEmail);
    }

    @Override
    public void saveOrder(Order order) {
        buyDAO.saveOrder(order);
    }

    @Override
    public Order searchOrder(int bookId, int id, String sellerEmail) {
        return buyDAO.searchOrder(bookId,id,sellerEmail);
    }

    @Override
    public Order searchOrder(int id) {
        return buyDAO.searchOrder(id);
    }

    @Override
    public List<Order> searchOrderBySellerEmail(String email, int status) {
        return buyDAO.searchOrderBySellerEmail(email, status);
    }

    @Override
    public List<Order> searchOrder(int bookId, String loginEmail) {
        return buyDAO.searchOrder(bookId,loginEmail);
    }

}
