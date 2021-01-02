package com.bookshop.user.service.impl;

import com.bookshop.user.dao.BookDAO;
import com.bookshop.user.entity.Books;
import com.bookshop.user.entity.MyPage;
import com.bookshop.user.service.BookService;

import java.util.List;

/**
 * @ Author     : Rain
 * @ Classname  : BookServiceImpl
 * @ Date       : 2019/6/1 14:49
 * @ Description:
 */

public class BookServiceImpl implements BookService {

    private BookDAO bookDAO;

    public void setBookDAO(BookDAO bookDAO) {
        this.bookDAO = bookDAO;
    }

    @Override
    public void save(Books book) {

        bookDAO.save(book);
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


    public List<Books> findBookByEmail(String email) {
        return bookDAO.findBookByEmail(email);
    }

    @Override
    public List<Books> findByType(String type) {
        return bookDAO.findByType(type);
    }

    @Override
    public void offShelfBook(String email, int bookId) {
        bookDAO.offShelfBook(email, bookId);
    }

    @Override
    public Books find(String email, int bookId) {
        return bookDAO.find(email, bookId);
    }

    @Override
    public void onShelfBook(String email, int bookId) {
        bookDAO.onShelfBook(email, bookId);
    }

    @Override
    public void delete(String email, int bookId) {
        bookDAO.delete(email, bookId);
    }

    @Override
    public MyPage<Books> getBookPage(String typeOrName, int page) {
        return bookDAO.getBookPage(typeOrName, page);
    }

    @Override
    public MyPage<Books> getBookPage(String typeOrName, String param, int page) {
        return bookDAO.getBookPage(typeOrName, param, page);
    }

    @Override
    public List<Books> findBookByEmailStatus(String email, int status) {
        return bookDAO.findBookByEmailStatus( email, status);
    }

}




