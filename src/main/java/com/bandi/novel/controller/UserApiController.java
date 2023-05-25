package com.bandi.novel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.bandi.novel.dto.UserUpdateDto;
import com.bandi.novel.model.AuthKey;
import com.bandi.novel.model.User;
import com.bandi.novel.service.MailService;
import com.bandi.novel.service.UserService;
import com.bandi.novel.utils.Define;
import com.bandi.novel.utils.TempNumberUtill;

@RestController
public class UserApiController {

	@Autowired
	private UserService userService;
	@Autowired
	private HttpSession session;
	@Value("${bandi.key}")
	private String bandiKey;
	@Autowired
	private MailService mailService;

	/**
	 * 유저 정보 업데이트
	 * 
	 * @param userUpdateDto
	 * @return
	 */
	@PutMapping("/update")
	public UserUpdateDto updateProc(@RequestBody UserUpdateDto userUpdateDto) {

		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		if (principal.getExternal()) {
			userUpdateDto.setPassword(bandiKey);
		}
		userUpdateDto.setId(principal.getId());
		userService.updateUser(userUpdateDto);
		principal = userService.selectUserByUserID(principal.getId());
		session.invalidate();
		session.setAttribute(Define.PRINCIPAL, principal);

		userUpdateDto.setBeforePassword("***");
		userUpdateDto.setPassword("***");
		userUpdateDto.setPasswordCheck("***");

		return userUpdateDto;
	}

	/**
	 * 아이디 중복 체크
	 * 
	 * @param username
	 * @return
	 */
	@GetMapping("/api/username")
	public Boolean usernameCheck(String username) {
		System.out.println(username);
		return userService.checkUsername(username);
	}

	/**
	 * 별명 중복체크
	 * 
	 * @param nickName
	 * @return
	 */
	@GetMapping("/api/nickname")
	public Boolean nickNameCheck(String nickName) {
		return userService.checkNickName(nickName);
	}

	/**
	 * 효린 
	 * 이메일 중복확인
	 * @param email
	 * @return T/F
	 */
	@PostMapping("/api/emailAuth")
	public String emailAuthCheck(String email) {

		// 가입 유무 확인
		Boolean check = userService.checkEmail(email);
		if (check) {
			System.out.println("이미 가입된 사용자 이메일입니다");
			// TODO 수정
			//return false;
		}
		// 인증번호 생성 
		String key = TempNumberUtill.getAuthKey();

		AuthKey authKey = new AuthKey(email, key);		
		// 인증번호 저장
		//userService.createAuthKey(authKey);
		// 인증번호 메일 전송
		mailService.sendAuthKey(authKey);
		return key;
	}

	/**
	 * 효린
	 * 이메일 인증번호	 
	 * @param inputKey
	 * @param email
	 * @return T/F
	 */
	@PostMapping("/api/authKey")
	public Boolean authKeycheck(String inputKey, String email) {

		return userService.checkAuthKey(email, inputKey);
	}

}
