package com.Integration.Entities;

/**
 * Commentstable entity. @author MyEclipse Persistence Tools
 */

public class Commentstable implements java.io.Serializable {

	// Fields

	private Integer commentsId;
	private Integer newsId;
	private Integer userId;
	private String userName;
	private String commentsContent;

	// Constructors

	/** default constructor */
	public Commentstable() {
	}

	/** full constructor */
	public Commentstable(Integer newsId, Integer userId, String userName,
			String commentsContent) {
		this.newsId = newsId;
		this.userId = userId;
		this.userName = userName;
		this.commentsContent = commentsContent;
	}

	// Property accessors

	public Integer getCommentsId() {
		return this.commentsId;
	}

	public void setCommentsId(Integer commentsId) {
		this.commentsId = commentsId;
	}

	public Integer getNewsId() {
		return this.newsId;
	}

	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCommentsContent() {
		return this.commentsContent;
	}

	public void setCommentsContent(String commentsContent) {
		this.commentsContent = commentsContent;
	}

}