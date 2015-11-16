package com.sunrise.entity;

public class User {
	private Integer userId;
	private String userName;
	private String userNick;
	private String userPwd;
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	
	public User(String userName, String userNick, String userPwd) {
		super();
		this.userName = userName;
		this.userNick = userNick;
		this.userPwd = userPwd;
	}
	public User() {
		super();
	}
	
	
	
	
}
