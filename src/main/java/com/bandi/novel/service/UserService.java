package com.bandi.novel.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.model.User;
import com.bandi.novel.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private UserRepository userRepository;
	
	@Transactional
	public User loginByUsernameAndPassword(User user) {
		User userEntity = userRepository.selectByUsername(user);
		if(!passwordEncoder.matches(user.getPassword(), userEntity.getPassword())) {
			throw new IllegalArgumentException("비밀번호 틀림");
		}
		
		return userEntity;
	}
	
}
