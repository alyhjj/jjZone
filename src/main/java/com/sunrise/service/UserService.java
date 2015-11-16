package com.sunrise.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunrise.dao.UserDao;
import com.sunrise.entity.User;


@Service
public class UserService {
	@Autowired
	private UserDao userDao;
	
	public User selectUser(User user){
		return this.userDao.selectUser(user);
	};
	public int insertUser(User user){
		return this.userDao.insertUser(user);
	};
	public User checkUser(User user){
		return this.userDao.checkUser(user);
	};
}
