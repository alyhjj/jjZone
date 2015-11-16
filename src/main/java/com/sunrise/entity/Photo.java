package com.sunrise.entity;

public class Photo {
	private Integer photoId;
	private String photoName;
	private String photoDescribe;
	private String createTime;
	private String setTime;
	private Integer userId;
	public Integer getPhotoId() {
		return photoId;
	}
	public void setPhotoId(Integer photoId) {
		this.photoId = photoId;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getPhotoDescribe() {
		return photoDescribe;
	}
	public void setPhotoDescribe(String photoDescribe) {
		this.photoDescribe = photoDescribe;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getSetTime() {
		return setTime;
	}
	public void setSetTime(String setTime) {
		this.setTime = setTime;
	}
	
	public Photo(String photoName, String photoDescribe, String createTime,
			String setTime, Integer userId) {
		super();
		this.photoName = photoName;
		this.photoDescribe = photoDescribe;
		this.createTime = createTime;
		this.setTime = setTime;
		this.userId = userId;
	}
	public Photo() {
		super();
	}
	
	
}
