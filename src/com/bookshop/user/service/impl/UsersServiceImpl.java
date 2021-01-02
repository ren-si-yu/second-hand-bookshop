package com.bookshop.user.service.impl;

import com.bookshop.user.dao.UsersDAO;
import com.bookshop.user.entity.Books;
import com.bookshop.user.entity.Carts;
import com.bookshop.user.entity.Users;
import com.bookshop.user.entity.Withdraw;
import com.bookshop.user.service.UsersService;

import java.util.List;

/**
 * @ Author     : Rain
 * @ Classname  : UsersServiceImpl
 * @ Date       : 2019/5/29 13:13
 * @ Description:
 */

public class UsersServiceImpl implements UsersService {

    private UsersDAO usersDAO;

    public void setUsersDAO(UsersDAO usersDAO) {
        this.usersDAO = usersDAO;
    }

    @Override
    public Users findByLoginEmail(String loginEmail) {
        return usersDAO.findByLoginEmail(loginEmail);
    }

    @Override
    public void save(Users user) {
        usersDAO.save(user);
    }

    @Override
    public void login(Users user) {

    }

    @Override
    public void update(Users user) {

    }

    @Override
    public void delete(Users user) {

    }


    @Override
    public int findByEmailExist(String loginEmail) {
        return usersDAO.findByEmailExist(loginEmail);
    }

    @Override
    public void saveKey(String email, String key) {
        usersDAO.saveKey(email, key);
    }

    @Override
    public String findKeyByUser(Users user) {
        return usersDAO.findKeyByUser(user);
    }

    @Override
    public Users findUserByEmail(String email) {

        return usersDAO.findUserByEmail(email);
    }

    @Override
    public void alterPwd(String loginEmail, String loginPwd) {
        usersDAO.alterPwd(loginEmail, loginPwd);
    }

    @Override
    public void addCarts(String user, Books bookDetail, int number) {
        usersDAO.addCarts(user, bookDetail, number);
    }

    @Override
    public List<Carts> findCartByEmail(String loginEmail) {
        return usersDAO.findCartByEmail(loginEmail);
    }

    @Override
    public Carts findCart(int cartId, String loginEmail) {
        return usersDAO.findCart(cartId, loginEmail);

    }

    @Override
    public void removeCarts(int cartId, String loginEmail) {
        usersDAO.removeCarts(cartId, loginEmail);

    }

    @Override
    public void withdraw(Withdraw withdraw) {
        usersDAO.withdraw(withdraw);
    }

    @Override
    public Users checkUser(String username, String password) {
        return usersDAO.checkUser(username, password);
    }


}
