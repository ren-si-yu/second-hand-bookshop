package com.bookshop.user.action;

import com.bookshop.user.entity.Address;
import com.bookshop.user.service.impl.BuyServiceImpl;
import com.bookshop.user.service.impl.UsersServiceImpl;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @ Author     : Rain
 * @ Classname  : AddressAction
 * @ Date       : 2019/6/3 19:02
 * @ Description:
 */

public class AddressAction extends ActionSupport {

    private BuyServiceImpl buyService;

    public void setBuyService(BuyServiceImpl buyService) {
        this.buyService = buyService;
    }

    private UsersServiceImpl usersService;

    private Map<String, Object> session;

    public void setUsersService(UsersServiceImpl usersService) {
        this.usersService = usersService;
    }

    private HttpServletRequest request;

    private Address address;

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    /**
     * 可以添加也可以修改 用saveorupdate
     *
     * @return
     */
    public String addAddress() {
        session = ActionContext.getContext().getSession();
        String loginEmail = (String) session.get("user");

        if (loginEmail == null)
            return "404";
        address.setLoginEmail(loginEmail);
        System.out.println(address);
        if (address != null) {
            buyService.saveAddress(address);
        }
        //添加完了之后，返回到查询界面
        return "addAddress";
    }

    public String searchAddress() {
        session = ActionContext.getContext().getSession();
        String loginEmail = (String) session.get("user");
        if (loginEmail == null)
            return "404";
        List<Address> addressList = buyService.searchAddress(loginEmail);
        session.put("addressList", addressList);
        if (addressList != null) {
            return "searchAddress";
        }

        return "404";
    }

    public String updateAddress() {
        request = ServletActionContext.getRequest();
        String id = request.getParameter("id");
        Address address = new Address();
        if (id != null) {
            buyService.firstAddress(id);
        }
        return "updateAddress";
    }

    public String delAddress() {
        return "delAddress";
    }

}
