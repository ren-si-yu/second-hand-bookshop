package com.bookshop.user.dao;

import com.bookshop.user.entity.Address;
import com.bookshop.user.entity.Order;

import java.util.List;

/**
 * @ Author     : Rain
 * @ Classname  : BuyDAO
 * @ Date       : 2019/6/3 19:03
 * @ Description:
 */

public interface BuyDAO {
    List<Address> searchAddress(String loginEmail);

    void saveAddress(Address address);

    void updateAddress(Address address);

    void firstAddress(String id);

    void addOrder(Order order);

    Order searchOrder(int bookId,int id, String sellerEmail);

    Address searchFirstAddress(String userEmail);

    List<Order> searchOrder(String loginEmail);

    void saveOrder(Order order);

    Order searchOrder(int id);

    List<Order>

    searchOrderBySellerEmail(String email, int status);

    List<Order> searchOrder(int bookId, String loginEmail);
}
