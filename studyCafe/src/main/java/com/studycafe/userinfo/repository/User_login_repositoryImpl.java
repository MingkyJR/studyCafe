package com.studycafe.userinfo.repository;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.studycafe.userinfo.domain.User_info;

//(dao)로그인 인터페이스 구현 클래스

@Repository
public class User_login_repositoryImpl implements User_login_repository{
	
	@Inject
	SqlSession sqlSession; //mybatis 실행객체
	
	//회원 로그인 체크
	@Override
	public boolean loginCheck(User_info user_login) {
		String name = sqlSession.selectOne("User.logincheck",user_login);
		return (name == null) ? false : true;
	}
	
	//회원 로그인 정보
	@Override
	public User_info view_User(User_info user_login) {
		return sqlSession.selectOne("user.view_user",user_login);
	}
	
	//회원 로그아웃
	@Override
	public void logout(HttpSession session) {		
	}
	
}
