package com.bookshop.user.dao;

import com.bookshop.user.entity.Books;
import com.bookshop.user.entity.Carts;
import com.bookshop.user.entity.Users;
import com.bookshop.user.entity.Withdraw;

import java.util.List;

/**
 * @ Author     : Rain
 * @ Classname  : UsersDAO
 * @ Date       : 2019/5/29 12:57
 * @ Description:
 */

public interface UsersDAO {
    /**
     * 修改密码
     *
     * @param loginEmail
     * @param loginPwd
     */

    void alterPwd(String loginEmail, String loginPwd);

    /**
     * 查询用户
     */
    public Users findByLoginEmail(String loginEmail);


    /**
     * 注册用户 增
     */
    public void save(Users user);


    /**
     * 查询是否注册
     *
     * @return 0 1
     */

    public int findByEmailExist(String loginEmail);


    public void saveKey(String email, String key);

    public String findKeyByUser(Users user);

    public Users findUserByEmail(String email);

    Users checkUser(String username, String password);


    void addCarts(String user, Books bookDetail, int number);

    Carts findCart(int cartId, String loginEmail);

    List<Carts> findCartByEmail(String loginEmail);

    void removeCarts(int cartId, String loginEmail);
    void withdraw(Withdraw withdraw);

}
