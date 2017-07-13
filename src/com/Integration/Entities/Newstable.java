package com.Integration.Entities;

/**
 * Newstable entity. @author MyEclipse Persistence Tools
 */

public class Newstable implements java.io.Serializable {

	// Fields

	private Integer newId;
	private String newTitle;
	private String introduction;
	private String author;
	private String issueContent;
	private String issueTime;
	private Integer commentNumber;
	private Integer browseNumber;
	private String newImage;

	// Constructors

	/** default constructor */
	public Newstable() {
	}

	/** full constructor */
	public Newstable(String newTitle, String introduction, String author,
			String issueContent, String issueTime, Integer commentNumber,
			Integer browseNumber, String newImage) {
		this.newTitle = newTitle;
		this.introduction = introduction;
		this.author = author;
		this.issueContent = issueContent;
		this.issueTime = issueTime;
		this.commentNumber = commentNumber;
		this.browseNumber = browseNumber;
		this.newImage = newImage;
	}

	// Property accessors

	public Integer getNewId() {
		return this.newId;
	}

	public void setNewId(Integer newId) {
		this.newId = newId;
	}

	public String getNewTitle() {
		return this.newTitle;
	}

	public void setNewTitle(String newTitle) {
		this.newTitle = newTitle;
	}

	public String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getIssueContent() {
		return this.issueContent;
	}

	public void setIssueContent(String issueContent) {
		this.issueContent = issueContent;
	}

	public String getIssueTime() {
		return this.issueTime;
	}

	public void setIssueTime(String issueTime) {
		this.issueTime = issueTime;
	}

	public Integer getCommentNumber() {
		return this.commentNumber;
	}

	public void setCommentNumber(Integer commentNumber) {
		this.commentNumber = commentNumber;
	}

	public Integer getBrowseNumber() {
		return this.browseNumber;
	}

	public void setBrowseNumber(Integer browseNumber) {
		this.browseNumber = browseNumber;
	}

	public String getNewImage() {
		return this.newImage;
	}

	public void setNewImage(String newImage) {
		this.newImage = newImage;
	}

}