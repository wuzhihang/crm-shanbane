package com.shanbane.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shanbane.entity.User;
import com.shanbane.service.UserService;

@Controller
public class UserController {
     
	private static Log log = LogFactory.getLog(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String findUserByNamePwd(HttpServletRequest req, HttpServletResponse res) {
		log.info("hello world");		
		String username = req.getParameter("username");
		String pwd = req.getParameter("pwd");
		User user = userService.findUserByNamePwd(username, pwd);
		if(user!= null){
			HttpSession se = req.getSession();
			se.setAttribute("uid", user.getId());
			String id = String.valueOf(user.getId());
			Cookie ck = new Cookie("uid",id);
			ck.setMaxAge(3);
			res.addCookie(ck);
			return "dashboard.jsp";
		}else{
			req.setAttribute("errCode", 102);
			req.setAttribute("msg", "用户名或密码不正确!");
			return "login.jsp";
		}
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String fingCookie(HttpServletRequest req, HttpServletResponse res){
		Cookie[] cookie = req.getCookies();
		HttpSession session = req.getSession();
		if(cookie!= null){
			for(Cookie cok:cookie){
				if("uid".equals(cok.getName())){
				   session.setAttribute("uid", cok);
				   return "dashboard.jsp";
				}
			}
		}
		return "login.jsp";
	}
}
