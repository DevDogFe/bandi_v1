package com.bandi.novel.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.bandi.novel.dto.LoginDto;
import com.bandi.novel.dto.UserUpdateDto;
import com.bandi.novel.dto.response.ResponseDto;
import com.bandi.novel.handler.exception.CustomRestfulException;
import com.bandi.novel.model.AuthKey;
import com.bandi.novel.model.User;
import com.bandi.novel.service.MailService;
import com.bandi.novel.service.UserService;
import com.bandi.novel.utils.Define;
import com.bandi.novel.utils.TempNumberUtil;

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
	public ResponseDto<Boolean> updateProc(@Valid @RequestBody UserUpdateDto userUpdateDto, BindingResult bindingResult) {
		System.out.println(userUpdateDto);
		if (bindingResult.hasErrors()) {
			StringBuilder sb = new StringBuilder();
			bindingResult.getAllErrors().forEach(error -> {
				sb.append(error.getDefaultMessage()).append("\\n");
			});
			throw new CustomRestfulException(sb.toString(), HttpStatus.BAD_REQUEST);
		}

		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		if (principal.getExternal() != null) {
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

		return new ResponseDto<Boolean>(HttpStatus.OK, "유저정보를 업데이트하였습니다.", true, true);
	}

	/**
	 * 아이디 중복 체크
	 * 
	 * @param username
	 * @return
	 */
	@GetMapping("/api/username")
	public ResponseDto<Boolean> usernameCheck(String username) {
		Boolean result = userService.checkUsername(username);
		String msg;
		if (result) {
			msg = "이미 사용중인 아이디입니다.";
		} else {
			msg = "사용 가능한 아이디입니다.";
		}

		return new ResponseDto<Boolean>(HttpStatus.OK, msg, true, result);
	}

	/**
	 * 별명 중복체크
	 * 
	 * @param nickName
	 * @return
	 */
	@GetMapping("/api/nickName")
	public ResponseDto<Boolean> nickNameCheck(String nickName) {
		Boolean result = userService.checkNickName(nickName);
		String msg;
		if (result) {
			msg = "이미 사용중인 닉네임입니다.";
		} else {
			msg = "사용 가능한 닉네임입니다.";
		}

		return new ResponseDto<Boolean>(HttpStatus.OK, msg, true, result);
	}

	/**
	 * 로그인
	 * @param loginDto
	 * @return
	 */
	@PostMapping("/api/login")
	public ResponseDto<Cookie> loginProc(@Valid @RequestBody LoginDto loginDto, BindingResult bindingResult, HttpServletRequest request, HttpServletResponse response) {
		if (bindingResult.hasErrors()) {
			StringBuilder sb = new StringBuilder();
			bindingResult.getAllErrors().forEach(error -> {
				sb.append(error.getDefaultMessage()).append("\\n");
			});
			throw new CustomRestfulException(sb.toString(), HttpStatus.BAD_REQUEST);
		}
		
		ResponseDto<User> resUser = userService.loginByUsernameAndPassword(loginDto);
		User principal = resUser.getData();
		Cookie cookie = null;
		if ("on".equals(loginDto.getRemember())) {
			cookie = new Cookie("id", loginDto.getUsername());
			cookie.setMaxAge(60 * 60 * 24 * 7);
			response.addCookie(cookie);
		} else {
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie c : cookies) {
					if (c.getName().equals("id")) {
						c.setMaxAge(0);
						response.addCookie(c);
						break;
					}
				}
			}
		}
		session.setAttribute("principal", principal);
		if(!resUser.getIsSuccess()) {
			return new ResponseDto<Cookie>(HttpStatus.OK, resUser.getMessage(), false, cookie);
		}

		return new ResponseDto<Cookie>(HttpStatus.OK, Define.REQUEST_SUCCESS, true, cookie);
	}

	/**
	 * 효린 이메일 중복확인
	 * 
	 * @param email
	 * @return T/F
	 */
	@PostMapping("/api/emailAuth")
	public ResponseDto<String> emailAuthCheck(String email) {

		// 가입 유무 확인
		Boolean check = userService.checkEmail(email);
		if (check) {
			return new ResponseDto<String>(HttpStatus.INTERNAL_SERVER_ERROR, "이미 가입된 사용자 이메일입니다.", false, null);
		}
		// 인증번호 생성 
		String key = TempNumberUtil.getAuthKey();

		AuthKey authKey = new AuthKey(email, key);
		// 인증번호 저장
		// userService.createAuthKey(authKey);
		// 인증번호 메일 전송
		mailService.sendAuthKey(authKey);
		return new ResponseDto<String>(HttpStatus.OK, "인증번호가 발송되었습니다.", true, key);
	}




}
