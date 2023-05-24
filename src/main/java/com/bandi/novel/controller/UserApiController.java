package com.bandi.novel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bandi.novel.dto.LoginDto;
import com.bandi.novel.dto.UserUpdateDto;
import com.bandi.novel.dto.response.ResponseDto;
import com.bandi.novel.model.User;
import com.bandi.novel.service.UserService;
import com.bandi.novel.utils.Define;

@RestController
public class UserApiController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private HttpSession session;
	@Value("${bandi.key}")
	private String bandiKey;
	
	/**
	 * 유저 정보 업데이트
	 * @param userUpdateDto
	 * @return
	 */
	@PutMapping("/update")
	public UserUpdateDto updateProc(@RequestBody UserUpdateDto userUpdateDto) {
		
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		if(principal.getExternal() != null) {
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
	 * @param username
	 * @return
	 */
	@GetMapping ("/api/username")
	public Boolean usernameCheck(String username) {
		System.out.println(username);
		return userService.checkUsername(username);
	}
	
	/**
	 * 이메일 중복체크
	 * @param email
	 * @return
	 */
	@GetMapping ("/api/email")
	public Boolean emailCheck(String email) {
		
		return userService.checkEmail(email);
	}
	
	/**
	 * 별명 중복체크
	 * @param nickName
	 * @return
	 */
	@GetMapping ("/api/nickname")
	public Boolean nickNameCheck(String nickName) {
		
		return userService.checkNickName(nickName);
	}
	
	@PostMapping("/api/login")
	public ResponseDto<Boolean> loginProc(@RequestBody LoginDto loginDto){
		ResponseDto<User> resUser = userService.loginByUsernameAndPassword(loginDto);
		Boolean result = true;
		if(resUser.getData() == null) {
			result = false;
		}
		User principal = resUser.getData();
		session.setAttribute("principal", principal);
		
		return new ResponseDto<Boolean>(resUser.getStatusCode(), resUser.getCode(), resUser.getMessage(), resUser.getResultCode(), result);
	}
	

}
