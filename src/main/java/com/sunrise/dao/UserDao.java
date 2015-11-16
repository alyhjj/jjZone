package com.sunrise.dao;

import com.sunrise.entity.User;


public interface UserDao {
	/**
	 * 登陆操作
	 * @param user
	 * @return
	 */
	public User selectUser(User user);
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	public int insertUser(User user);
	/**
	 * 检查是否存在此用户
	 * @param user
	 * @return
	 */
	public User checkUser(User user);
}
