package com.studycafe.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studycafe.user.domain.User;
import com.studycafe.user.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository userRepository;
	
	@Override
	public User getLogin(User user) throws Exception {
		return userRepository.getLogin(user);
	}
}
