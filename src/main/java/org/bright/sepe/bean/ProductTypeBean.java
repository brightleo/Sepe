package org.bright.sepe.bean;

import java.util.List;

import org.bright.sepe.entity.ProductType;

public class ProductTypeBean {

    private ProductType productType;
    private List<ProductType> productTypeList;

    public ProductTypeBean() {
    }

	/**
	 * @return the productType
	 */
	public ProductType getProductType() {
		return productType;
	}

	/**
	 * @param productType the productType to set
	 */
	public void setProductType(ProductType productType) {
		this.productType = productType;
	}

	/**
	 * @return the productTypeList
	 */
	public List<ProductType> getProductTypeList() {
		return productTypeList;
	}

	/**
	 * @param productTypeList the productTypeList to set
	 */
	public void setProductTypeList(List<ProductType> productTypeList) {
		this.productTypeList = productTypeList;
	}
}
