package com.sunrise.entity;

public class Publish {
	private Integer publishId;
	private Integer userId;
	private String publishDate;
	private Integer imgId;
	private String publishContext;
	public Integer getPublishId() {
		return publishId;
	}
	public void setPublishId(Integer publishId) {
		this.publishId = publishId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}
	public Integer getImgId() {
		return imgId;
	}
	public void setImgId(Integer imgId) {
		this.imgId = imgId;
	}
	public String getPublishContext() {
		return publishContext;
	}
	public void setPublishContext(String publishContext) {
		this.publishContext = publishContext;
	}
	public Publish(Integer userId, String publishDate, Integer imgId,
			String publishContext) {
		super();
		this.userId = userId;
		this.publishDate = publishDate;
		this.imgId = imgId;
		this.publishContext = publishContext;
	}
	public Publish() {
		super();
	}
	
	
}
