package com.bookshop.user.action;

import com.bookshop.user.entity.Books;
import com.bookshop.user.entity.MyPage;
import com.bookshop.user.service.impl.BookServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @ Author     : Rain
 * @ Classname  : PageAction
 * @ Date       : 2019/6/2 10:17
 * @ Description:
 */

public class PageAction extends ActionSupport {

    private HttpServletRequest request = ServletActionContext.getRequest();

    private int page;

    private String param;

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    private String typeOrName;
    private MyPage<Books> myPage;
    private List<Books> bookList;

    public MyPage<Books> getMyPage() {
        return myPage;
    }

    public void setMyPage(MyPage<Books> myPage) {
        this.myPage = myPage;
    }

    private BookServiceImpl bookService;

    public void setBookService(BookServiceImpl bookService) {
        this.bookService = bookService;
    }

    public String getTypeOrName() {
        return typeOrName;
    }

    public void setTypeOrName(String typeOrName) {
        this.typeOrName = typeOrName;
    }

    public String getBookPage() {
        //给myPage赋值，传到action中
        this.typeOrName = request.getParameter("typeOrName") == null ? "" : request.getParameter("typeOrName");
        if (typeOrName.equals("")) {
            myPage = bookService.getBookPage(typeOrName, page);
        } else {
            myPage = bookService.getBookPage(typeOrName, param, page);

        }
        System.out.println("myPage.getList().size()" + myPage.getList().size());


        return "getBookPage";

    }

    public String getBuyBookPage() {

        //给myPage赋值，传到action中
        this.typeOrName = request.getParameter("typeOrName") == null ? "" : request.getParameter("typeOrName");
        if (typeOrName.equals("")) {
            myPage = bookService.getBookPage(typeOrName, page);
            System.out.println(myPage);
        } else {
            myPage = bookService.getBookPage(typeOrName, param, page);
            System.out.println(myPage);
        }
        System.out.println("Page=" + " " + page);
        //给myPage赋值，传到action中
        System.out.println("myPage.getList().size()" + myPage.getList().size());

        return "getBuyBookPage";

    }


}
