package com.bookshop.admin.service;

import com.bookshop.admin.entity.Admin;
import com.bookshop.admin.entity.SellerTemp;
import com.bookshop.user.entity.*;

import java.util.List;

/**
 * @ Author     : Rain
 * @ Classname  : AdminService
 * @ Date       : 2019/6/5 16:01
 * @ Description:
 */

public interface AdminService {
    boolean checkLogin(Admin admin);

    List<Users> findAllUser();

    List<SellerTemp> findAllSeller();

    List<Books> findAllBook();

    List<Withdraw> findCashOut();

    List<Order> findOrder(int status);

    void setStatus(int userId, int status);

    void sureWithdraw(int id);
}
