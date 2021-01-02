package com.bookshop.user.action;

import com.bookshop.oss.OssUtil;
import com.bookshop.user.entity.Books;
import com.bookshop.user.entity.Seller;
import com.bookshop.user.service.impl.BookServiceImpl;
import com.bookshop.user.service.impl.SellerServiceImpl;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;
import org.junit.Test;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.Map;


/**
 * @ Author     : Rain
 * @ Classname  : BookAction
 * @ Date       : 2019/6/1 12:33
 * @ Description:
 */

public class BookAction extends ActionSupport implements ModelDriven<Books> {

    private File image;
    //当前上传的文件名
    private String imageFileName;
    //文件类型(MIME)
    private String imageContentType;

    private Books book = new Books();
    private BookServiceImpl bookService;
    private SellerServiceImpl sellerService;
    private Map session;
    private HttpServletRequest request;

    public void setSellerService(SellerServiceImpl sellerService) {
        this.sellerService = sellerService;
    }

    public void setBookService(BookServiceImpl bookService) {
        this.bookService = bookService;
    }


    public String addBook() {

        request = ServletActionContext.getRequest();
        /**
         * 设置位置值bookId
         */
        int a = (int) (1 + Math.random() * (2000000000 - 1 + 1));
        book.setBookId(a);
        /**
         * 获取loginmail
         */
        String loginEmail = (String) ActionContext.getContext().getSession().get("user");
        book.setSellerEmail(loginEmail);

        /**
         * https://rain-bucket.oss-cn-beijing.aliyuncs.com/TB1xXwoaQRDDuNkUvNmwu0SypXa.png?x-oss-process=style/one
         * 获取图片路径 imagePath
         */

        System.out.println(book);

        //dGltZy5qcGc=1559378341731.jpg
        String imagePath = new OssUtil().upload(this.image, this.imageFileName);
        imagePath = "https://rain-bucket.oss-cn-beijing.aliyuncs.com/" + imagePath + "?x-oss-process=style/one";
        System.out.println(imagePath);
        book.setBookImg(imagePath);
        /**
         * 获取seller信息
         * 设置bookshelfAddres 和
         */

        Seller seller = sellerService.find(loginEmail);
        book.setBookshelfAddress(seller.getBookshelfAddress());
        /**
         * 设置时间
         */
        book.setCreateTime(new java.sql.Date(System.currentTimeMillis()));

        /**
         * 设置类型
         */
        String typeNo1 = "";
        int category1 = Integer.parseInt(request.getParameter("category1"));
        int category2 = Integer.parseInt(request.getParameter("category2"));

        if (category1 == -1) {
            typeNo1 += "无";
        } else {
            typeNo1 += new sz().category[category1];
            if (category2 == -1) {
                typeNo1 += " ";
            } else {
                typeNo1 += " " + new sz().categorySecond[category1][category2];
            }
        }
        book.setTypeNo1(typeNo1);
        /**
         * 默认设置
         *
         */
        book.setStatus(0);
        System.out.println(book);
        bookService.save(book);

        return SUCCESS;
    }

    /**
     * searchByType
     */
    public String searchByType() {
        request = ServletActionContext.getRequest();

        String type = request.getParameter("type") == null ? "" : request.getParameter("type");
        List<Books> bookList = bookService.findByType(type);
        if (bookList != null) {
            session = ActionContext.getContext().getSession();
            session.put("bookList", bookList);

        } else {
            this.addFieldError("bookListNullError", "没有该类型的书");
        }
        return "searchByType";
    }


    /**
     * 下架图书
     *
     * @return
     */

    public String offShelfBook() {
        session = ActionContext.getContext().getSession();
        String email = (String) session.get("user");
        request = ServletActionContext.getRequest();
        int bookId = Integer.parseInt(request.getParameter("bookId") == null ? "0" : request.getParameter("bookId"));
        System.out.println("正在下架。。。" + email + bookId);
        bookService.offShelfBook(email, bookId);
        return "offShelfBooksSuccess";
    }

    /**
     * 上加图书
     *
     * @return
     */

    public String onShelfBook() {
        session = ActionContext.getContext().getSession();
        String email = (String) session.get("user");
        request = ServletActionContext.getRequest();

        int bookId = Integer.parseInt(request.getParameter("bookId") == null ? "0" : request.getParameter("bookId"));

        System.out.println("正在上架。。。" + email + bookId);
        bookService.onShelfBook(email, bookId);
        return "onShelfBooksSuccess";
    }

    /**
     * 编辑图书
     *
     * @return
     */
    public String deleteBook() {
        session = ActionContext.getContext().getSession();
        String email = (String) session.get("user");
        request = ServletActionContext.getRequest();

        int bookId = Integer.parseInt(request.getParameter("bookId") == null ? "0" : request.getParameter("bookId"));

        bookService.delete(email, bookId);
        return "deleteBook";
    }

    @Override
    public Books getModel() {
        return book;
    }


    @Test
    public void test() {
        System.out.println(new sz().category[0]);
        System.out.println(new sz().categorySecond[0][2]);

    }

    public File getImage() {
        return image;
    }

    public void setImage(File image) {
        this.image = image;
    }

    public String getImageFileName() {
        return imageFileName;
    }

    public void setImageFileName(String imageFileName) {
        this.imageFileName = imageFileName;
    }

    public String getImageContentType() {
        return imageContentType;
    }

    public void setImageContentType(String imageContentType) {
        this.imageContentType = imageContentType;
    }


}

class sz {
    String[] category = new String[]{"文学综合类", "童书类", "教育类", "人文社科类", "经管综合类", "励志成功类", "生活类", "艺术类", "科技类", "计算机类"};

    String[][] categorySecond = new String[][]
            {
                    {"小说", "文学", "传记", "青春", "动漫", "科幻", "悬疑", "散文", "纪实", "惊悚"},
                    {"0-2", "3-6", "7-10", "11-14", "绘本", "科普百科", "儿童文学", "幼儿启蒙", "动漫卡通", "少儿英语", "中小教辅", "外语学习"},
                    {"中小教辅", "外语学习", "考试", "教材", "字典词典", "课外读物", "字帖", "考研", "初级会计", "教师资格"},
                    {"政治军事", "国学古籍", "历史", "心理", "宗教哲学", "社会科学", "文化", "法律"},
                    {"管理", "经济", "投资", "会计", "营销"},
                    {"女性励志", "心灵鸡汤", "社交", "口才"},
                    {"预产胎教", "育儿家教", "健身保健", "旅游地图", "休闲娱乐", "婚姻两性"},
                    {"绘画", "书法", "摄影", "音乐", "设计"},
                    {"科普", "工业", "建筑", "医学", "电子"},
                    {"编程语言", "办公软件", "信息安全", "人工智能", "操作系统", "数据库"}
            };
}
