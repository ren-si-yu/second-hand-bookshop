package com.bookshop.user.interceptor;

import com.bookshop.user.entity.Users;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import java.util.Map;

public class UserInterceptor extends AbstractInterceptor {

    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
        // 取得用户会话，获取用户会话信息
        Map session = invocation.getInvocationContext().getSession();
        if (session == null) {   // 如果Session为空，则让用户登录
            return "login";
        } else {
            Users user = (Users) session.get("user");
            if (user == null) {
                // 返回‘login’字符串，终止执行，返回登录页面
                return "login";
            } else {
                // 用户登录，放行，继续执行剩余的拦截器和Action
                return invocation.invoke();
            }
        }
    }
}
