package com.sunrise.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sunrise.entity.User;
import com.sunrise.service.UserService;

public class Test {
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("config/applicationContext.xml");
		UserService userService = (UserService)ac.getBean("userService");
		User user = new User();
		user.setUserName("810548668");
		user.setUserPwd("jj511314");
		User s = userService.selectUser(user);
		System.out.println(s.getUserId());
		ApplicationContext aa = new ClassPathXmlApplicationContext("config/applicationContext.xml");
	}
}
