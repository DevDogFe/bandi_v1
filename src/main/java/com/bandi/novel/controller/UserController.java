package com.bandi.novel.controller;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.bandi.novel.dto.OAuthToken;
import com.bandi.novel.dto.OAuthUserInfo;
import com.bandi.novel.model.User;
import com.bandi.novel.service.UserService;
import com.bandi.novel.utils.Define;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

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
	@Value("${bandi.key}")
	private String bandiKey;
	
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
	
	/**
	 * 일반 회원가입
	 * @return
	 */
	@GetMapping("/user")
	public String getJoinForm() {
		
		return "/user/joinForm";
	}
	
	/**
	 * 
	 * @return
	 */
	@PostMapping("/user")
	public String joinProc(User user) {
		
		//todo 비밀번호랑 비밀번호 확인 다를때 처리
		System.out.println(user);
		user.setExternal(false);
		userService.insertUser(user);
		
		return "redirect:/index";
	}
	
	/**
	 * 카카오 로그인
	 */
	@GetMapping("/auth/kakao/callback")
	public String kakaoCallback(@RequestParam String code, Model model) {
		
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "f2f5ec106cf03cddc10930e8d7c58d68");
		params.add("redirect_uri", "http://localhost/auth/kakao/callback");
		params.add("code", code);
		
		HttpEntity<MultiValueMap<String, String>> kakaoReqEntity = new HttpEntity<MultiValueMap<String,String>>(params, httpHeaders);
		ResponseEntity<OAuthToken> responseToken = restTemplate.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST, kakaoReqEntity, OAuthToken.class);
		String username = requestKakaoUserInfo(responseToken.getBody().getAccessToken());
		System.out.println(username);
		User user = new User();
		user.setUsername(username);
		
		user.setPassword(bandiKey);
		User principal = userService.loginByKakao(user);
		if(principal.getEmail() == null) {
			model.addAttribute("user", user);
			return "/user/joinFormForKakao";
		}
		session.setAttribute(Define.PRINCIPAL, principal);
		
		return "redirect:/index";
	}
	
	private String requestKakaoUserInfo(String oAuthToken) {
		
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders httpHeaders = new HttpHeaders();
		// Bearer 다음 반드시 한칸 띄어 쓰기
		httpHeaders.add("Authorization", "Bearer " + oAuthToken);
		httpHeaders.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// 바디 생략
		HttpEntity<String> profileReqEntity = new HttpEntity<>(httpHeaders);
		ResponseEntity<OAuthUserInfo> response = restTemplate.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.GET, profileReqEntity, OAuthUserInfo.class);
		System.out.println(response.getBody().getProperties().getNickname());
		
		return response.getBody().getProperties().getNickname() + response.getBody().getId();
	}
	
	
	
}
