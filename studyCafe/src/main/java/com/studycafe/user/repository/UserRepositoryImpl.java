package com.studycafe.user.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.studycafe.user.domain.User;

@Repository
public class UserRepositoryImpl implements UserRepository {

	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public User getLogin(User user) throws DataAccessException {
		return sqlSession.selectOne("mapper.user.getLogin",user);
	}
	
	//회원가입
	@Override
	public void insertUser(User user) throws DataAccessException {
		sqlSession.insert("mapper.user.insertUser", user);
	}
}
