package com.studycafe.user.repository;

import org.springframework.dao.DataAccessException;

import com.studycafe.user.domain.User;

public interface UserRepository {

	public User getLogin(User user) throws DataAccessException;
}
