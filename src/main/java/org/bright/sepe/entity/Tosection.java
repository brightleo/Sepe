package org.bright.sepe.entity;

import org.smart4j.framework.orm.annotation.Entity;

@Entity
public class Tosection {

	private long id;
    /** 项目号 **/
    private String code;
	/** 到款日期 **/
	public String tosectiondate;
	/** 到款金额 **/
	public String tosectionAmount;
	/** 到款备注 **/
	public String tosectionComment;
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
	 * @return the tosectiondate
	 */
	public String getTosectiondate() {
		return tosectiondate;
	}
	/**
	 * @param tosectiondate the tosectiondate to set
	 */
	public void setTosectiondate(String tosectiondate) {
		this.tosectiondate = tosectiondate;
	}
	/**
	 * @return the tosectionAmount
	 */
	public String getTosectionAmount() {
		return tosectionAmount;
	}
	/**
	 * @param tosectionAmount the tosectionAmount to set
	 */
	public void setTosectionAmount(String tosectionAmount) {
		this.tosectionAmount = tosectionAmount;
	}
	/**
	 * @return the tosectionComment
	 */
	public String getTosectionComment() {
		return tosectionComment;
	}
	/**
	 * @param tosectionComment the tosectionComment to set
	 */
	public void setTosectionComment(String tosectionComment) {
		this.tosectionComment = tosectionComment;
	}
}
