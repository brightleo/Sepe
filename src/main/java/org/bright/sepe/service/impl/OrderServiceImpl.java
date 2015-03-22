package org.bright.sepe.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.bright.sepe.bean.OrderBean;
import org.bright.sepe.bean.ProductTypeBean;
import org.bright.sepe.entity.OrderInfo;
import org.bright.sepe.entity.ProductType;
import org.bright.sepe.entity.SubOrder;
import org.bright.sepe.entity.Tosection;
import org.bright.sepe.service.LogService;
import org.bright.sepe.service.OrderService;
import org.bright.sepe.utils.ConvertUtils;
import org.smart4j.framework.dao.DatabaseHelper;
import org.smart4j.framework.dao.SqlHelper;
import org.smart4j.framework.dao.bean.Pager;
import org.smart4j.framework.ioc.annotation.Inject;
import org.smart4j.framework.mvc.bean.Multipart;
import org.smart4j.framework.orm.DataSet;
import org.smart4j.framework.tx.annotation.Service;
import org.smart4j.framework.tx.annotation.Transaction;

@Service
public class OrderServiceImpl implements OrderService {

    @Inject
    private LogService logService;

    @Override
    @Transaction
    public boolean createOrder(Map<String, Object> fieldMap, Multipart multipart) {
        fieldMap = setProductTypeInfoToMap(fieldMap);
        Map<String, Object> orderMap = ConvertUtils.ConvertFromMapToOrderInfo(fieldMap);
        boolean result = DataSet.insert(OrderInfo.class, orderMap);
        
        List<Map<String, Object>> subOrderList = ConvertUtils.ConvertFromMapToSubOrderList(fieldMap);
        for (Map<String, Object> map : subOrderList) {
        	result = DataSet.insert(SubOrder.class, map);
        }

        List<Map<String, Object>> tosectionList = ConvertUtils.ConvertFromMapToTosectionList(fieldMap);
        for (Map<String, Object> map : tosectionList) {
        	result = DataSet.insert(Tosection.class, map);
        }

        return result;
    }

    @Override
    @Transaction
	public boolean deleteOrder(long id) {
    	OrderInfo order = DataSet.select(OrderInfo.class, "id = ?", id);
    	String code = order.getCode();
		DataSet.delete(SubOrder.class, "code = ?", code);
		DataSet.delete(Tosection.class, "code = ?", code);
		return  DataSet.delete(order);
	}

    @Override
    @Transaction
    public boolean updateOrder(long id, Map<String, Object> fieldMap, Multipart multipart) {
        fieldMap = setProductTypeInfoToMap(fieldMap);
        Map<String, Object> orderMap = ConvertUtils.ConvertFromMapToOrderInfo(fieldMap);
        boolean result = DataSet.update(OrderInfo.class, orderMap, "id = ?", id);

        List<Map<String, Object>> subOrderList = ConvertUtils.ConvertFromMapToSubOrderList(fieldMap);
        DataSet.delete(SubOrder.class, "code = ?", orderMap.get("code"));
        for (Map<String, Object> map : subOrderList) {
        	result = DataSet.insert(SubOrder.class, map);
        }

        List<Map<String, Object>> tosectionList = ConvertUtils.ConvertFromMapToTosectionList(fieldMap);
        DataSet.delete(Tosection.class, "code = ?", orderMap.get("code"));
        for (Map<String, Object> map : tosectionList) {
        	result = DataSet.insert(Tosection.class, map);
        }
        logService.log("update order by id is " + id);
        return result;
    }

    @Override
    public OrderInfo getOrder(long id) {
        return DataSet.select(OrderInfo.class, "id = ?", id);
    }

    @Override
    public OrderInfo getOrder(String code) {
        return DataSet.select(OrderInfo.class, "code = ?", code);
    }
    @Override
    public OrderBean getOrderBean(long id) {
        OrderBean orderBean = null;
        OrderInfo order = getOrder(id);
        if (order != null) {
        	List<SubOrder> subOrderList = getSubOrderList(order.getCode());
        	List<Tosection> tosectionList = getTosectionList(order.getCode());
            ProductType productType = DataSet.select(ProductType.class, "name = ?", order.getSubProductType());
			orderBean = new OrderBean(order, productType, subOrderList, tosectionList);
        }
        return orderBean;
    }

    @Override
    public Pager<OrderBean> getOrderBeanPager(int pageNumber, int pageSize, String param, String product, String status, String orderby) {
		String condition = "(name like ? or sub_product_type like ? or salesman like ? or customer like ? or customer_orderid like ? ) and status like ? and product_type like ?";
        String sort = "code " + orderby;
        Object[] params = {"%" + param + "%", "%" + param + "%", "%" + param + "%", "%" + param + "%", "%" + param + "%", "%" + status + "%", "%" + product + "%"};

        long count = DataSet.selectCount(OrderInfo.class, condition, params);
        List<OrderBean> orderBeanList = new ArrayList<OrderBean>();
        List<OrderInfo> orderList = DataSet.selectListForPager(pageNumber, pageSize, OrderInfo.class, condition, sort, params);
        for (OrderInfo order : orderList) {
            orderBeanList.add(new OrderBean(order, null, null, null));
        }
        return new Pager<OrderBean>(pageNumber, pageSize, count, orderBeanList);
    }

