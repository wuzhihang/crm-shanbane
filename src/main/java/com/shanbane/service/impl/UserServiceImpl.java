package com.shanbane.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shanbane.dao.UserDao;
import com.shanbane.entity.User;
import com.shanbane.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Transactional(readOnly=true)
	public User findUserByNamePwd(String username, String pwd) {
		
		return userDao.findUserByNamePwd(username, pwd);
	}

}
