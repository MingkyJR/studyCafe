package com.studycafe.user.service;

import com.studycafe.user.domain.User;

public interface UserService {

	public User getLogin(User user) throws Exception;
	
	//회원가입
	public void insertUser(User user) throws Exception;
}
