package com.studycafe.userinfo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.studycafe.userinfo.domain.User_info;

public class User_info_RowMapper implements RowMapper<User_info> {

	@Override
	public User_info mapRow(ResultSet rs, int rowNum) throws SQLException {
		User_info user_info = new User_info();
		user_info.setUser_number(rs.getInt("userNo"));//유저 식별 번호 1
		user_info.setU_name(rs.getString("name"));//유저 이름 2
		user_info.setU_id(rs.getString("id")); //유저 id 3
		user_info.setU_pass(rs.getString("psss")); //유저 비번 4
		user_info.setU_tell(rs.getString("tell"));// 유저 전화번호 5
		user_info.setU_gender(rs.getString("gender"));//유저 성별 6
		user_info.setU_credate(rs.getDate("creDate"));//유저 가입일 7		
		return user_info;
	}

}
