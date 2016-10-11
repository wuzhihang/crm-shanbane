package com.shanbane.dao;

import com.shanbane.entity.User;

public interface UserDao {
	
    User findUserByNamePwd(String username,String pwd);  //通过用户名，密码查找用户
}
