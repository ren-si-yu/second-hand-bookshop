package com.bookshop.admin.dao;

import com.bookshop.admin.entity.Admin;
import com.bookshop.admin.entity.SellerTemp;
import com.bookshop.user.entity.*;

import java.util.List;

/**
 * @ Author     : Rain
 * @ Classname  : AdminDAO
 * @ Date       : 2019/6/5 16:00
 * @ Description:
 */

public interface AdminDAO {
    boolean checkLogin(Admin admin);

    List<Users> findAllUser();

    List<SellerTemp> findAllSeller();

    List<Books> findAllBook();

    List<Withdraw> findCashOut();

    List<Order> findOrder(int status);

    void setStatus(int userId, int status);

    void sureWithdraw(int id);
}
