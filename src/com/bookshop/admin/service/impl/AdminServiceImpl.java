package com.bookshop.admin.service.impl;

import com.bookshop.admin.dao.AdminDAO;
import com.bookshop.admin.entity.Admin;
import com.bookshop.admin.entity.SellerTemp;
import com.bookshop.admin.service.AdminService;
import com.bookshop.user.entity.*;

import java.util.List;

/**
 * @ Author     : Rain
 * @ Classname  : AdminServiceImpl
 * @ Date       : 2019/6/5 16:01
 * @ Description:
 */

public class AdminServiceImpl implements AdminService {

    private AdminDAO adminDAO;

    public void setAdminDAO(AdminDAO adminDAO) {
        this.adminDAO = adminDAO;
    }

    @Override
    public boolean checkLogin(Admin admin) {
        return adminDAO.checkLogin(admin);
    }

    @Override
    public List<Users> findAllUser() {
        return adminDAO.findAllUser();
    }

    @Override
    public List<SellerTemp> findAllSeller() {
        return adminDAO.findAllSeller();
    }

    @Override
    public List<Books> findAllBook() {
        return adminDAO.findAllBook();
    }

    @Override
    public List<Withdraw> findCashOut() {
        return adminDAO.findCashOut();
    }

    @Override
    public List<Order> findOrder(int status) {
        return adminDAO.findOrder(status);
    }

    @Override
    public void setStatus(int userId, int status) {
        adminDAO.setStatus(userId, status);
    }

    @Override
    public void sureWithdraw(int id) {
        adminDAO.sureWithdraw(id);
    }
}
