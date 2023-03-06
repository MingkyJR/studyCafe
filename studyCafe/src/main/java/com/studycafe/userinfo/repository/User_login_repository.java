package com.studycafe.userinfo.repository;

import javax.servlet.http.HttpSession;

import com.studycafe.userinfo.domain.User_info;

public interface User_login_repository {
//dao역할 수행
	
	//회원 로그인체크
	public boolean loginCheck(User_info user_login);
	
	//로그인 정보
	public User_info view_User(User_info user_login);
	
	//회원 로그아웃
	public void logout(HttpSession session);
	
	
}