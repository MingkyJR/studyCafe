package com.studycafe.userinfo.repository;

import java.util.List;

import com.studycafe.userinfo.domain.User_info;

public interface User_info_repository {

		//회원등록처리
		public void User_insert(User_info User_info);

		//회원목록조회
		public List<User_info> User_info_List();

		//회원 삭제
		public void User_delete(String u_vo);
		
		//회원정보 수정
		public void User_update(User_info u_update);
		
		//회원 상세조회
		public User_info User_view(String u_id);

		//회원정보 수정 및 사겢?
		boolean check_Pass(String u_id, String u_pass);


		
}
