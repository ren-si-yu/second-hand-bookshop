package com.bookshop.user.dao.impl;

import com.bookshop.oss.OssUtil;
import com.bookshop.user.dao.BookDAO;
import com.bookshop.user.entity.Books;
import com.bookshop.user.entity.MyPage;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.junit.Test;

import java.awt.print.Book;
import java.util.List;

/**
 * @ Author     : Rain
 * @ Classname  : BookDAOImpl
 * @ Date       : 2019/6/1 14:49
 * @ Description:
 */

public class BookDAOImpl implements BookDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void save(Books book) {
        sessionFactory.getCurrentSession().saveOrUpdate(book);
    }

    @Override
    public void update(Books book) {

    }

    @Override
    public void delete(Books books) {

    }

    @Override
    public Books find(Books book) {
        return null;
    }

    @Override
    public Books find(String authorOrName) {
        return null;
    }

    @Override
    public Books find(int isbn) {
        return null;
    }

    @Override
    public List<Books> findBookByEmail(String email) {

        Session session = sessionFactory.getCurrentSession();
        String hql = "from Books b where b.sellerEmail = ?";
        Query<Books> query = session.createQuery(hql);
        query.setParameter(0, email);

        List<Books> list = query.getResultList();
        return list;

    }


    @Override
    public void offShelfBook(String email, int bookId) {

        Session session = sessionFactory.getCurrentSession();
        Books book = find(email, bookId);
        if (book != null) {
            book.setStatus(-1);
            session.update(book);
        }

    }

    @Override
    public void onShelfBook(String email, int bookId) {
        Session session = sessionFactory.getCurrentSession();
        Books book = find(email, bookId);
        if (book != null) {
            book.setStatus(0);
            session.update(book);
        }
    }

    @Override
    public Books find(String email, int bookId) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "from Books b where b.sellerEmail = ? and b.bookId = ?";
        Query<Books> query = session.createQuery(hql);
        query.setParameter(0, email);
        query.setParameter(1, bookId);
        List<Books> list = query.getResultList();
        if (list.size() > 0)
            return list.get(0);
        return null;
    }

    @Override
    public void delete(String email, int bookId) {
        Session session = sessionFactory.getCurrentSession();

        Books books = find(email, bookId);
        String image = books.getBookImg();
        new OssUtil().deleteImage(books.getBookImg());
        if (books != null)
            session.delete(books);
    }


    @Override
    public List<Books> findByType(String type) {

        Session session = sessionFactory.getCurrentSession();
        String hql = "from Books b where b.typeNo1 = ?";
        Query<Books> query = session.createQuery(hql);
        query.setParameter(0, type);

        List<Books> list = query.getResultList();
        if (list.size() > 0)
            return list;
        return null;
    }


    @Override
    public MyPage<Books> getBookPage(String typeOrName, int page) {
        Session session = sessionFactory.getCurrentSession();
        //编写Hql语句，使用分页查询
        String hql = "";
        if (typeOrName.equals("")) {
            hql = "from Books b order by b.bookName asc";
        } else {
            return new MyPage<Books>();
        }
        //创建Query对象
        Query<Books> query = session.createQuery(hql);
        List<Books> list = query.getResultList();
        int totalCount = list.size();
        System.out.println("一共搜索记录--------" + totalCount);
        MyPage<Books> pag = new MyPage();

        //设置总记录数
        pag.setTotalCount(totalCount);
// totalPage = (totalRecord + maxResult -1) / maxResult;
        int totalPage = (totalCount + 12 - 1) / 12;
        pag.setTotalPage(totalPage);


        //设置当前页
        if (page < 1) {
            page = 1;
        } else if (page > totalPage) {
            page = totalPage;
        }
        pag.setPage(page);


        //设置前页和后一页
        if (page == 1)
            pag.setHasPre(false);
        else
            pag.setHasPre(true);

        if (page == totalCount)
            pag.setHasNext(false);
        else pag.setHasNext(true);

        if ((totalCount < page * 12))
            pag.setLimit(page * 12 - totalCount);
        else pag.setLimit(12);

        int startIndex = (page - 1) * 12;
        query.setFirstResult(startIndex);
        query.setMaxResults(pag.getLimit());
        //执行查询，获取结果

        List<Books> pageList = query.getResultList();

        System.out.println("pageList-------" + pageList.size());
        pag.setList(pageList);
        return pag;


    }

    @Override
    public MyPage<Books> getBookPage(String typeOrName, String param, int page) {
        Session session = sessionFactory.getCurrentSession();
        //编写Hql语句，使用分页查询
        String hql = "";
        if (typeOrName.equals("")) {
            hql = "from Books b order by b.bookName asc";
        } else if (typeOrName.equals("type")) {
            //这里必须注意只能使用单引号，如：" '%" + name + "%' "
            hql = "from Books b where b.typeNo1 like '%" + param + "%'";
        } else if (typeOrName.equals("name")) {
            hql = "from Books b where b.bookName like '%" + param + "%'";
        } else {
            return new MyPage<Books>();
        }
        //创建Query对象
        Query<Books> query = session.createQuery(hql);
        List<Books> list = query.getResultList();
        int totalCount = list.size();
        System.out.println("一共搜索记录--------" + totalCount);
        MyPage<Books> pag = new MyPage();
        //设置总记录数
        pag.setTotalCount(totalCount);
//        totalPage = (totalRecord + maxResult -1) / maxResult;
        int totalPage = (totalCount + 12 - 1) / 12;

        pag.setTotalPage(totalPage);


        //设置当前页
        if (page < 1) {
            page = 1;
        } else if (page > totalPage) {
            page = totalPage;
        }
        pag.setPage(page);

        //设置前页和后一页
        if (page == 1)
            pag.setHasPre(false);
        else
            pag.setHasPre(true);

        if (page == totalCount)
            pag.setHasNext(false);
        else pag.setHasNext(true);

        if ((totalCount < page * 12))
            pag.setLimit(page * 12 - totalCount);
        else pag.setLimit(12);

        int startIndex = (page - 1) * 12;
        query.setFirstResult(startIndex);
        query.setMaxResults(pag.getLimit());
        //执行查询，获取结果

        List<Books> pageList = query.getResultList();

        System.out.println("pageList-------" + pageList.size());
        pag.setList(pageList);
        return pag;


    }

    @Override
    public List<Books> findBookByEmailStatus(String email, int status) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "from Books b where b.sellerEmail = ? and b.status= ?";
        Query<Books> query = session.createQuery(hql);
        query.setParameter(0, email);
        query.setParameter(1, status);


        List<Books> list = query.getResultList();
        if (list.size() > 0)
            return list;
        list.add(new Books());
        return list;
    }


/*    //分页查询的方法
    public void pagedSearch(int pageIndex, int pageSize) {
        //编写Hql语句，使用分页查询
        String hql = "from Meal m order by m.mealName asc";
        //创建Query对象
        Query<Meal> query = session.createQuery(hql, Meal.class);
        int startIndex = (pageIndex - 1) * pageSize;
        query.setFirstResult(startIndex);
        query.setMaxResults(pageSize);
        //执行查询，获取结果

        List<Meal> list = query.getResultList();
        for (Meal m : list) {
            System.out.println(m.getMealId() + "." + m.getMealName());
        }
    }*/

/*    @Override
    public List<Books> find() {
        Session session = sessionFactory.getCurrentSession();
        String hql = "from Books";
        Query<Books> query = session.createQuery(hql);
        List<Books> list = query.getResultList();
        return list;
    }*/
}
