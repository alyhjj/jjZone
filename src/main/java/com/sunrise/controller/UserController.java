package com.sunrise.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunrise.entity.Image;
import com.sunrise.entity.User;
import com.sunrise.service.ImageService;
import com.sunrise.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private ImageService imageService;
	
	/**
	 * 登陆操作
	 * @param req
	 * @param res
	 * @param user
	 * @return
	 */
	@RequestMapping("/login")
	@ResponseBody
	public String selectUser(HttpServletRequest req,HttpServletResponse res,User user){
		User ss = userService.selectUser(user);
		if(ss != null){
			req.getSession().setAttribute("user", ss);
			//登陆成功---查询此用户的头像
			Image image = new Image();
			image.setUserId(ss.getUserId());
			Image ima = imageService.selectImage(image);
			req.getSession().setAttribute("imgAddress", ima.getImgAddress());
			
			
			
			return "1";
		}else{
			return "0";
		}
	}
	/**
	 * 检查是否存在此用户
	 * @param req
	 * @param res
	 * @param user
	 * @return
	 */
	@RequestMapping("/checkUser")
	@ResponseBody
	public String checkUser(HttpServletRequest req,HttpServletResponse res,User user){
		User ss = userService.checkUser(user);
		if(ss != null){
			return "1";
		}else{
			return "0";
		}
	}				
	//跳转注册页面
	@RequestMapping("/register")
	public String register(){
		return "register";
	}
	//跳转登陆页面
	@RequestMapping("/index")
	public String index(){
		return "index";
	}
	//跳转主页页面
	@RequestMapping("/home")
	public String home(){
		return "home";
	}
	/**
	 * 注册
	 * @param req
	 * @param res
	 * @param user
	 * @return
	 */
	@RequestMapping("/regi")
	@ResponseBody
	public String userRegister(HttpServletRequest req,HttpServletResponse res,User user){
		int num = userService.insertUser(user);
		if(num == 1){
			User ss = userService.checkUser(user);
			req.getSession().setAttribute("user", ss);
			//注册成功---设置用户头像
			Image image = new Image();
			image.setUserId(ss.getUserId());
			image.setImgAddress("resources/i/photosImg/38.jpg");
			int n = imageService.insertImages(image);
			if(n == 1){
				//设置成功---跳到登陆页面
				return "index";
			}else{
				return "0";
			}
		}else{
			return "0";
		}
	}
}
