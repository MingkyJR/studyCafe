package com.studycafe.userinfo.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;//dao

import com.studycafe.userinfo.domain.User_info; //dto

//현재 클래스를 DAO bean으로 등록
@Repository
public class User_info_repositoryImpl implements User_info_repository{

	@Inject
	SqlSession sqlSession;
	
	
	//01 회원목록
	@Override
	public List<User_info> User_info_List(){
		return sqlSession.selectList("User_info_List");
	}
	
	//02.회원등록
	@Override
	public void User_insert(User_info user_info) throws Exception{
		sqlSession.insert("User_insert",user_info);
	}
	
	//회원 상세조회 view
	@Override
	public User_info User_view(String u_id) {
		return sqlSession.selectOne("User_view",u_id);
	}
	
	//회원정보 수정(마이페이지)
	@Override
	public void User_update(User_info u_update) throws Exception{
		sqlSession.update("User_update",u_update);
	}
	 //삭제
	 @Override public void User_delete(String u_delete) {
	  sqlSession.delete("User_delete",u_delete); }


	//로그인
	@Override
	public User_info User_login(User_info u_vo)throws Exception{
		System.out.printf("Repository 로그인 : ",u_vo);
		return sqlSession.selectOne("User_login",u_vo);
	}
	
		
}//class의 끝
