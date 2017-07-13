package com.Integration.Entities;

import javax.persistence.Column;

/**
 * Usertable entity. @author MyEclipse Persistence Tools
 */

public class Usertable implements java.io.Serializable {

	// Fields

	private Integer id;
	private String userName;
	private String password;
	private String sex;
	private Integer age;
	private String phoneNumber;
	private String address;
	private String hobby;

	// Constructors

	/** default constructor */
	public Usertable() {
	}

	/** minimal constructor */
	public Usertable(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}

	/** full constructor */
	public Usertable(String userName, String password, String sex, int age,
			String phoneNumber, String address, String hobby) {
		this.userName = userName;
		this.password = password;
		this.sex = sex;
		this.age = age;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.hobby = hobby;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(updatable=false)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHobby() {
		return this.hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

}