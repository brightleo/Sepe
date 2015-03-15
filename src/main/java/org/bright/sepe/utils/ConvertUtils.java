package org.bright.sepe.utils;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.bright.sepe.bean.ProductTypeBean;
import org.bright.sepe.entity.Customer;
import org.bright.sepe.entity.OrderInfo;
import org.bright.sepe.entity.ProductType;
import org.bright.sepe.entity.SubOrder;
import org.bright.sepe.entity.Tosection;

public class ConvertUtils {
    
    public static Map<String, Object> ConvertFromMapToOrderInfo(Map<String, Object> fieldMap) {
        Map<String, Object> orderInfoMap = new HashMap<String, Object>(); 
        Field[] fields = OrderInfo.class.getFields();
        for (Field field: fields) {
            String filedName = field.getName();
            Object value = fieldMap.get(filedName);
            if (value != null && !value.toString().isEmpty()) {
                orderInfoMap.put(filedName, value);
            }
        }
        return orderInfoMap;
    }
    
    public static List<Map<String, Object>> ConvertFromMapToSubOrderList (Map<String, Object> fieldMap) {
        
        List<Map<String, Object>> subOrderList = new ArrayList<Map<String, Object>>();
        Field[] fields = SubOrder.class.getFields();
        String shipmentcode = "shipmentcode";
        List<String> indexList = new ArrayList<String>();
        for(String key : fieldMap.keySet()) {
            if (key.startsWith(shipmentcode)) {
                indexList.add(key.replace(shipmentcode, ""));
            }
        }
        for(String index: indexList) {
            Map<String, Object> subOrderMap = new HashMap<String, Object>(); 
            for (Field field: fields) {
                String filedName = field.getName();
                Object value = fieldMap.get(filedName + index);
                if (value != null && !value.toString().isEmpty()) {
                    subOrderMap.put(filedName, value);
                }
            }
            if (subOrderMap.keySet().size() > 0) {
                subOrderMap.put("code", fieldMap.get("code"));
                subOrderList.add(subOrderMap);
            }
        }
        return subOrderList;
    }
    public static List<Map<String, Object>> ConvertFromMapToTosectionList (Map<String, Object> fieldMap) {
        List<Map<String, Object>> tosectionList = new ArrayList<Map<String, Object>>();
        Field[] fields = Tosection.class.getFields();
        String tosectionAmount = "tosectionAmount";
        List<String> indexList = new ArrayList<String>();
        for(String key : fieldMap.keySet()) {
            if (key.startsWith(tosectionAmount)) {
                indexList.add(key.replace(tosectionAmount, ""));
            }
        }
        for(String index: indexList) {
            Map<String, Object> tosectionMap = new HashMap<String, Object>(); 
            for (Field field: fields) {
                String filedName = field.getName();
                Object value = fieldMap.get(filedName + index);
                if (value != null && !value.toString().isEmpty()) {
                    tosectionMap.put(filedName, value);
                }
            }
            if (tosectionMap.keySet().size() > 0) {
                tosectionMap.put("code", fieldMap.get("code"));
                tosectionList.add(tosectionMap);
            }
        }
        return tosectionList;
    }
    public static List<String> ConvertFromMapToSalesmanList (Map<String, Object> fieldMap) {
        List<String> salesmanList = new ArrayList<String>();
        String name = "name";
        for(String key : fieldMap.keySet()) {
            if (key.startsWith(name)) {
                Object value = fieldMap.get(key);
                if(value != null && !StringUtils.isEmpty(value.toString())){
                    salesmanList.add(value.toString());
                }
            }
        }
        return salesmanList;
    }
    public static List<Map<String, Object>> ConvertFromMapToCustomerList (Map<String, Object> fieldMap) {
        List<Map<String, Object>> customerList = new ArrayList<Map<String, Object>>();
        Field[] fields = Customer.class.getFields();
        String name = "name";
        List<String> indexList = new ArrayList<String>();
        for(String key : fieldMap.keySet()) {
            if (key.startsWith(name)) {
                indexList.add(key.replace(name, ""));
            }
        }
        for(String index: indexList) {
            Map<String, Object> customerMap = new HashMap<String, Object>(); 
            for (Field field: fields) {
                String filedName = field.getName();
                Object value = fieldMap.get(filedName + index);
                if (value != null && !value.toString().isEmpty()) {
                    customerMap.put(filedName, value);
                }
            }
            if (customerMap.keySet().size() > 0) {
                customerList.add(customerMap);
            }
        }
        return customerList;
    }
    
    public static List<ProductTypeBean> ConvertFromMapToProductTypeList(Map<String, Object> fieldMap) {
        List<ProductTypeBean> productList = new ArrayList<ProductTypeBean>();
        String[] products = String.valueOf(fieldMap.get("producttype_value")).split(",");
        for (int i = 0; i < products.length; i++) {
            String[] productTypes = products[i].split("@@");
            ProductTypeBean productBean = new ProductTypeBean();
            List<ProductType> productTypeList = new ArrayList<ProductType>();
            ProductType productType = new ProductType();
            long parentId = (i + 1) * 100;
            for (int j = 0; j < productTypes.length; j++) {
                if (j == 0) {
                    productType.setId(parentId);
                    productType.setName(productTypes[0]);
                    productType.setParentname("root");
                    productBean.setProductType(productType);
                } else {
                    ProductType product = new ProductType();
                    product.setId(parentId + j);
                    product.setName(productTypes[j]);
                    product.setParentname(productType.getName());
                    productTypeList.add(product);
                }
            }
            productBean.setProductTypeList(productTypeList);
            productList.add(productBean);
        }
        return productList;
    }
    public static String ConvertToJsonDataForCustomer(List<Customer> customerList ) {
        String customerNames = "";
        for(Customer customer : customerList) {
            if (!StringUtils.isEmpty(customerNames)) {
                customerNames = customerNames + "&&&";
            }
            customerNames = customerNames + customer.getId() + "-"
                    + customer.getName() + "," + customer.getName();
        }

        return customerNames;
    }

	public static List<ProductTypeBean> ConvertToProductTypeBeanList(
			List<ProductType> parentProductTypeList,
			List<ProductType> productTypeList) {
		List<ProductTypeBean> beanList = new ArrayList<ProductTypeBean>();
		for (ProductType productType : parentProductTypeList) {
			ProductTypeBean bean = new ProductTypeBean();
			bean.setProductType(productType);
			List<ProductType> productTypes = new ArrayList<ProductType>();
			for (ProductType type : productTypeList) {
				if (type.getParentname().equals(productType.getName())) {
					productTypes.add(type);
				}
			}
			bean.setProductTypeList(productTypes);
			beanList.add(bean);
		}
		return beanList;
	}
	
	public static Object[][] ConvertForChart(List<Object[]> chartList) {
		int size = chartList.size();
		Object[][] chartObjs = new Object[chartList.size()][2];
		for (int i = 0; i<size; i++) {
			chartObjs[i] = chartList.get(i);
		}
		return chartObjs;
	}
	public static Object[][] ConvertForNotice(List<Object[]> noticeList) {
		int size = noticeList.size();
		Object[][] noticeObjs = new Object[noticeList.size()][2];
		for (int i = 0; i<size; i++) {
			noticeObjs[i] = noticeList.get(i);
		}
		return noticeObjs;
	}
	public static boolean isNumeric(String str){ 
		   Pattern pattern = Pattern.compile("[0-9]*"); 
		   Matcher isNum = pattern.matcher(str);
		   if( !isNum.matches() ){
		       return false; 
		   } 
		   return true; 
		}
}
