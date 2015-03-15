package org.bright.sepe.bean;

import java.util.List;

import org.bright.sepe.entity.OrderInfo;
import org.bright.sepe.entity.ProductType;
import org.bright.sepe.entity.SubOrder;
import org.bright.sepe.entity.Tosection;
import org.smart4j.framework.core.bean.BaseBean;

public class OrderBean extends BaseBean {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    private OrderInfo order;
    private ProductType productType;
    private List<SubOrder> subOrderList;
    private List<Tosection> tosectionList;


	public OrderBean(OrderInfo order, ProductType productType, List<SubOrder> subOrderList, List<Tosection> tosectionList) {
        this.order = order;
        this.productType = productType;
        this.subOrderList = subOrderList;
        this.tosectionList = tosectionList;
    }

    public OrderInfo getOrder() {
        return order;
    }

    public void setOrder(OrderInfo order) {
        this.order = order;
    }

    public ProductType getProductType() {
        return productType;
    }

    public void setProductType(ProductType productType) {
        this.productType = productType;
    }

	/**
	 * @return the subOrderList
	 */
	public List<SubOrder> getSubOrderList() {
		return subOrderList;
	}

	/**
	 * @param subOrderList the subOrderList to set
	 */
	public void setSubOrderList(List<SubOrder> subOrderList) {
		this.subOrderList = subOrderList;
	}

	/**
	 * @return the tosectionList
	 */
	public List<Tosection> getTosectionList() {
		return tosectionList;
	}

	/**
	 * @param tosectionList the tosectionList to set
	 */
	public void setTosectionList(List<Tosection> tosectionList) {
		this.tosectionList = tosectionList;
	}
}
