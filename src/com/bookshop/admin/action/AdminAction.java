package com.bookshop.admin.action;

import com.bookshop.admin.entity.Admin;
import com.bookshop.admin.entity.SellerTemp;
import com.bookshop.admin.service.impl.AdminServiceImpl;
import com.bookshop.user.entity.Books;
import com.bookshop.user.entity.Order;
import com.bookshop.user.entity.Users;
import com.bookshop.user.entity.Withdraw;
import com.bookshop.user.service.impl.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @ Author     : Rain
 * @ Classname  : AdminAction
 * @ Date       : 2019/6/5 15:25
 * @ Description:
 */

public class AdminAction extends ActionSupport {


    private Admin admin;

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    private HttpServletRequest request;
    private Map<String, Object> session;
    private Map<String, Object> application;

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public Map<String, Object> getApplication() {
        return application;
    }

    public void setApplication(Map<String, Object> application) {
        this.application = application;
    }

    private UsersServiceImpl usersService;
    private BookServiceImpl bookService;

    private SellerServiceImpl sellerService;

    private BuyServiceImpl buyService;
    private CategoryServiceImpl categoryService;

    private AdminServiceImpl adminService;

    public void setAdminService(AdminServiceImpl adminService) {
        this.adminService = adminService;
    }

    public void setCategoryService(CategoryServiceImpl categoryService) {
        this.categoryService = categoryService;
    }

    public void setUsersService(UsersServiceImpl usersService) {
        this.usersService = usersService;
    }

    public void setSellerService(SellerServiceImpl sellerService) {
        this.sellerService = sellerService;
    }

    public void setBookService(BookServiceImpl bookService) {
        this.bookService = bookService;
    }


    public void setBuyService(BuyServiceImpl buyService) {
        this.buyService = buyService;
    }

    public String redirect() {
        return "redirect";
    }

    public String admin() {
        session = ActionContext.getContext().getSession();
        Admin admin = (Admin) session.get("admin");
        if (admin == null)
            return "admin_login";

        System.out.println("admin");
        return "admin_index";

    }

    public String login() {

        System.out.println(admin);
        boolean boo = adminService.checkLogin(admin);
        if (boo) {
            session = ActionContext.getContext().getSession();
            session.put("admin", admin);
            return "redirectindex";
        } else {
            this.addFieldError("adminError", "账号或密码错误");
        }
        return "admin_login";
    }

    public String searchUser() {

        System.out.println("adminsearchUser");
        List<Users> usersList = adminService.findAllUser();
        session = ActionContext.getContext().getSession();
        session.put("usersList", usersList);

        return "searchUser";
    }

    public String searchSeller() {

        List<SellerTemp> sellersList = adminService.findAllSeller();
        session = ActionContext.getContext().getSession();
        session.put("sellersList", sellersList);
        System.out.println("adminsearchSeller");
        return "searchSeller";
    }


    public String selectBook() {

        request = ServletActionContext.getRequest();
        int good = Integer.parseInt(request.getParameter("good"));
        List<Books> booksList = adminService.findAllBook();
        session = ActionContext.getContext().getSession();
        session.put("booksList", booksList);
        System.out.println("adminselectBook");
        if (good == 0) {
            return "selectBook";
        } else {
            return "deleteBook";
        }
    }

    public String deleteBook() {

        System.out.println("admindeleteBook");
        return "deleteBook";
    }

    public String order() {

        request = ServletActionContext.getRequest();
        int status = Integer.parseInt(request.getParameter("status"));

        List<Order> orderList = adminService.findOrder(status);

        session = ActionContext.getContext().getSession();
        session.put("orderList", orderList);
        if (status == 0) {
            return "order0";

        } else if (status == 1) {
            return "order1";
        } else {
            return "order2";
        }
    }

    public String freeze() {
        request = ServletActionContext.getRequest();
        int status = Integer.parseInt(request.getParameter("status"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        adminService.setStatus(userId, status);
        return "freeze";
    }


    public String userCashOut() {
        request = ServletActionContext.getRequest();
        List<Withdraw> withdrawsList = adminService.findCashOut();
        session = ActionContext.getContext().getSession();
        session.put("withdrawsList", withdrawsList);
        System.out.println("adminuserCashOut");

        return "userCashOut";
    }

    public String sureWithdraw() {

        request = ServletActionContext.getRequest();
        int id = Integer.parseInt(request.getParameter("id"));

        adminService.sureWithdraw(id);

        return "sureWithdraw";
    }

    public String loginOut() {
        session = ActionContext.getContext().getSession();
        session.put("admin", null);
        return "loginOut";
    }

}
