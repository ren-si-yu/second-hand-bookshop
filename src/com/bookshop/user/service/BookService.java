package com.bookshop.user.service;

import com.bookshop.user.entity.Books;
import com.bookshop.user.entity.MyPage;

import java.util.List;

/**
 * @ Author     : Rain
 * @ Classname  : BookService
 * @ Date       : 2019/6/1 14:49
 * @ Description:
 */

public interface BookService {

    void save(Books book);

    void update(Books book);

    void delete(Books books);

    Books find(Books book);

    Books find(String authorOrName);

    Books find(int isbn);

    List<Books> findBookByEmail(String email);

    List<Books> findByType(String type);


    void offShelfBook(String email, int bookId);

    Books find(String email, int bookId);

    void onShelfBook(String email, int bookId);

    void delete(String email, int bookId);

    MyPage<Books> getBookPage(String typeOrName, int page);

    MyPage<Books> getBookPage(String typeOrName, String param, int page);

    List<Books> findBookByEmailStatus(String email, int status);

}
