package org.bright.sepe.service;

import java.util.List;
import java.util.Map;

import org.bright.sepe.bean.OrderBean;
import org.bright.sepe.bean.ProductTypeBean;
import org.bright.sepe.entity.OrderInfo;
import org.bright.sepe.entity.ProductType;
import org.bright.sepe.entity.SubOrder;
import org.bright.sepe.entity.Tosection;
import org.smart4j.framework.dao.bean.Pager;
import org.smart4j.framework.mvc.bean.Multipart;

public interface OrderService {

    boolean createOrder(Map<String, Object> fieldMap, Multipart multipart);

    boolean deleteOrder(long id);

    boolean updateOrder(long id, Map<String, Object> fieldMap, Multipart multipart);

    OrderInfo getOrder(long id);

    OrderInfo getOrder(String code);

    OrderBean getOrderBean(long id);

    Pager<OrderBean> getOrderBeanPager(int pageNumber, int pageSize, String name, String product, String status, String orderby);

    List<ProductType> getSubProductTypeList();
    
    List<ProductTypeBean> getProductTypeList();
    
    ProductType getProductType(String id);
    
    boolean saveProductType(Map<String, Object> fieldMap);
    
    List<SubOrder> getSubOrderList(String code);

    List<Tosection> getTosectionList(String code);
    
    Object[] getChartInfo(Map<String, Object> fieldMap);
}
