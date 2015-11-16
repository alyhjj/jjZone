package com.sunrise.entity;

public class Image {
	private Integer imgId;
	private String imgAddress;
	private String createTime;
	private String setTime;
	private Integer userId;
	private Integer photoId;
	public Integer getImgId() {
		return imgId;
	}
	public void setImgId(Integer imgId) {
		this.imgId = imgId;
	}
	public String getImgAddress() {
		return imgAddress;
	}
	public void setImgAddress(String imgAddress) {
		this.imgAddress = imgAddress;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getPhotoId() {
		return photoId;
	}
	public void setPhotoId(Integer photoId) {
		this.photoId = photoId;
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
	
	public Image(String imgAddress, String createTime, String setTime,
			Integer userId, Integer photoId) {
		super();
		this.imgAddress = imgAddress;
		this.createTime = createTime;
		this.setTime = setTime;
		this.userId = userId;
		this.photoId = photoId;
	}
	public Image() {
		super();
	}
	
	
	
}
