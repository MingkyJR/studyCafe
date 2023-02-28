package com.studycafe.userinfo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studycafe.userinfo.domain.User_info;
import com.studycafe.userinfo.repository.User_info_repository;

@Service
public class User_info_ServiceImpl {

	
	@Autowired
	private User_info_repository user_info_repository;
	

	//회원등록처리	
	public void setNewUser_info(User_info User_info) {
		user_info_repository.setNewUser_info(User_info);
	}

	//회원(id)로 상세회원조회
	@Override
	public User_info getUser_info_ById(String id) {
		return user_info_repository.getUser_info_ById(id);
	}
	
//	//회원목록조회
//getAllUser_info_List()부분 오류 발생
	
	@Override
	 public List<User_info> getAllUser_info_List() {
		 List<User_info> user_info = user_info_repository.getAllUser_info_List(); 
		 return user_info; 
		}
	 
	
	//로그인 아이디 추가
	
	//
	 

	
}//class의 끝.
