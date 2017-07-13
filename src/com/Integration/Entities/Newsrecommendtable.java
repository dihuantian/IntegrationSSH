package com.Integration.Entities;

/**
 * Newsrecommendtable entity. @author MyEclipse Persistence Tools
 */

public class Newsrecommendtable implements java.io.Serializable {

	// Fields

	private Integer newsId;
	private String newsTitle;
	private String newsRecommend;

	// Constructors

	/** default constructor */
	public Newsrecommendtable() {
	}

	/** full constructor */
	public Newsrecommendtable(String newsTitle, String newsRecommend) {
		this.newsTitle = newsTitle;
		this.newsRecommend = newsRecommend;
	}

	// Property accessors

	public Integer getNewsId() {
		return this.newsId;
	}

	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
	}

	public String getNewsTitle() {
		return this.newsTitle;
	}

	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}

	public String getNewsRecommend() {
		return this.newsRecommend;
	}

	public void setNewsRecommend(String newsRecommend) {
		this.newsRecommend = newsRecommend;
	}

}