package com.bookshop.user.action;

import com.bookshop.user.entity.Category;
import com.bookshop.user.service.CategoryService;
import com.bookshop.user.service.impl.UsersServiceImpl;
import com.bookshop.utils.CookieUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @ Author     : Rain
 * @ Classname  : IndexAction
 * @ Date       : 2019/5/30 20:16
 * @ Description:
 */

public class IndexAction extends ActionSupport {


    private UsersServiceImpl usersService;

    public void setUsersService(UsersServiceImpl usersService) {
        this.usersService = usersService;
    }

    private CategoryService categoryService;
    private List<Category> categoriesList;
    private HttpServletRequest request = ServletActionContext.getRequest();
    private CookieUtils cookieUtils = new CookieUtils();

    public List<Category> getCategoriesList() {
        return categoriesList;
    }

    public void setCategoriesList(List<Category> categoriesList) {
        this.categoriesList = categoriesList;
    }

    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    /**
     * 1. 先判断又没有cookie
     * 2. 获取一二级分类
     * 3. 获取分页
     *
     * @return
     */
    @Override
    public String execute() throws Exception {
        //1. .....
        Map session = ActionContext.getContext().getSession();
        String loginEmail = (String) session.get("user");
        if (loginEmail == null) {
            Cookie cookie = cookieUtils.getCookie(request, usersService);
            System.out.println("cookie.getName()" + cookie.getValue());
            Map application = ActionContext.getContext().getApplication();
            int userCount = application.get("userCount") == null ? 0 : (int) application.get("userCount");
            userCount++;
            application.put("userCount", userCount);
        }


        /**
         * 用来判断登录状态
         */


        //2. ......
        categoriesList = categoryService.getCategory();
        session.put("categoriesList", categoriesList);

        /*Iterator<Category> iterator = categoriesList.iterator();
        while (iterator.hasNext()) {
            Category category = iterator.next();
            System.out.println(category.getCategoryName());
            Set<Categorysecond> categorysecondSet = category.getCategorysecond();
            Iterator<Categorysecond> iterator0 = categorysecondSet.iterator();
            while (iterator0.hasNext()) {
                Categorysecond categorysecond = iterator0.next();
                System.out.println(categorysecond.getCategorySecondName());

            }
        }*/
        return SUCCESS;
    }


    public String GetBuyCategories() {
        categoriesList = categoryService.getCategory();
        System.out.println("get");
        return "GetBuyCategories";
    }

}
