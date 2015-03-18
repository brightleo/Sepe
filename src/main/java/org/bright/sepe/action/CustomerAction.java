package org.bright.sepe.action;

import java.util.List;
import java.util.Map;

import org.bright.sepe.Constant;
import org.bright.sepe.Tool;
import org.bright.sepe.entity.Customer;
import org.bright.sepe.service.UserService;
import org.smart4j.framework.dao.bean.Pager;
import org.smart4j.framework.ioc.annotation.Inject;
import org.smart4j.framework.mvc.DataContext;
import org.smart4j.framework.mvc.annotation.Action;
import org.smart4j.framework.mvc.annotation.Request;
import org.smart4j.framework.mvc.bean.Params;
import org.smart4j.framework.mvc.bean.Result;
import org.smart4j.framework.mvc.bean.View;
import org.smart4j.plugin.security.annotation.HasRoles;

@Action
public class CustomerAction {

    @Inject
    private UserService userService;

    @Request.Get("/customers")
    public View index() {
        int pageNumber = 1;
        int pageSize = Tool.getPageSize("customer_pager");
        String name = "";
        Pager<Customer> customerPager = userService.getCustomerPager(pageNumber, pageSize, name);
        return new View("customer.jsp").data("customerPager", customerPager);
    }
    @Request.Post("/customer/search")
    public View search(Params params) {
        int pageNumber = params.getInt(Constant.PAGE_NUMBER);
        int pageSize = params.getInt(Constant.PAGE_SIZE);
        String name = params.getString("name");
        Pager<Customer> customerPager = userService.getCustomerPager(pageNumber, pageSize, name);
        return new View("customer_list.jsp")
            .data("customerPager", customerPager);
    }

    @Request.Get("/customer")
    public View create() {
    	List<Customer> customerList = userService.findCustomerList();
        return new View("customer_create.jsp").data("id", customerList.size() + 1 );
    }
    
    @HasRoles("admin")
    @Request.Post("/customer")
    public Result save(Params params) {
        Map<String, Object> fieldMap = params.getFieldMap();
        boolean result = userService.saveCustomer(fieldMap);
        return new Result(result);
    }
    
    @Request.Get("/customer/{id}")
    public View edit(long id) {
    	Customer customer = userService.findCustomer(id);
    	DataContext.Request.put("customer", customer);
        return new View("customer_edit.jsp");
    }

    @Request.Put("/customer/{id}")
    public Result update(long id, Params params) {
        Map<String, Object> fieldMap = params.getFieldMap();
        boolean result = userService.updateCustomer(id, fieldMap);
        return new Result(result);
    }
    @Request.Delete("/customer/{id}")
    public Result delete(long id) {
        boolean result = userService.deleteCustomer(id);
        return new Result(result);
    }
}
