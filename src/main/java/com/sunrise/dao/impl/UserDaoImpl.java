package com.sunrise.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sunrise.dao.UserDao;
import com.sunrise.entity.User;


@Repository
public class UserDaoImpl implements UserDao{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	public User selectUser(User user) {
		return this.sqlSessionTemplate.selectOne("com.sunrise.dao.UserDao.selectUser", user);
	}
	public int insertUser(User user) {
		return this.sqlSessionTemplate.insert("com.sunrise.dao.UserDao.insertUser", user);
	}
	public User checkUser(User user) {
		return this.sqlSessionTemplate.selectOne("com.sunrise.dao.UserDao.checkUser", user);
	}
	
}
