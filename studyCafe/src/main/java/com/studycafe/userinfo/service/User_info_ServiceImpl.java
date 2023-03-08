package com.studycafe.userinfo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.studycafe.userinfo.domain.User_info;//dto
import com.studycafe.userinfo.repository.User_info_repositoryImpl;//dao

@Service
public class User_info_ServiceImpl implements User_info_Service {

	@Inject
	User_info_repositoryImpl user_info_repositoryImpl;
	
	//01. 회원목록
	@Override
	public List<User_info> User_info_List(){
		return user_info_repositoryImpl.User_info_List();
	}
	
	//02. 회원등록
	@Override
	public void User_insert(User_info u_vo) throws Exception {
		user_info_repositoryImpl.User_insert(u_vo);
	}
	 
	//03회원정보 상세조회
	@Override
	public User_info User_view(String u_id) {
		return user_info_repositoryImpl.User_view(u_id);
	}
		
	//04 회원정보 수정(마이페이지)
	@Override
	public void User_update(User_info u_update) throws Exception{
		user_info_repositoryImpl.User_update(u_update);
	}

	  //05삭제
	 @Override
	 public void User_delete(String u_vo) throws Exception{
	 user_info_repositoryImpl.User_delete(u_vo); 
	 }
	 
	//로그인
	 @Override
	public User_info User_login(User_info u_vo) throws Exception{
		 System.out.printf("Service 로그인 : ",u_vo);
		return user_info_repositoryImpl.User_login(u_vo);
	}

	

	
}//class의 끝.
