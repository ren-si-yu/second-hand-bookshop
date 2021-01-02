package com.bookshop.user.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @ Author     : Rain
 * @ Classname  : SellerFilter
 * @ Date       : 2019/5/31 9:27
 * @ Description:
 */

public class SellerFilter implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
                         FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        //获取根目录所对应的绝对路径
        String currentURL = request.getRequestURI();
        HttpSession session = request.getSession(false);

        //如果直接访问购物车shopCart页面则验证
        if (currentURL.indexOf("seller_checkSeller.action") > -1 ) {
            //判断当前页是否是重定向以后的登录页面，如果是就不判断session
            if (session == null || session.getAttribute("user") == null) {
                response.sendRedirect(request.getContextPath() + "/Login.jsp");
                return;
            }

        }
        filterChain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }

}
