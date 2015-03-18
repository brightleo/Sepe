package org.bright.sepe.action;

import java.util.List;
import java.util.Map;

import org.bright.sepe.entity.Salesman;
import org.bright.sepe.service.UserService;
import org.smart4j.framework.ioc.annotation.Inject;
import org.smart4j.framework.mvc.DataContext;
import org.smart4j.framework.mvc.annotation.Action;
import org.smart4j.framework.mvc.annotation.Request;
import org.smart4j.framework.mvc.bean.Params;
import org.smart4j.framework.mvc.bean.Result;
import org.smart4j.framework.mvc.bean.View;
import org.smart4j.plugin.security.annotation.HasRoles;

@Action
public class SalesmanAction {

    @Inject
    private UserService userService;

    @Request.Get("/salesman")
    public View index() {
        List<Salesman> salesmanList = userService.findSalesmanList();
        DataContext.Request.put("salesmanList", salesmanList);
        return new View("salesman.jsp");
    }

    @HasRoles("admin")
    @Request.Put("/salesman/save")
    public Result save(Params params) {
        Map<String, Object> fieldMap = params.getFieldMap();
        boolean result = userService.saveSalesman(fieldMap);
        return new Result(result);
    }
}
