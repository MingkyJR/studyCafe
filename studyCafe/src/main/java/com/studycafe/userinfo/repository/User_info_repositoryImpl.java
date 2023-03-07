package com.studycafe.userinfo.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studycafe.userinfo.domain.User_info;

//현재 클래스를 DAO bean으로 등록
@Repository
public class User_info_repositoryImpl implements User_info_repository{

	@Inject
	
	@Autowired
	private SqlSession sqlSession;
	
	//01 회원목록
	@Override
	public List<User_info> User_info_List(){
		return sqlSession.selectList("User_info_List");
	}
	
	//02.회원등록
	@Override
	public void User_insert(User_info user_info) {
		sqlSession.insert("User_insert",user_info);
	}
	
	//회원 상세조회 view
	@Override
	public User_info User_view(String u_id) {
		return sqlSession.selectOne("User_view",u_id);
	}
	
	//수정
	@Override
	public void User_update(User_info u_update) {
		sqlSession.update("User_update",u_update);
	}

	//삭제
	@Override
	public void User_delete(String u_vo) {
		sqlSession.delete("User_delete",u_vo);
	}
	
	//회원정보 수정 및 삭제를 위한 비밀번호 체크
	@Override
	public boolean check_Pass(String u_id, String u_pass) {
		boolean result = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_id",u_id);
		map.put("u_pass",u_pass);
		int count = sqlSession.selectOne("user.check_Pass",map);
		if(count == 1) result = true;
		return result;
	}

			
		
}//class의 끝
