package com.bookshop.user.dao.impl;

import com.bookshop.user.dao.CategoryDAO;
import com.bookshop.user.entity.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import java.util.List;

/**
 * @ Author     : Rain
 * @ Classname  : CategoryDAOImpl
 * @ Date       : 2019/5/30 20:21
 * @ Description:
 */

public class CategoryDAOImpl implements CategoryDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Category> getCategory() {

        Session session = sessionFactory.getCurrentSession();
        Query<Category> query = session.createQuery("from Category c order by c.categoryId asc");

        return query.getResultList();
    }
}
