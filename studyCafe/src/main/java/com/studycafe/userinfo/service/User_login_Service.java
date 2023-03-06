package com.studycafe.userinfo.service;

import javax.servlet.http.HttpSession;

import com.studycafe.userinfo.domain.User_info;

public interface User_login_Service {

	//회원 로그인 체크
	public boolean loginCheck(User_info user_login, HttpSession session);
	
	//회원 로그인 정보
	public User_info view_User(User_info user_login);
	
	//회원 로그아웃
	public void logout(HttpSession session);
}