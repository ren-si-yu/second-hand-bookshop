package com.bookshop.user.dao.impl;

import com.bookshop.user.dao.SellerDAO;
import com.bookshop.user.entity.Seller;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.List;

/**
 * @ Author     : Rain
 * @ Classname  : SellerDAOImpl
 * @ Date       : 2019/6/1 8:00
 * @ Description:
 */

public class SellerDAOImpl implements SellerDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    /**
     * 保险的做法
     * if(list.size() > 0)
     * return list.get(0);
     * else
     * return null;
     *
     * @param email
     * @return
     */
    @Override
    public Seller find(String email) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "from Seller s where s.loginEmail = ?";
        Query<Seller> query = session.createQuery(hql);
        query.setParameter(0, email);

        List<Seller> list = query.getResultList();
        if (list.size() > 0)
            return list.get(0);
        else
            return new Seller();
    }

    @Override
    public Seller find(Seller seller) {
        return null;
    }

    @Override
    public void save(Seller seller) {
        sessionFactory.getCurrentSession().saveOrUpdate(seller);
    }
}