    @Override
    public List<ProductType> getSubProductTypeList() {
        return DataSet.selectListWithCondition(ProductType.class, "parentname != ?", "root");
    }

	@Override
	public List<SubOrder> getSubOrderList(String code) {
		String condition = "code = ?";
		return DataSet.selectListWithConditionAndSort(SubOrder.class, condition, "shipmentcode ASC", code);
	}

	@Override
	public List<Tosection> getTosectionList(String code) {
		String condition = "code = ?";
		return DataSet.selectListWithConditionAndSort(Tosection.class, condition, "tosectiondate ASC", code);
	}

	@Override
	@Transaction
	public boolean saveProductType(Map<String, Object> fieldMap) {
		boolean result = true;
		result = DataSet.delete(ProductType.class, "id > ?", 0);
		List<ProductTypeBean> productList =  ConvertUtils.ConvertFromMapToProductTypeList(fieldMap);
		for (ProductTypeBean bean : productList) {
			result = DataSet.insert(bean.getProductType());
			for(ProductType type : bean.getProductTypeList()) {
				result = DataSet.insert(type);
			}
		}
		return result;
	}

    @Override
    public ProductType getProductType(String id) {
        if (StringUtils.isEmpty(id)) {
            return null;
        }
        return DataSet.select(ProductType.class, "id = ?", id);
    }
    
    private Map<String, Object> setProductTypeInfoToMap(Map<String, Object> fieldMap){
        ProductType productType = getProductType(fieldMap.get("productTypeId").toString());
        fieldMap.put("productType", productType.getParentname());
        fieldMap.put("subProductType", productType.getName());
        return fieldMap;
    }

	@Override
	public List<ProductTypeBean> getProductTypeList() {
		List<ProductType> productTypeList = DataSet
				.selectList(ProductType.class);
		List<ProductType> parentProductTypeList = DataSet
				.selectListWithCondition(ProductType.class, "parentname = ?",
						"root");
		return ConvertUtils.ConvertToProductTypeBeanList(parentProductTypeList,
				productTypeList);
	}

	@Override
	public Object[] getChartInfo(Map<String, Object> fieldMap) {
		int chartType = Integer.parseInt(fieldMap.get("chartType").toString());
		Object year = fieldMap.get("chartTypeYear");
		Object mon = fieldMap.get("chartTypeM");
		List<Object[]> sumList = null;
		if (chartType == 1) {
			int chart_time = Integer.parseInt(fieldMap.get("chart_time").toString());
			if(chart_time == 0) {
				String sql = SqlHelper.getSql("SELECT_ORDER_Y_GROUP_BY_TYPE");
				sumList = DatabaseHelper.queryArrayList(sql, year);
			} else {
				String sql = SqlHelper.getSql("SELECT_ORDER_M_GROUP_BY_TYPE");
				sumList = DatabaseHelper.queryArrayList(sql, year, mon);
			}
		} else if (chartType == 2) {
			int chart_time = Integer.parseInt(fieldMap.get("chart_time").toString());
			int amount_type = Integer.parseInt(fieldMap.get("amount_type").toString());
			if (chart_time == 0) {
				String sql = "";
				if (amount_type == 0){
					sql = SqlHelper.getSql("SELECT_ORDER_Y_GROUP_BY_SALES");
				} else {
					sql = SqlHelper.getSql("SELECT_ORDER_B_Y_GROUP_BY_SALES");
				}
				sumList = DatabaseHelper.queryArrayList(sql, year);
			} else {
				String sql = "";
				if (amount_type == 0){
					sql = SqlHelper.getSql("SELECT_ORDER_M_GROUP_BY_SALES");
				} else {
					sql = SqlHelper.getSql("SELECT_ORDER_B_M_GROUP_BY_SALES");
				}	
				sumList = DatabaseHelper.queryArrayList(sql, year, mon);
			}
		} else if (chartType == 3 && isNotEmpty(year)) {
			String salesman = fieldMap.get("salesman").toString();
			String sql = SqlHelper.getSql("SELECT_ORDER_Y_GROUP_BY_MON");
			sumList = DatabaseHelper.queryArrayList(sql, year, salesman);
			List<Object[]> list1 = new ArrayList<Object[]>();
			List<Object[]> list2 = new ArrayList<Object[]>();
			ConvertUtils.ConvertToList(sumList, list1, list2);
			return ConvertUtils.ConvertToObject(ConvertUtils.ConvertForChart(list1), ConvertUtils.ConvertForChart(list2)); 
		} else if (chartType == 4) {
			String sql = SqlHelper.getSql("SELECT_ORDER_NOCOMPLETE_GROUP_BY_TYPE");
			sumList = DatabaseHelper.queryArrayList(sql);
		}
		return ConvertUtils.ConvertToObject(ConvertUtils.ConvertForChart(sumList), null);
	}
	
	private boolean isNotEmpty(Object o) {
		if(StringUtils.isEmpty(String.valueOf(o))){
			return false;
		} else {
			return true;
		}
	}
}
