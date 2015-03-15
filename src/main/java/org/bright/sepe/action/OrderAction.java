package org.bright.sepe.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.bright.sepe.Constant;
import org.bright.sepe.Tool;
import org.bright.sepe.bean.OrderBean;
import org.bright.sepe.entity.Customer;
import org.bright.sepe.entity.OrderInfo;
import org.bright.sepe.entity.ProductType;
import org.bright.sepe.entity.Salesman;
import org.bright.sepe.entity.SubOrder;
import org.bright.sepe.service.OrderService;
import org.bright.sepe.service.UserService;
import org.bright.sepe.utils.ConvertUtils;
import org.smart4j.framework.dao.bean.Pager;
import org.smart4j.framework.ioc.annotation.Inject;
import org.smart4j.framework.mvc.annotation.Action;
import org.smart4j.framework.mvc.annotation.Request;
import org.smart4j.framework.mvc.bean.Multipart;
import org.smart4j.framework.mvc.bean.Multiparts;
import org.smart4j.framework.mvc.bean.Params;
import org.smart4j.framework.mvc.bean.Result;
import org.smart4j.framework.mvc.bean.View;
import org.smart4j.plugin.security.annotation.HasPermissions;
import org.smart4j.plugin.security.annotation.HasRoles;

@Action
public class OrderAction {

    @Inject
    private OrderService orderService;
    @Inject
    private UserService userService;

    @Request.Get("/orders")
    public View index() {
        int pageNumber = 1;
        int pageSize = Tool.getPageSize("order_pager");
        String name = "";
        String status = "";
        String sort = "desc";
        Pager<OrderBean> orderBeanPager = orderService.getOrderBeanPager(pageNumber, pageSize, name, status, sort);
        return new View("order.jsp")
            .data("orderBeanPager", orderBeanPager).data("order", sort);
    }

    @Request.Post("/order/search")
    public View search(Params params) {
        int pageNumber = params.getInt(Constant.PAGE_NUMBER);
        int pageSize = params.getInt(Constant.PAGE_SIZE);
        String name = params.getString("name");
        String orderby = params.getString("orderby");
        String status = params.getString("status");
        Pager<OrderBean> orderBeanPager = orderService.getOrderBeanPager(pageNumber, pageSize, name, status, orderby);
        return new View("order_list.jsp")
            .data("orderBeanPager", orderBeanPager).data("order", orderby).data("status",status);
    }
    @HasPermissions("order.create")
    @Request.Get("/order/create")
    public View create() {
        List<ProductType> productTypeList = orderService.getSubProductTypeList();
        List<Salesman> salesmanList = userService.findSalesmanList();
        List<Customer> customerList = userService.findCustomerList();
        String customerNames = ConvertUtils.ConvertToJsonDataForCustomer(customerList);
        List<SubOrder> subOrderList = new ArrayList<SubOrder>();
        return new View("order_create.jsp")
            .data("productTypeList", productTypeList)
            .data("subOrderList", subOrderList)
            .data("salesmanList",salesmanList)
            .data("customerNames",customerNames);
    }

    @HasPermissions("order.create")
    @Request.Post("/order/create")
    public Result create(Params params, Multiparts multiparts) {
        Map<String, Object> fieldMap = params.getFieldMap();
        Multipart multipart = multiparts.getOne();
        boolean success = orderService.createOrder(fieldMap, multipart);
        return new Result(success);
    }
    @HasPermissions("order.create")
    @Request.Post("/order/validate/{code}")
    public Result validate(String code) {
    	OrderInfo order = orderService.getOrder(code);
    	return new Result(order == null ? true : false);
    }
    @HasPermissions("order.delete")
    @Request.Delete("/order/delete/{id}")
    public Result delete(long id) {
        boolean success = orderService.deleteOrder(id);
        return new Result(success);
    }

    @HasPermissions("order.view")
    @Request.Get("/order/view/{id}")
    public View view(long id) {
        OrderBean orderBean = orderService.getOrderBean(id);
        List<ProductType> productTypeList = orderService.getSubProductTypeList();
        return new View("order_view.jsp")
            .data("orderBean", orderBean).data("productTypeList", productTypeList);
    }

    @HasPermissions("order.edit")
    @Request.Get("/order/edit/{id}")
    public View edit(long id) {
        List<ProductType> productTypeList = orderService.getSubProductTypeList();
        List<Salesman> salesmanList = userService.findSalesmanList();
        OrderBean orderBean = orderService.getOrderBean(id);
        List<Customer> customerList = userService.findCustomerList();
        String customerNames = ConvertUtils.ConvertToJsonDataForCustomer(customerList);
        return new View("order_edit.jsp")
            .data("productTypeList", productTypeList)
            .data("orderBean", orderBean)
            .data("salesmanList",salesmanList)
            .data("customerNames",customerNames);
    }

    @HasRoles("admin")
    @Request.Put("/order/update/{id}")
    public Result update(long id, Params params) {
        Map<String, Object> fieldMap = params.getFieldMap();
        boolean success = orderService.updateOrder(id, fieldMap, null);
        return new Result(success);
    }

    @Request.Get("/charts")
    public View chart() {
    	List<Salesman> salesmanList = userService.findSalesmanList();
        return new View("order_chart.jsp").data("salesmanList", salesmanList);
    }
    @Request.Post("/chart/json")
    public Result getChartInfo(Params params) {
    	Object[][] chartObjs = orderService.getChartInfo(params.getFieldMap());
    	Result result = new Result(true);
    	result.setData(chartObjs);
        return result;
    }
}
