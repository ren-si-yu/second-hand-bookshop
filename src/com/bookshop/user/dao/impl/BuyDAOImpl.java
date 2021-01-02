package com.bookshop.user.dao.impl;

import com.bookshop.user.dao.BuyDAO;
import com.bookshop.user.entity.Address;
import com.bookshop.user.entity.Order;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.Iterator;
import java.util.List;

/**
 * @ Author     : Rain
 * @ Classname  : BuyDAOImpl
 * @ Date       : 2019/6/3 19:04
 * @ Description:
 */

public class BuyDAOImpl implements BuyDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Address> searchAddress(String loginEmail) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "from Address a where a.loginEmail = ?";
        Query<Address> query = session.createQuery(hql);
        query.setParameter(0, loginEmail);
        List<Address> addressList = query.getResultList();
        return addressList;
    }

    @Override
    public void saveAddress(Address address) {
        Session session = sessionFactory.getCurrentSession();
        session.save(address);

    }

    @Override
    public void updateAddress(Address address) {

    }

    @Override
    public void firstAddress(String id) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "from Address a where a.id = ?";
        Query<Address> query = session.createQuery(hql);
        query.setParameter(0, Integer.parseInt(id));
        List<Address> addressList = query.getResultList();
        Address address;
        Iterator<Address> iterator = addressList.iterator();
        while (iterator.hasNext()) {
            address = iterator.next();
            if (Integer.parseInt(id) != address.getId()) address.setFirst(0);
            else address.setFirst(1);
            session.saveOrUpdate(address);
        }
    }

    @Override
    public void addOrder(Order order) {
        Session session = sessionFactory.getCurrentSession();
        session.save(order);
    }

    @Override
    public Order searchOrder(int bookId, int id, String sellerEmail) {
        Session session = sessionFactory.getCurrentSession();

        String hql = "from Order o where o.bookId = ?and o.id = ? and o.sellerEmail = ?";
        Query<Order> query = session.createQuery(hql);
        query.setParameter(0, bookId);
        query.setParameter(1, id);
        query.setParameter(2, sellerEmail);
        List<Order> orders = query.getResultList();

        return orders.get(0);
    }


    @Override
    public Address searchFirstAddress(String userEmail) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "from Address a where a.loginEmail = ? and a.first = ?";
        Query<Address> query = session.createQuery(hql);
        query.setParameter(0, userEmail);
        query.setParameter(1, 1);

        List<Address> addressList = query.getResultList();
        if (addressList.size() != 0) {
            return addressList.get(0);
        }
        query.setParameter(1, 0);
        List<Address> add = query.getResultList();
        return add.get(0);
    }

    @Override
    public List<Order> searchOrder(String loginEmail) {

        Session session = sessionFactory.getCurrentSession();
        String hql = "from Order a where a.loginEmail = ?";
        Query<Order> query = session.createQuery(hql);
        query.setParameter(0, loginEmail);

        List<Order> orderList = query.getResultList();
        return orderList;
    }

    @Override
    public void saveOrder(Order order) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(order);
    }

    @Override
    public Order searchOrder(int id) {
        Session session = sessionFactory.getCurrentSession();
        Order order = session.get(Order.class, id);
        return order;
    }

    @Override
    public List<Order> searchOrderBySellerEmail(String email, int status) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "from Order o where o.sellerEmail =?";
        Query<Order> query = session.createQuery(hql);
        query.setParameter(0, email);
        List<Order> list = query.getResultList();

        return list;
    }

    @Override
    public List<Order> searchOrder(int bookId, String loginEmail) {
        Session session = sessionFactory.getCurrentSession();

        String hql = "from Order o where o.bookId = ?and o.loginEmail = ?";
        Query<Order> query = session.createQuery(hql);
        query.setParameter(0, bookId);
        query.setParameter(1, loginEmail);
        List<Order> orders = query.getResultList();

        return orders;
    }

}
