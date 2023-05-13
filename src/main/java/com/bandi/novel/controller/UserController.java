package com.bandi.novel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bandi.novel.model.User;
import com.bandi.novel.service.UserService;

/**
 * 유저 관련 로직 컨트롤러
 * @author 김지현
 */
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private HttpSession session;
	
	/**
	 * 임시 로그인
	 * @param user model
	 * @return index페이지
	 */
	@PostMapping("/login")
	public String loginProc(User user) {
		
		User principal = userService.loginByUsernameAndPassword(user);
		session.setAttribute("principal", principal);
		return "redirect:/index";
	}
	
	/**
	 * 로그아웃
	 * @return
	 */
	@GetMapping("/logout")
	public String logoutProc() {
		session.invalidate();
		
		return "redirect:/index";
	}
	
}
