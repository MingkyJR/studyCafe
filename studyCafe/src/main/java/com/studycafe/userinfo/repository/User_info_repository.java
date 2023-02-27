package com.studycafe.userinfo.repository;

import java.util.List;

import com.studycafe.userinfo.domain.User_info;

public interface User_info_repository {

	//회원등록처리
		public void setNewUser_info(User_info User_info);
		
		//(회원id로)상세회원정보 조회
		public User_info getUser_info_ById(String id);
		
		//회원목록조회
		public List<User_info> getAllUser_info_List();

		
}
