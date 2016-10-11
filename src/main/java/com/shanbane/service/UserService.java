package com.shanbane.service;

import com.shanbane.entity.User;

public interface UserService {

	User findUserByNamePwd(String username, String pwd);

}
