package com.bookshop.admin.dao.impl;

import com.bookshop.admin.dao.AdminDAO;
import com.bookshop.admin.entity.Admin;
import com.bookshop.admin.entity.SellerTemp;
import com.bookshop.user.entity.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @ Author     : Rain
 * @ Classname  : AdminDAOImpl
 * @ Date       : 2019/6/5 16:00
 * @ Description:
 */

public class AdminDAOImpl implements AdminDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public boolean checkLogin(Admin admin) {

        System.out.println(admin);
        Session session = sessionFactory.getCurrentSession();
        String hql = "from Admin a where a.adminName = ? and a.adminPwd = ?";
        Query<Admin> query = session.createQuery(hql);
        query.setParameter(0, admin.getAdminName());
        query.setParameter(1, admin.getAdminPwd());

        List<Admin> adminList = query.getResultList();
        if (adminList.size() > 0) {
            return true;
        }
        return false;
    }

    @Override
    public List<Users> findAllUser() {

        Session session = sessionFactory.getCurrentSession();

        String hql = "from Users";
        Query<Users> query = session.createQuery(hql);

        List<Users> list = query.getResultList();
        return list;
    }

    @Override
    public List<SellerTemp> findAllSeller() {
        Session session = sessionFactory.getCurrentSession();

        String hql = "from Seller";
        Query<Seller> query = session.createQuery(hql);
        List<Seller> list = query.getResultList();
        List<SellerTemp> sellerTemplist = new ArrayList<SellerTemp>();
        Seller seller = null;
        SellerTemp sellerTemp = null;
        String sellerEmail = null;
        List<Object[]> objectList = null;
        Query query1 = null;
        Iterator<Seller> iterator = list.iterator();
        while (iterator.hasNext()) {
            sellerTemp = new SellerTemp();

            seller = iterator.next();
            sellerTemp.setSeller(seller);

            sellerEmail = seller.getLoginEmail();
            /*SELECT e.name,COUNT(e.id) FROM Employee e WHERE id<9 GROUP BY e.name HAVING count(e.id)>1*/
            hql = "select sum(b.bookStock) from Books b where b.sellerEmail = ? group by b.sellerEmail ";
            query1 = session.createQuery(hql);
            query1.setParameter(0, sellerEmail);
            objectList = query1.getResultList();
            /*System.out.println(objectList.get(0)); //1535
            String str = (String) objectList.get(0)[0];*/
            String temp = String.valueOf(objectList.get(0));
            System.out.println("temp" + temp);
            sellerTemp.setOnSale(Long.valueOf(temp));
            hql = "select sum(o.bookNum) from Order o where o.sellerEmail = ? group by o.sellerEmail";
            query1 = session.createQuery(hql);
            query1.setParameter(0, sellerEmail);
            objectList = query1.getResultList();
            sellerTemp.setSold(Long.valueOf(String.valueOf(objectList.get(0))));
            sellerTemplist.add(sellerTemp);
        }
        return sellerTemplist;
    }

    @Override
    public List<Books> findAllBook() {

        Session session = sessionFactory.getCurrentSession();

        String hql = "from Books";
        Query<Books> query = session.createQuery(hql);
        List<Books> list = query.getResultList();
        return list;
    }

    @Override
    public List<Withdraw> findCashOut() {

        Session session = sessionFactory.getCurrentSession();

        String hql = "from Withdraw";
        Query<Withdraw> query = session.createQuery(hql);
        List<Withdraw> list = query.getResultList();
        return list;
    }

    @Override
    public List<Order> findOrder(int status) {
        Session session = sessionFactory.getCurrentSession();

        String hql = "from Order o where o.orderStatus = ?";
        Query<Order> query = session.createQuery(hql);
        query.setParameter(0, status);
        List<Order> orderList = query.getResultList();

        return orderList;
    }

    @Override
    public void setStatus(int userId, int status) {
        Session session = sessionFactory.getCurrentSession();

        String hql = "from Users u where u.userId = ?";
        Query<Users> query = session.createQuery(hql);
        query.setParameter(0, userId);
        List<Users> usersList = query.getResultList();
        if (usersList.size() > 0) {
            usersList.get(0).setStatus(status);
        }

    }

    @Override
    public void sureWithdraw(int id) {
        Session session = sessionFactory.getCurrentSession();

        Withdraw withdraw = session.get(Withdraw.class, id);
        withdraw.setWithdrawStatus(1);

        session.saveOrUpdate(withdraw);
    }
}
