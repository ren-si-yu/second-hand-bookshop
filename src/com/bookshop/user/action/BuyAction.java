package com.bookshop.user.action;

import com.bookshop.user.entity.*;
import com.bookshop.user.service.impl.BookServiceImpl;
import com.bookshop.user.service.impl.BuyServiceImpl;
import com.bookshop.user.service.impl.SellerServiceImpl;
import com.bookshop.user.service.impl.UsersServiceImpl;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * @ Author     : Rain
 * @ Classname  : BuyAction
 * @ Date       : 2019/6/2 16:39
 * @ Description:
 */

public class BuyAction extends ActionSupport {


    private int bookId;
    private int cartId;

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    private String sellerEmail;
    private Books bookDetail;
    private int number;
    List<Carts> cartsList;

    public List<Carts> getCartsList() {
        return cartsList;
    }

    public void setCartsList(List<Carts> cartsList) {
        this.cartsList = cartsList;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public Books getBookDetail() {
        return bookDetail;
    }

    public void setBookDetail(Books bookDetail) {
        this.bookDetail = bookDetail;
    }


    public String success() {

        HttpServletRequest request = ServletActionContext.getRequest();
        int id = Integer.parseInt(request.getParameter("id"));
        Order order = buyService.searchOrder(id);
        order.setOrderStatus(2);
        buyService.saveOrder(order);

        return "buySuccess";
    }

    /**
     * 如果图书是自己的，则允许自己买自己的
     *
     * @return
     */
    public String detail() {
        bookDetail = bookService.find(sellerEmail, bookId);
        if (bookDetail == null) {
            return "404";
        }
        return "detail";
    }

    //http://buy_detail.action?bookId=1921872247&sellerEmail=12345@qq.com
    public String addCarts() {
        bookDetail = bookService.find(sellerEmail, bookId);
        if (bookDetail == null) {
            return "404";
        }
        String user = (String) ActionContext.getContext().getSession().get("user");
        System.out.println("user cart   " + user);
        System.out.println("user  cart   " + ServletActionContext.getRequest().getSession().getAttribute("user"));
        usersService.addCarts(user, bookDetail, number);
        return "addCarts";
    }

    public String showCarts() {
        Map session = ActionContext.getContext().getSession();
        String loginEmail = (String) session.get("user");
        cartsList = usersService.findCartByEmail(loginEmail);
        /*if (cartsList == null) {
            this.addFieldError("404", "购物车");
            return "404";
        }*/
        return "showCarts";
    }

    public String removeCarts() {
        //int cartId, String loginEmail
        Map session = ActionContext.getContext().getSession();
        String loginEmail = (String) session.get("user");
        usersService.removeCarts(cartId, loginEmail);
        return "removeCarts";
    }

    public String addOrderNum() {

        Map session = ActionContext.getContext().getSession();
        HttpServletRequest request = ServletActionContext.getRequest();

        String orderNumber = request.getParameter("orderNumber");
        Order order = (Order) session.get("order");
        order.setOrderNumber(orderNumber);
        order.setOrderStatus(1);
       /* Books books = bookService.find(order.getSellerEmail(), order.getBookId());
        //已售出
        books.setStatus(2);
        bookService.save(books);*/
        buyService.saveOrder(order);
        return "addOrderNum";
    }


    public String searchOrder() {
        Map session = ActionContext.getContext().getSession();
        HttpServletRequest request = ServletActionContext.getRequest();
        String loginEmail = (String) session.get("user");
        List<Order> orderList = buyService.searchOrder(loginEmail);
        session.put("orderList", orderList);
        return "searchOrder";
    }

    public String addOrder() {
        Map session = ActionContext.getContext().getSession();
        HttpServletRequest request = ServletActionContext.getRequest();
        String goodName = null;
        String goodPrice = null;
        String sellerEmail = null;
        String bookId = null;
        int bookNum = 0;
        Date payDate = new Date();
        String address = "暂无收货地址，请先添加";


        if (goodPrice != null && bookNum != 0) {
            /**
             * 这里不能用int 太小了 用long好点
             */
            goodPrice = bookNum * Long.parseLong(goodPrice) + "";

        }

        String loginEmail = (String) session.get("user");
        /**
         * @param orderName
         */

        String out_trade_no = (String) session.get("out_trade_no");
        //不为空代表，支付成功
        if (out_trade_no != null) {
            //0已支付未发货
            //1已支付已发货
            //2已支付成交

            session.put("out_trade_no", null);
            /**
             * 判断之后把session的out_trade_no清空
             */
            goodName = (String) session.get("goodName");
            sellerEmail = (String) session.get("sellerEmail");
            address = (String) session.get("address");
            bookId = (String) session.get("bookId");
            bookNum = (int) session.get("bookNum");
            goodPrice = (String) session.get("goodPrice");
            int bookid = Integer.parseInt(bookId);
            BigDecimal price = new BigDecimal(goodPrice);
            Order order = new Order(loginEmail, bookid, bookNum, price, 0, null, payDate, goodName, sellerEmail, address);
            System.out.println(order);
            buyService.addOrder(order);

            Users seller = usersService.findUserByEmail(sellerEmail);
            seller.setMoney(seller.getMoney().add(price));
            usersService.save(seller);

            Books book = bookService.find(sellerEmail, bookid);
            //- 1下架 0待出售 1待发货 2已售出
            book.setStatus(1);
            //减少库存
            book.setBookStock(book.getBookStock() - bookNum);
            bookService.save(book);

        } else {
            goodName = request.getParameter("goodName");
            goodPrice = request.getParameter("goodPrice");
            sellerEmail = request.getParameter("sellerEmail");
            bookId = request.getParameter("bookId");
            bookNum = Integer.parseInt(request.getParameter("bookNum"));


            List<Address> list = buyService.searchAddress(loginEmail);
            Address address1;
            Iterator<Address> iterator = list.iterator();
            while (iterator.hasNext()) {
                address1 = iterator.next();
                if (address1.getFirst() == 1)
                    address = address1.getUserAddress();
            }
            if (address.equals("暂无收货地址，请先添加")) {

                this.addFieldError("404", "暂无收货地址，请先添加");
                return "404";
            }

            session.put("bookNum", bookNum);
            session.put("bookId", bookId);
            session.put("goodName", goodName);
            session.put("goodPrice", goodPrice);
            session.put("sellerEmail", sellerEmail);
            session.put("address", address);
            return "addOrder";
        }
        return "paySuccess";

    }

    public String fahuo() {

        int a = 1505649361;
        Map session = ActionContext.getContext().getSession();
        String sellerEmail = (String) session.get("user");
        try {
            int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
            int bookId = Integer.parseInt(ServletActionContext.getRequest().getParameter("bookId"));

            Order order = buyService.searchOrder(bookId, id, sellerEmail);
            Books books = bookService.find(sellerEmail, bookId);
            books.setStatus(0);
            bookService.save(books);
            //订单的loginemail是买家的登录邮箱
            String userEmail = order.getLoginEmail();
            Address address = buyService.searchFirstAddress(userEmail);

            session.put("address", address);
            session.put("order", order);

        } catch (Exception e) {
            return "404";
        }

        return "fahuo";
    }

    public String buyBook() {
        return "buyBook";
    }


    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    private BookServiceImpl bookService;
    private SellerServiceImpl sellerService;
    private UsersServiceImpl usersService;
    private BuyServiceImpl buyService;

    public void setBuyService(BuyServiceImpl buyService) {
        this.buyService = buyService;
    }

    public String getSellerEmail() {
        return sellerEmail;
    }

    public void setSellerEmail(String sellerEmail) {
        this.sellerEmail = sellerEmail;
    }

    public void setBookService(BookServiceImpl bookService) {
        this.bookService = bookService;
    }


    public void setSellerService(SellerServiceImpl sellerService) {
        this.sellerService = sellerService;
    }


    public void setUsersService(UsersServiceImpl usersService) {
        this.usersService = usersService;
    }


}
