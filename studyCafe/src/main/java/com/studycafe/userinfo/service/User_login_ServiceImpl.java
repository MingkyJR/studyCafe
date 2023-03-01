package com.studycafe.userinfo.service;

import javax.servlet.http.HttpSession;

import com.studycafe.userinfo.domain.User_info;

public class User_login_ServiceImpl implements User_login_Service {

	@Override
	public boolean loginCheck(User_info user_login, HttpSession session) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User_info view_User(User_info user_login) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		
	}
	
}
