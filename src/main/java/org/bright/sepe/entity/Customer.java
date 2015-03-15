package org.bright.sepe.entity;

import org.smart4j.framework.orm.annotation.Entity;

@Entity
public class Customer {

	public long id;
	/** 客户名 **/
	public String name;
	/** 联系人名 **/
	public String username;
	/** 联系人电话 **/
	public String usertel;
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
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username
	 *            the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the usertel
	 */
	public String getUsertel() {
		return usertel;
	}

	/**
	 * @param usertel
	 *            the usertel to set
	 */
	public void setUsertel(String usertel) {
		this.usertel = usertel;
	}

	/**
	 * @return the comment
	 */
	public String getComment() {
		return comment;
	}

	/**
	 * @param comment the comment to set
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}

}
