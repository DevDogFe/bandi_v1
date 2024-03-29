package com.bandi.novel.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.FindPwdDto;
import com.bandi.novel.dto.JoinDto;
import com.bandi.novel.dto.LoginDto;
import com.bandi.novel.dto.UserUpdateDto;
import com.bandi.novel.dto.response.ResponseDto;
import com.bandi.novel.handler.exception.CustomRestfulException;
import com.bandi.novel.model.User;
import com.bandi.novel.repository.UserGoldRepository;
import com.bandi.novel.repository.UserRepository;
import com.bandi.novel.utils.Define;

@Service
public class UserService {

	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private HttpSession session;
	@Autowired
	private UserGoldRepository userGoldRepository;

	/**
	 * 일반유저 로그인
	 * 
	 * @param loginDto
	 * @return userEntity
	 */
	@Transactional
	public ResponseDto<User> loginByUsernameAndPassword(LoginDto loginDto) {
		User userEntity = userRepository.selectByUsername(loginDto.getUsername());
		System.out.println(userEntity);
		if (userEntity == null) {
			return new ResponseDto<User>(HttpStatus.INTERNAL_SERVER_ERROR, "아이디가 없습니다.", false, null);
		}
		if (!passwordEncoder.matches(loginDto.getPassword(), userEntity.getPassword())) {
			return new ResponseDto<User>(HttpStatus.INTERNAL_SERVER_ERROR, "비밀번호가 틀렸습니다.", false, null);
		}

		return new ResponseDto<User>(HttpStatus.OK, Define.REQUEST_SUCCESS, true, userEntity);
	}

	/**
	 * 카카오유저 로그인 최초로그인시 회원가입창으로 감
	 * 
	 * @param user
	 * @return userEntity
	 */
	@Transactional
	public User loginByKakao(User user) {

		User userEntity = userRepository.selectByUsername(user.getUsername());

		if (userEntity == null) {
			return user;
		}

		if (!passwordEncoder.matches(user.getPassword(), userEntity.getPassword())) {
			throw new CustomRestfulException("비밀번호가 틀렸습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return userEntity;
	}

	/**
	 * 회원가입 처리
	 * 
	 * @param joinDto
	 */
	@Transactional
	public void insertUser(JoinDto joinDto) {
		joinDto.setPassword(passwordEncoder.encode(joinDto.getPassword()));
		int result = userRepository.insertUser(joinDto);

		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		User userEntity = userRepository.selectByUsername(joinDto.getUsername());
		result = userGoldRepository.insertByUserId(userEntity.getId());
		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}
	

	/**
	 * 회원정보 수정
	 * 
	 * @param user
	 */
	@Transactional
	public void updateUser(UserUpdateDto userUpdateDto) {
		userUpdateDto.setPassword(passwordEncoder.encode(userUpdateDto.getPassword()));
		int result = userRepository.updateUser(userUpdateDto);

		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@Transactional
	public User selectUserByUserID(Integer id) {

		User userEntity = userRepository.selectByUserId(id);

		if (userEntity == null) {
			throw new CustomRestfulException("유저를 찾을 수 없습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return userEntity;
	}

	/**
	 * 아이디 중복체크용
	 * 
	 * @param username
	 * @return
	 */
	@Transactional
	public Boolean checkUsername(String username) {
		User userEntity = userRepository.selectByUsername(username);
		if (userEntity != null) {
			return true;
		}
		return false;
	}

	/**
	 * 이메일 중복체크용
	 * 
	 * @param email
	 * @return
	 */
	@Transactional
	public Boolean checkEmail(String email) {
		User userEntity = userRepository.selectByEmail(email);
		if (userEntity != null) {
			return true;
		}
		return false;
	}

	/**
	 * 닉네임 중복체크용
	 * 
	 * @param nickName
	 * @return
	 */
	@Transactional
	public Boolean checkNickName(String nickName) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		if (principal == null) {
			User userEntity = userRepository.selectByNickName(nickName);
			if (userEntity != null) {
				return true;
			}
		} else { // 로그인 되있을 때(즉 정보 수정시) 본인 닉네임은 중복체크에서 뺌
			User userEntity = userRepository.selectByNickNameAndId(nickName, principal.getId());
			if (userEntity != null) {
				return true;
			}
		}

		return false;
	}

	/**
	 * 효린 사용자 조회 (비밀번호 찾기)
	 * 
	 * @param findPwdDto
	 * @return userEntity
	 */
	@Transactional
	public User selectUserByUsernameAndEmail(FindPwdDto findPwdDto) {

		User userEntity = userRepository.selectByUsername(findPwdDto.getUsername());
		if (userEntity == null) {
			throw new CustomRestfulException("아이디가 존재하지 않습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!userEntity.getEmail().equals(findPwdDto.getEmail())) {
			throw new CustomRestfulException("잘못된 이메일입니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return userEntity;
	}

	/**
	 * 효린 비밀번호 변경
	 * 
	 * @param user
	 */
	@Transactional
	public void updateUserPwd(User user) {

		user.setPassword(passwordEncoder.encode(user.getPassword()));

		int result = userRepository.updatePwd(user);

		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}




	@Transactional
	public User loginByNaver(User user) {

		User userEntity = userRepository.selectByUsername(user.getUsername());

		if (userEntity == null) {
			return user;
		}

		if (!passwordEncoder.matches(user.getPassword(), userEntity.getPassword())) {
			throw new CustomRestfulException("비밀번호가 틀렸습니다.", HttpStatus.BAD_REQUEST);
		}

		return userEntity;
	}
	
	@Transactional
	public String selectUsernameByEmail(String email) {
		User userEntity = userRepository.selectByEmail(email);
		if(userEntity == null) {
			throw new CustomRestfulException("아이디가 없습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return userEntity.getUsername();
	}

}
