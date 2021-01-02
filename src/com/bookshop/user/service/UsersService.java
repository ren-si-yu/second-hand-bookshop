package com.bookshop.user.service;

import com.bookshop.user.entity.Books;
import com.bookshop.user.entity.Carts;
import com.bookshop.user.entity.Users;
import com.bookshop.user.entity.Withdraw;

import java.util.List;

/**
 * @ Author     : Rain
 * @ Classname  : UsersService
 * @ Date       : 2019/5/29 13:13
 * @ Description:
 */

public interface UsersService {

    public Users findByLoginEmail(String loginEmail);

    public void save(Users user);

    public void login(Users user);

    public void update(Users user);

    public void delete(Users user);
    public int findByEmailExist(String loginEmail);

    public void saveKey(String email,String key);

    public String findKeyByUser(Users user);

    public Users findUserByEmail(String email);


    public void alterPwd(String loginEmail, String loginPwd);


    void addCarts(String user, Books bookDetail, int number);

    List<Carts> findCartByEmail(String loginEmail);

    Carts findCart(int cartId, String loginEmail);

    void removeCarts(int cartId, String loginEmail);

    void withdraw(Withdraw withdraw);

    Users checkUser(String username, String password);
}
