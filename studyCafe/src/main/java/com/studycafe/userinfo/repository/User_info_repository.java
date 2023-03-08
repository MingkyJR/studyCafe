package com.studycafe.userinfo.repository;

import java.util.List;

import com.studycafe.userinfo.domain.User_info;  //dto

public interface User_info_repository {

		//회원등록처리(회원가입)
		public void User_insert(User_info User_info) throws Exception;

		//회원목록조회
		public List<User_info> User_info_List();

		//회원 삭제
		
		 public void User_delete(String u_vo)  throws Exception;
		 
		//회원정보 수정
		public void User_update(User_info u_update) throws Exception;
		
		//회원 상세조회
		public User_info User_view(String u_id);

		//로그인
		public User_info User_login(User_info u_vo) throws Exception;
		
		
}
