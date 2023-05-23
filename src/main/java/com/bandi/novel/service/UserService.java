package com.bandi.novel.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.FindPwdDto;
import com.bandi.novel.dto.UserUpdateDto;
import com.bandi.novel.model.User;
import com.bandi.novel.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private UserRepository userRepository;
	
	/**
	 * 일반유저 로그인
	 * @param user
	 * @return userEntity
	 */
	@Transactional
	public User loginByUsernameAndPassword(User user) {
		User userEntity = userRepository.selectByUsername(user.getUsername());
		if(userEntity == null) {
			throw new IllegalArgumentException("아이디 없음");
		}
		if(!passwordEncoder.matches(user.getPassword(), userEntity.getPassword())) {
			throw new IllegalArgumentException("비밀번호 틀림");
		}
		
		return userEntity;
	}
	
	/**
	 * 카카오유저 로그인
	 * @param user
	 * @return userEntity
	 */
	@Transactional
	public User loginByKakao(User user) {
		
		User userEntity = userRepository.selectByUsername(user.getUsername());
		
		if(userEntity == null) {
			return user;
		}
		
		if(!passwordEncoder.matches(user.getPassword(), userEntity.getPassword())) {
			throw new IllegalArgumentException("비밀번호 틀림");
		}
		
		return userEntity;
	}
	
	/**
	 * 회원가입 처리
	 * @param user
	 */
	@Transactional
	public void insertUser(User user) {
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		int result = userRepository.insertUser(user);
		// todo 예외처리
	}
	
	/**
	 * 회원정보 수정
	 * @param user
	 */
	@Transactional
	public void updateUser(UserUpdateDto userUpdateDto) {
		userUpdateDto.setPassword(passwordEncoder.encode(userUpdateDto.getPassword()));
		int result = userRepository.updateUser(userUpdateDto);
		// todo 예외처리
	}
	
	@Transactional
	public User selectUserByUserID(Integer id) {
		
		return userRepository.selectByUserId(id);
	}
	
	/**
	 * 효린
	 * 사용자 조회 (비밀번호 찾기)
	 * @param findPwdDto
	 * @return userEntity
	 */
	@Transactional
	public User selectUserByUsernameAndEmail(FindPwdDto findPwdDto) {

		User userEntity = userRepository.selectByUsername(findPwdDto.getUsername());
		if (userEntity == null) {
			System.out.println("아이디가 존재하지 않습니다");
		}
		if (!userEntity.getEmail().equals(findPwdDto.getEmail())) {
			System.out.println("잘못된 이메일입니다");
		}
		return userEntity;
	}

	/**
	 * 효린
	 * 비밀번호 변경
	 * @param user
	 */
	@Transactional
	public void updateUserPwd(User user) {

		user.setPassword(passwordEncoder.encode(user.getPassword()));
		
		int resultRowCount = userRepository.updatePwd(user);
		
		if (resultRowCount != 1) {
			System.out.println("비밀번호 임시변경실패");
		}

	}
	
}
