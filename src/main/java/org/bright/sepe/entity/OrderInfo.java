package org.bright.sepe.entity;

import org.smart4j.framework.orm.annotation.Entity;

@Entity
public class OrderInfo {

	private long id;
	/** 项目号 **/
	public String code;
	/** 项目名称 **/
	public String name;
	/** 产品类别 **/
	public String productType;
    /** 产品类别 **/
    public String subProductType;
	/** 业务员 **/
	public String salesman;
	/** 客户 **/
	public String customer;
	/** 客户订单号 **/
	public String customerOrderid;
	/** 订货日期 **/
	public String orderdate;
	/** 预计交货日期 **/
	public String deliverydate;
	/** 付款方式 **/
	public String paymenttype;
	/** 合同金额 **/
    public String orderamount;
	/** 合同数量 **/
	public String orderQuantity;
	/** 发货金额 **/
    public String shipmentamount;
	/** 开票金额 **/
    public String billingamount;
	/** 到款金额 **/
	public String tosectionamount;
	/** 状态 **/
	public int status;
	/** 备注 **/
	public String comment;

	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * @return the code
	 */
	public String getCode() {
		return code;
	}

	/**
	 * @param orderid
	 *            the code to set
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
     * @return the productType
     */
    public String getProductType() {
        return productType;
    }

    /**
     * @param productType the productType to set
     */
    public void setProductType(String productType) {
        this.productType = productType;
    }

    /**
     * @return the subProductType
     */
    public String getSubProductType() {
        return subProductType;
    }

    /**
     * @param subProductType the subProductType to set
     */
    public void setSubProductType(String subProductType) {
        this.subProductType = subProductType;
    }

    /**
	 * @return the salesman
	 */
	public String getSalesman() {
		return salesman;
	}

	/**
	 * @param salesman
	 *            the salesman to set
	 */
	public void setSalesman(String salesman) {
		this.salesman = salesman;
	}

	/**
	 * @return the customer
	 */
	public String getCustomer() {
		return customer;
	}

	/**
	 * @param customer
	 *            the customer to set
	 */
	public void setCustomer(String customer) {
		this.customer = customer;
	}

	/**
	 * @return the customerOrderid
	 */
	public String getCustomerOrderid() {
		return customerOrderid;
	}

	/**
	 * @param customerOrderid
	 *            the customerOrderid to set
	 */
	public void setCustomerOrderid(String customerOrderid) {
		this.customerOrderid = customerOrderid;
	}

	/**
	 * @return the orderdate
	 */
	public String getOrderdate() {
		return orderdate;
	}

	/**
	 * @param orderdate
	 *            the orderdate to set
	 */
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}

	/**
	 * @return the deliverydate
	 */
	public String getDeliverydate() {
		return deliverydate;
	}

	/**
	 * @param deliverydate
	 *            the deliverydate to set
	 */
	public void setDeliverydate(String deliverydate) {
		this.deliverydate = deliverydate;
	}

	/**
	 * @return the comment
	 */
	public String getComment() {
		return comment;
	}

	/**
	 * @param comment
	 *            the comment to set
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}

	/**
	 * @return the paymenttype
	 */
	public String getPaymenttype() {
		return paymenttype;
	}

	/**
	 * @param paymenttype
	 *            the paymenttype to set
	 */
	public void setPaymenttype(String paymenttype) {
		this.paymenttype = paymenttype;
	}

	/**
	 * @return the orderamount
	 */
	public String getOrderamount() {
		return orderamount;
	}

	/**
	 * @param orderamount the orderamount to set
	 */
	public void setOrderamount(String orderamount) {
		this.orderamount = orderamount;
	}

	/**
	 * @return the orderQuantity
	 */
	public String getOrderQuantity() {
		return orderQuantity;
	}

	/**
	 * @param orderQuantity the orderQuantity to set
	 */
	public void setOrderQuantity(String orderQuantity) {
		this.orderQuantity = orderQuantity;
	}

	/**
	 * @return the shipmentamount
	 */
	public String getShipmentamount() {
		return shipmentamount;
	}

	/**
	 * @param shipmentamount the shipmentamount to set
	 */
	public void setShipmentamount(String shipmentamount) {
		this.shipmentamount = shipmentamount;
	}

	/**
	 * @return the billingamount
	 */
	public String getBillingamount() {
		return billingamount;
	}

	/**
	 * @param billingamount the billingamount to set
	 */
	public void setBillingamount(String billingamount) {
		this.billingamount = billingamount;
	}

	/**
	 * @return the tosectionamount
	 */
	public String getTosectionamount() {
		return tosectionamount;
	}

	/**
	 * @param tosectionamount the tosectionamount to set
	 */
	public void setTosectionamount(String tosectionamount) {
		this.tosectionamount = tosectionamount;
	}

	/**
	 * @return the status
	 */
	public int getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(int status) {
		this.status = status;
	}


}
