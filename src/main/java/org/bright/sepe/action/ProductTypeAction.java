package org.bright.sepe.action;

import java.util.List;
import java.util.Map;

import org.bright.sepe.bean.ProductTypeBean;
import org.bright.sepe.service.OrderService;
import org.smart4j.framework.ioc.annotation.Inject;
import org.smart4j.framework.mvc.annotation.Action;
import org.smart4j.framework.mvc.annotation.Request;
import org.smart4j.framework.mvc.bean.Params;
import org.smart4j.framework.mvc.bean.Result;
import org.smart4j.framework.mvc.bean.View;
import org.smart4j.plugin.security.annotation.HasRoles;

@Action
@HasRoles("admin")
public class ProductTypeAction {

    @Inject
    private OrderService orderService;
    @HasRoles("admin")
    @Request.Get("/productTypes")
    public View index() {
    	List<ProductTypeBean> beanList = orderService.getProductTypeList();
		return new View("producttypes.jsp").data("productTypeBeanList",
				beanList);
    }

    @HasRoles("admin")
    @Request.Put("/productType/save")
    public Result save(Params params) {
        Map<String, Object> fieldMap = params.getFieldMap();
        boolean result = orderService.saveProductType(fieldMap);
        return new Result(result);
    }
}
