package com.bookshop.user.dao.impl;

import com.bookshop.user.dao.UsersDAO;
import com.bookshop.user.entity.Books;
import com.bookshop.user.entity.Carts;
import com.bookshop.user.entity.Users;
import com.bookshop.user.entity.Withdraw;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @ Author     : Rain
 * @ Classname  : UsersDAOImpl
 * @ Date       : 2019/5/29 13:12
 * @ Description:
 */

public class UsersDAOImpl implements UsersDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    /**
     * 修改密码
     *
     * @param loginEmail
     * @param loginPwd
     */
    @Override
    public void alterPwd(String loginEmail, String loginPwd) {

        Users user = findUserByEmail(loginEmail);
        user.setLoginPwd(loginPwd);

        Session session = sessionFactory.getCurrentSession();

        session.saveOrUpdate(user);


    }

    @Override
    public Users findByLoginEmail(String loginEmail) {

        //直接获取当前的session

        Session session = sessionFactory.getCurrentSession();
        String hql = "from Users where Users.loginEmail = ?";

        Query<Users> query = session.createQuery(hql);
        query.setParameter(0, loginEmail);
//        Users users = query.getResultList();

        return null;
    }

    @Override
    public void save(Users user) {

        Session session = sessionFactory.getCurrentSession();
        if (user.getStatus() == 1 || user.getCreateTime() != null) {
            Date date = new Date();//获得系统时间. 
            String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
            Timestamp goodsC_date = Timestamp.valueOf(nowTime);//把时间转换 
            user.setCreateTime(String.valueOf(goodsC_date));
        }
        session.saveOrUpdate(user);

    }


    @Override
    public int findByEmailExist(String loginEmail) {

        //直接获取当前的session

        Session session = sessionFactory.getCurrentSession();
        String hql = "from Users as u where u.loginEmail = ?";

        Query<Users> query = session.createQuery(hql);
        query.setParameter(0, loginEmail);
        List<Users> list = query.getResultList();
        return list.size();

    }

    @Override
    public void saveKey(String email, String key) {
        Session session = sessionFactory.getCurrentSession();

        Users user = new Users();
        user.setLoginEmail(email);
        user.setCDKEY(key);
        user.setLoginPwd("wuxiao");
        session.saveOrUpdate(user);

    }

    @Override
    public String findKeyByUser(Users user) {

        Session session = sessionFactory.getCurrentSession();
        String hql = "from Users as u where u.loginEmail = ?";

        Query<Users> query = session.createQuery(hql);
        query.setParameter(0, user.getLoginEmail());
        List<Users> list = query.getResultList();
        if (list.size() > 0) {
            return list.get(0).getCDKEY();
        }

        return "";
    }


    @Override
    public Users findUserByEmail(String email) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "from Users as u where u.loginEmail = ?";

        Query<Users> query = session.createQuery(hql);
        query.setParameter(0, email);
        List<Users> list = query.getResultList();
        if (list.size() > 0) {
            return list.get(0);
        }
        return new Users();


    }

    @Override
    public Users checkUser(String username, String password) {

        System.out.println("cookie .... checkUser .... dao....");
        Session session = sessionFactory.getCurrentSession();
        String hql = "from Users as u where u.loginEmail = ? and u.loginPwd=?";

        Query<Users> query = session.createQuery(hql);
        query.setParameter(0, username);
        query.setParameter(1, password);

        List<Users> user = query.getResultList();
        if (user.size() > 0)
            return user.get(0);


        return null;
    }

    @Override
    public void addCarts(String user, Books bookDetail, int number) {
        Session session = sessionFactory.getCurrentSession();
        Carts carts = new Carts(user, bookDetail.getBookName(), bookDetail.getBookImg(), bookDetail.getCurrentPrice(), bookDetail.getSellerEmail()
                , number);
        System.out.println(carts);
        session.save(carts);
    }

    @Override
    public Carts findCart(int cartId, String loginEmail) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "from Carts as c where c.loginEmail = ? and c.cartId = ?";

        Query<Carts> query = session.createQuery(hql);
        query.setParameter(0, loginEmail);
        query.setParameter(1, cartId);
        List<Carts> list = query.getResultList();
        return list.get(0);
    }

    @Override
    public List<Carts> findCartByEmail(String loginEmail) {

        Session session = sessionFactory.getCurrentSession();
        String hql = "from Carts as c where c.loginEmail = ?";

        Query<Carts> query = session.createQuery(hql);
        query.setParameter(0, loginEmail);
        List<Carts> list = query.getResultList();

        return list;
    }

    @Override
    public void removeCarts(int cartId, String loginEmail) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(findCart(cartId, loginEmail));

    }

    @Override
    public void withdraw(Withdraw withdraw) {
        Session session = sessionFactory.getCurrentSession();
        session.save(withdraw);

    }


}
