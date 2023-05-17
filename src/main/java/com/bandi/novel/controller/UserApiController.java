package com.bandi.novel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.bandi.novel.dto.UserUpdateDto;
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
	private UserUpdateDto updateProc(@RequestBody UserUpdateDto userUpdateDto) {
		
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		if(principal.getExternal()) {
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
	
	

}
