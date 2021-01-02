package com.bookshop.utils;


import com.bookshop.user.entity.Users;
import com.bookshop.user.service.UsersService;
import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 * cookie的增加、删除、查询
 */
public class CookieUtils {
    public static final String USER_COOKIE = "user.cookie";

    public Cookie addCookie(Users user) {

        //加密
        Cookie cookie = new Cookie(USER_COOKIE, user.getLoginEmail() + "#"
                + Base64Util.encode(user.getLoginPwd()));
        cookie.setMaxAge(60 * 60 * 24 * 14);// cookie保存两周
        return cookie;
    }

    public Cookie getCookie(HttpServletRequest request, UsersService usersService) {
        Cookie[] cookies = request.getCookies();
        System.out.println("cookies: " + cookies);
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                System.out.println("cookie: " + cookie.getName());
                if (CookieUtils.USER_COOKIE.equals(cookie.getName())) {
                    String value = cookie.getValue();
                    if (StringUtils.isNotBlank(value)) {
                        System.out.println("value" + value);
                        String[] split = value.split("#");
                        String username = split[0];
                        //解密
                        String password = Base64Util.decode(split[1]);
                        Users user = usersService.checkUser(username, password);
                        if (user != null) {
                            ActionContext.getContext().getSession().put("user", user.getLoginEmail());
                            return cookie;
                        }
                    }
                }
            }
        }
        return null;
    }

    /**
     * 不做测试
     *
     * @param request
     * @return
     */
    // 删除cookie
    public Cookie delCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (USER_COOKIE.equals(cookie.getName())) {
                    cookie.setValue("");
                    cookie.setMaxAge(0);
                    return cookie;
                }
            }
        }
        return null;
    }
}
