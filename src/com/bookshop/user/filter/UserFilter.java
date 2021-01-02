package com.bookshop.user.filter;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 需要在web.xml中配置
 */
public class UserFilter implements Filter {

    /**
     * 浏览量（PV）：店铺各页面被查看的次数。用户多次打开或刷新同一个页面，该指标值累加。
     * <p>
     * 访客数(UV)：全店各页面的访问人数。所选时间段内，同一访客多次访问会进行去重
     */

    private int uv;
    private FilterConfig filterConfig;


    public int getUv() {
        return uv;
    }

    public void setUv(int uv) {
        this.uv = uv;
    }


    @Override
    public void destroy() {
        // TODO Auto-generated method stub

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
                         FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        //获取根目录所对应的绝对路径
        String currentURL = request.getRequestURI();
        HttpSession session = request.getSession(false);
        if (currentURL.indexOf("Index.jsp") > -1){
            response.sendRedirect(request.getContextPath() + "/index");
            return;
        }

        //如果直接访问购物车shopCart页面则验证
        if (currentURL.indexOf("BuyCar.jsp") > -1 || currentURL.indexOf("Forget1.jsp") > -1 ||
                currentURL.indexOf("SellBook.jsp") > -1 || currentURL.indexOf("Address.jsp") > -1 ||
                currentURL.indexOf("kuaidi.jsp") > -1 || currentURL.indexOf("Order.jsp") > -1) {
            //判断当前页是否是重定向以后的登录页面，如果是就不判断session
            if (session == null || session.getAttribute("user") == null) {
                response.sendRedirect(request.getContextPath() + "/Login.jsp");
                return;
            }
        } /*currentURL.indexOf("page_") > -1 ||*/
        else if (currentURL.indexOf("address_") > -1 ||
                currentURL.indexOf("buy_") > -1 || currentURL.indexOf("book_") > -1 ||
                currentURL.indexOf("seller_") > -1 || currentURL.indexOf("alterPwd_") > -1 ||
                currentURL.indexOf("withdraw") > -1 ||
                currentURL.indexOf("personCenter") > -1||currentURL.indexOf("altPersonCenter") > -1) {
            //判断当前页是否是重定向以后的登录页面，如果是就不判断session
            if (session == null || session.getAttribute("user") == null) {
                response.sendRedirect(request.getContextPath() + "/Login.jsp");
                return;
            }

        } else if ( currentURL.indexOf("index") > -1) {
//            currentURL.replace("Index.jsp", "index");
            uv += 1;
            ServletContext servletContext = filterConfig.getServletContext();
            WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(servletContext);
            ctx.getServletContext().setAttribute("uv", uv);

        }
        //加入filter链继续向下执行
        filterChain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;


    }

}
