package org.bright.sepe.entity;

import org.smart4j.framework.orm.annotation.Entity;

@Entity
public class ProductType {

	private long id;
	/** 产品名称 **/
	private String name;
	/** 父节点名 **/
	private String parentname;

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
     * @return the parentname
     */
    public String getParentname() {
        return parentname;
    }

    /**
     * @param parentname the parentname to set
     */
    public void setParentname(String parentname) {
        this.parentname = parentname;
    }
}
