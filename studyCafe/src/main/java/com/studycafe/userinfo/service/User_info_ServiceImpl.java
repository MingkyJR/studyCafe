package com.studycafe.userinfo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.studycafe.userinfo.domain.User_info;
import com.studycafe.userinfo.repository.User_info_repositoryImpl;

@Service
public class User_info_ServiceImpl implements User_info_Service {

	@Inject
	User_info_repositoryImpl user_info_repositoryImpl2;
	
	//01. 회원목록
	@Override
	public List<User_info> User_info_List(){
		return user_info_repositoryImpl2.User_info_List();
	}
	
	//02. 회원등록
	@Override
	public void User_insert(User_info u_vo) {
		user_info_repositoryImpl2.User_insert(u_vo);
	}
	 
	//03회원정보 상세조회
	@Override
	public User_info User_view(String u_id) {
		return user_info_repositoryImpl2.User_view(u_id);
	}
		
	//04수정
	@Override
	public void User_update(User_info u_update) {
		user_info_repositoryImpl2.User_update(u_update);
	}

	//05삭제
	@Override
	public void User_delete(String u_vo) {
		user_info_repositoryImpl2.User_delete(u_vo);
		}
		
	//회원정보 수정 및 삭제를 위한 비밀번호 체크
	@Override
	public boolean check_Pass(String u_id, String u_pass) {
		return user_info_repositoryImpl2.check_Pass(u_id,u_pass);
	}


	

	
}//class의 끝.
