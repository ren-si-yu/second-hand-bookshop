package com.bookshop.user.action;

import com.bookshop.user.entity.Books;
import com.bookshop.user.entity.Seller;
import com.bookshop.user.entity.Users;
import com.bookshop.user.entity.Withdraw;
import com.bookshop.user.service.impl.BookServiceImpl;
import com.bookshop.user.service.impl.SellerServiceImpl;
import com.bookshop.user.service.impl.UsersServiceImpl;
import com.bookshop.utils.CookieUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * @ Author     : Rain
 * @ Classname  : DoAction
 * @ Date       : 2019/5/30 0:08
 * @ Description:
 */

public class DoAction extends ActionSupport implements ModelDriven<Users> {
    private Users user = new Users();
    private Seller seller;


    private int onSale;
    private int sold;
    private BookServiceImpl bookService;

    public int getOnSale() {
        return onSale;
    }

    public void setOnSale(int onSale) {
        this.onSale = onSale;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public Seller getSeller() {
        return seller;
    }

    public void setSeller(Seller seller) {
        this.seller = seller;
    }

    private UsersServiceImpl usersService;
    private String remember;
    private int userCount;
    private CookieUtils cookieUtils = new CookieUtils();
    private SellerServiceImpl sellerService;

    public Users getUser() {
        return user;
    }

    public void setRemember(String remember) {
        this.remember = remember;
    }

    public void setUsersService(UsersServiceImpl usersService) {
        this.usersService = usersService;
    }

    /**
     * 登录和
     * 记住密码
     */
    public String login() {

        Map session = ActionContext.getContext().getSession();
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        /*Boolean remember = request.getParameter("remember") != null ? true : false;*/

        Boolean remember = this.remember == null ? true : false;
        Users u = usersService.findUserByEmail(user.getLoginEmail());
        if (u.getStatus() == -1) {
            this.addFieldError("loginError", "账号已被冻结,请联系管理员");
            return "loginError";
        }
        if (user.getLoginPwd().equals(
                u.getLoginPwd())) {
            session.put("user", user.getLoginEmail());
            ActionContext context = ActionContext.getContext();
            userCount++;
            context.getApplication().put("userCount", userCount);
            if (!remember) {
                Cookie cookie = cookieUtils.addCookie(u);
                //添加cookie
                response.addCookie(cookie);
            }

        } else {
            this.addFieldError("loginError", "账号或者密码错误");
            return "loginError";
        }

        return "loginSuccess";
    }

    public String register() {
        System.out.println(user);

        if (user.getCDKEY().equals(usersService.findKeyByUser(user))) {
            //未激活已激活
            if (usersService.findUserByEmail(user.getLoginEmail()).getStatus() == 0) {

                Users user0 = usersService.findUserByEmail(user.getLoginEmail());
                user0.setLoginPwd(user.getLoginPwd());
                user0.setStatus(1);
                usersService.save(user0);

                //保存登陆状态
                Map session = ActionContext.getContext().getSession();
                session.put("user", user.getLoginEmail());
                ActionContext context = ActionContext.getContext();
                userCount++;
                context.getApplication().put("userCount", userCount);


            } else {
                this.addFieldError("keyError", "您已注册");
                return "registerError";
            }
        } else {
            this.addFieldError("keyError", "验证码错误");
            return "registerError";
        }

        ActionContext context = ActionContext.getContext();
        userCount++;
        context.getApplication().put("userCount", userCount);
        return "registerSuccess";
    }

    public String loginOut() {
        HttpSession session = ServletActionContext.getRequest().getSession();

        ActionContext context = ActionContext.getContext();
        userCount--;
        context.getApplication().put("userCount", userCount);
        session.invalidate();

        return "loginOut";
    }

    public String chargeMoney() {

        return "chargeMoney";
    }

    public String personCenter() {

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        String loginEmail = (String) session.getAttribute("user");
        this.user = usersService.findUserByEmail(loginEmail);
        System.out.println("personcenter" + user);
        this.seller = sellerService.find(loginEmail);
        System.out.println("seller" + seller);

        List<Books> books = bookService.findBookByEmail(loginEmail);
        Books book;
        if (books == null) {
            onSale = 0;
            sold = 0;
        } else {
            Iterator<Books> iterator = books.iterator();
            while (iterator.hasNext()) {
                //- 1下架 0待出售 1待发货 2已售出
                book = iterator.next();
                if (book.getStatus() == 0)
                    onSale++;
                else if (book.getStatus() == 2)
                    sold++;

            }
        }
        System.out.println(onSale + sold);


        return "personCenter";
    }

    public String altPersonCenter() {

        HttpServletRequest request = ServletActionContext.getRequest();

        String loginEmail = request.getParameter("loginEmail");
        String userName = request.getParameter("userName");
        String userPhone = request.getParameter("userPhone");
        String bookshelfName = request.getParameter("bookshelfName");

        Users users = usersService.findUserByEmail(loginEmail);
        users.setUserName(userName);
        users.setUserPhone(userPhone);
        Seller seller = sellerService.find(loginEmail);
        seller.setBookshelfName(bookshelfName);

        usersService.save(users);
        sellerService.save(seller);
        return "altPersonCenter";
    }

    /**
     * 需要先登录
     *
     * @return
     */

    public String withdraw() {
        String withdrawMoney = ServletActionContext.getRequest().getParameter("withdrawMoney");
        String userEmail = (String) ActionContext.getContext().getSession().get("user");
        Users user = usersService.findUserByEmail(userEmail);
        BigDecimal userMoney = user.getMoney();
        user.setMoney(userMoney.subtract(new BigDecimal(withdrawMoney).multiply(new BigDecimal(1.1))));
        usersService.save(user);

        Seller seller = sellerService.find(userEmail);
        Withdraw withdraw = new Withdraw();
        Date date = new Date();//获得系统时间. 
        String nowTime = new SimpleDateFormat("MMddHHmmss").format(date);
        withdraw.setWithdrawId(Integer.parseInt(nowTime));
        withdraw.setAlipayNum(seller.getAlipayNum());
        nowTime = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss").format(date);
        withdraw.setCreatTime(nowTime);
        withdraw.setSellerEmail(seller.getLoginEmail());
        withdraw.setWithdrawMoney(new BigDecimal(withdrawMoney));
        usersService.withdraw(withdraw);

        return "withdraw";
    }

    public String addAddress() {
        return "addAddress";
    }


    @Override
    public Users getModel() {
        return user;
    }

    public void setSellerService(SellerServiceImpl sellerService) {
        this.sellerService = sellerService;
    }

    public SellerServiceImpl getSellerService() {
        return sellerService;
    }

    public void setBookService(BookServiceImpl bookService) {
        this.bookService = bookService;
    }

    public BookServiceImpl getBookService() {
        return bookService;
    }
}
