package com.studycafe.userinfo.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.studycafe.userinfo.domain.User_info;
import com.studycafe.userinfo.repository.User_login_repository;

@Service
public class User_login_ServiceImpl implements User_login_Service {

	@Inject
	User_login_repository user_login_repository;
	
	//회원 로그인체크
	@Override
	public boolean loginCheck(User_info user_login, HttpSession session) {
		boolean result = user_login_repository.loginCheck(user_login);
		if(result) {
			User_info user_login2 = view_User(user_login);
			//세션 변수 등록
			session.setAttribute("user_id", user_login2.getU_id());
			session.setAttribute("user_name", user_login2.getU_name());
		}
		return result;
	}

	//회원 로그인 정보
	@Override
	public User_info view_User(User_info user_login) {
		return user_login_repository.view_User(user_login);
	}

	//회원 로그아웃
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
}
