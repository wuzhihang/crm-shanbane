package com.shanbane.dao;

import com.shanbane.entity.User;

public interface UserDao {
	
    User findUserByNamePwd(String username,String pwd);  //ͨ���û�������������û�
}
