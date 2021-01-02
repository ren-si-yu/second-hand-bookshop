package com.bookshop.user.action;

import com.bookshop.user.entity.Books;
import com.bookshop.user.entity.Category;
import com.bookshop.user.entity.Order;
import com.bookshop.user.entity.Seller;
import com.bookshop.user.service.CategoryService;
import com.bookshop.user.service.impl.BookServiceImpl;
import com.bookshop.user.service.impl.BuyServiceImpl;
import com.bookshop.user.service.impl.SellerServiceImpl;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import java.util.List;
import java.util.Map;

/**
 * @ Author     : Rain
 * @ Classname  : SellerAction
 * @ Date       : 2019/5/31 9:31
 * @ Description:
 */

public class SellerAction extends ActionSupport implements ModelDriven<Seller> {

    private Seller seller = new Seller();
    private SellerServiceImpl sellerService;
    private BookServiceImpl bookService;
    private BuyServiceImpl buyService;

    public void setBuyService(BuyServiceImpl buyService) {
        this.buyService = buyService;
    }

    public BookServiceImpl getBookService() {
        return bookService;
    }

    public void setBookService(BookServiceImpl bookService) {
        this.bookService = bookService;
    }

    public void setSellerService(SellerServiceImpl sellerService) {
        this.sellerService = sellerService;
    }

    /**
     * 检查卖家信息是否完善。。
     * 如果检查没问题，返回获取自己的书单。。传递到下一个action
     *
     * @return
     * @throws Exception
     */

    public String checkSeller() {
        String loginEmail = (String) ActionContext.getContext().getSession().get("user");

        Seller seller = sellerService.find(loginEmail);
        if (seller != null) {

            return "checkOk";

        } else {

            return "checkFailure";
        }
    }


    /**
     * 完善信息
     */
    public String addSeller() {


        System.out.println(seller);
        try {
            sellerService.save(seller);
        } catch (Exception e) {
            return "setFailure";
        }
        return "setSellerSuccess";
    }


    private CategoryService categoryService;
    private List<Category> categoriesList;

    public List<Category> getCategoriesList() {
        return categoriesList;
    }

    public void setCategoriesList(List<Category> categoriesList) {
        this.categoriesList = categoriesList;
    }

    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }


    public String sellBook() {
        categoriesList = categoryService.getCategory();

        return "getCategory";
    }

    public String getMyBook() {
        Map session = ActionContext.getContext().getSession();
        String email = (String) session.get("user");
        List<Books> bookList = bookService.findBookByEmail(email);
        System.out.println("查询我出售的图书 的数量" + bookList.size());
        if (bookList != null) {
            session.put("bookList", bookList);
        }
        return "getBookSuccess";
    }

    public String getMyBookByStatus() {
        Map session = ActionContext.getContext().getSession();
        String email = (String) session.get("user");
        String temp = ServletActionContext.getRequest().getParameter("status") == null ? "-2" : ServletActionContext.getRequest().getParameter("status");
        int status = Integer.parseInt(temp);

        if (status == 1 || status == 2) {
            List<Order> orderList = buyService.searchOrderBySellerEmail(email,status);
            if (orderList != null) {
                session.put("orderList", orderList);
                session.put("status", status);

            }


        } else {
            List<Books> bookList = bookService.findBookByEmailStatus(email, status);
            if (bookList != null) {
                session.put("bookList", bookList);
                session.put("status", status);
            }
        }

        return "getMyBookByStatus";
    }


    @Override
    public Seller getModel() {
        return seller;
    }
}
