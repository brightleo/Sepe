package org.bright.sepe.entity;

import org.smart4j.framework.orm.annotation.Entity;

@Entity
public class SubOrder {

	public long id;
    /** 项目号 **/
    private String code;
    /** 发货单号 **/
    public String shipmentcode;
    /** 发货日期 **/
    public String shipmentdate;
    /** 发货产品 **/
    public String productName;
    /** 发货数量 **/
    public String quantity;
    /** 本次发货金额 **/
    public String unitprice;
    /** 开票申请编号 **/
    public String billingcode;
    /** 开票日期 **/
    public String billingdate;
    /** 发票号 **/
    public String invoicecode;
    /** 开票产品 **/
    public String billingProductName;
    /** 开票数量 **/
    public String billingQuantity;
    /** 本次开票金额 **/
    public String billingUnitprice;
    /**
     * @return the id
     */
    public long getId() {
        return id;
    }
    /**
     * @param id the id to set
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
     * @param code the code to set
     */
    public void setCode(String code) {
        this.code = code;
    }
    /**
     * @return the shipmentcode
     */
    public String getShipmentcode() {
        return shipmentcode;
    }
    /**
     * @param shipmentcode the shipmentcode to set
     */
    public void setShipmentcode(String shipmentcode) {
        this.shipmentcode = shipmentcode;
    }
    /**
     * @return the shipmentdate
     */
    public String getShipmentdate() {
        return shipmentdate;
    }
    /**
     * @param shipmentdate the shipmentdate to set
     */
    public void setShipmentdate(String shipmentdate) {
        this.shipmentdate = shipmentdate;
    }
    /**
     * @return the productName
     */
    public String getProductName() {
        return productName;
    }
    /**
     * @param productName the productName to set
     */
    public void setProductName(String productName) {
        this.productName = productName;
    }
    /**
     * @return the quantity
     */
    public String getQuantity() {
        return quantity;
    }
    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }
    /**
     * @return the unitprice
     */
    public String getUnitprice() {
        return unitprice;
    }
    /**
     * @param unitprice the unitprice to set
     */
    public void setUnitprice(String unitprice) {
        this.unitprice = unitprice;
    }
    /**
     * @return the billingcode
     */
    public String getBillingcode() {
        return billingcode;
    }
    /**
     * @param billingcode the billingcode to set
     */
    public void setBillingcode(String billingcode) {
        this.billingcode = billingcode;
    }
    /**
     * @return the billingdate
     */
    public String getBillingdate() {
        return billingdate;
    }
    /**
     * @param billingdate the billingdate to set
     */
    public void setBillingdate(String billingdate) {
        this.billingdate = billingdate;
    }
    /**
     * @return the invoicecode
     */
    public String getInvoicecode() {
        return invoicecode;
    }
    /**
     * @param invoicecode the invoicecode to set
     */
    public void setInvoicecode(String invoicecode) {
        this.invoicecode = invoicecode;
    }
    /**
     * @return the billingProductName
     */
    public String getBillingProductName() {
        return billingProductName;
    }
    /**
     * @param billingProductName the billingProductName to set
     */
    public void setBillingProductName(String billingProductName) {
        this.billingProductName = billingProductName;
    }
    /**
     * @return the billingQuantity
     */
    public String getBillingQuantity() {
        return billingQuantity;
    }
    /**
     * @param billingQuantity the billingQuantity to set
     */
    public void setBillingQuantity(String billingQuantity) {
        this.billingQuantity = billingQuantity;
    }
    /**
     * @return the billingUnitprice
     */
    public String getBillingUnitprice() {
        return billingUnitprice;
    }
    /**
     * @param billingUnitprice the billingUnitprice to set
     */
    public void setBillingUnitprice(String billingUnitprice) {
        this.billingUnitprice = billingUnitprice;
    }
}
