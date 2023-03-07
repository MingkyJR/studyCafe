package com.studycafe.userinfo.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;

import com.studycafe.userinfo.domain.User_info; //dto
import com.studycafe.userinfo.repository.User_login_repository; //dao


@Service
public class User_login_ServiceImpl implements User_login_Service {

	@Inject
	User_login_repository user_login_repository;

	
	@Override
	public String loginCheck(User_info user_vo, HttpSession session) {
		String name = user_login_repository.loginCheck(user_vo);
			if(name != null) {
				session.setAttribute("user_id", user_vo.getU_id());
				session.setAttribute("user_name",name);
			}
			return name;
	}

	//회원 로그아웃
	@Override
	public void logout(HttpSession session) {
		session.invalidate(); //세션초기화
	}
	
	
	
	
	//회원 로그인체크
//	@Override
//	public boolean loginCheck(User_info user_vo, HttpSession session) {
//		boolean result = user_login_repository.loginCheck(user_vo);
//		if(result) { //true일 경우 session에 등록
//			User_info user_vo2 = view_User(user_vo);
//			//세션 변수 등록
//			session.setAttribute("user_id", user_vo2.getU_id());
//			session.setAttribute("user_name", user_vo2.getU_name());
//		}
//		return result;
//	}

	//회원 로그인 정보
//	@Override
//	public User_info view_User(User_info user_vo) {
//		return user_login_repository.view_User(user_vo);
//	}
	
}


