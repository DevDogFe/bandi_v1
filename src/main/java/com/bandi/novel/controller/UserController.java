package com.bandi.novel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.bandi.novel.dto.FindPwdDto;
import com.bandi.novel.dto.JoinDto;
import com.bandi.novel.dto.NaverOAuthToken;
import com.bandi.novel.dto.OAuthToken;
import com.bandi.novel.dto.OAuthUserInfo;
import com.bandi.novel.dto.OAuthUserInfoForNaver;
import com.bandi.novel.handler.exception.CustomRestfulException;
import com.bandi.novel.model.User;
import com.bandi.novel.service.MailService;
import com.bandi.novel.service.UserService;
import com.bandi.novel.utils.Define;
import com.bandi.novel.utils.TempNumberUtil;

/**
 * 유저 관련 로직 컨트롤러
 * 
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
	@Autowired
	private MailService mailService;
	


	/**
	 * 로그아웃
	 * 
	 * @return
	 */
	@GetMapping("/logout")
	public String logoutProc() {

		session.invalidate();

		return "redirect:/main";
	}

	/**
	 * 일반 회원가입
	 * 
	 * @return
	 */
	@GetMapping("/user")
	public String getJoinForm() {

		return "/user/joinForm";
	}

	/**
	 * 회원가입 프로세스
	 * @return
	 */
	@PostMapping("/user")
	public String joinProc(JoinDto joinDto) {
		
		//todo 비밀번호랑 비밀번호 확인 다를때 처리
		if(!joinDto.getPassword().equals(joinDto.getPasswordCheck())) {
			throw new CustomRestfulException("비밀번호란과 비밀번호 확인란의 값이 다릅니다.", HttpStatus.BAD_REQUEST);
		}
		userService.insertUser(joinDto);
		
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

		HttpEntity<MultiValueMap<String, String>> kakaoReqEntity = new HttpEntity<MultiValueMap<String, String>>(params,
				httpHeaders);
		ResponseEntity<OAuthToken> responseToken = restTemplate.exchange("https://kauth.kakao.com/oauth/token",
				HttpMethod.POST, kakaoReqEntity, OAuthToken.class);
		String username = requestKakaoUserInfo(responseToken.getBody().getAccessToken());
		User user = new User();
		user.setUsername(username);
		user.setPassword(bandiKey);
		User principal = userService.loginByKakao(user);
		if (principal.getEmail() == null) {
			model.addAttribute("user", user);
			return "/user/joinFormForKakao";
		}
		session.setAttribute(Define.PRINCIPAL, principal);

		return "redirect:/index";
	}

	// accessToken에서 사용자 정보 뽑아내는 메서드
	private String requestKakaoUserInfo(String oAuthToken) {

		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Authorization", "Bearer " + oAuthToken);
		httpHeaders.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		HttpEntity<String> profileReqEntity = new HttpEntity<>(httpHeaders);
		ResponseEntity<OAuthUserInfo> response = restTemplate.exchange("https://kapi.kakao.com/v2/user/me",
				HttpMethod.GET, profileReqEntity, OAuthUserInfo.class);

		return response.getBody().getProperties().getNickname() + response.getBody().getId();
	}

	/**
	 * 유저 정보 업데이트 폼
	 * 
	 * @param model
	 * @return updateForm.jsp
	 */
	@GetMapping("/update")
	private String getUpdateForm(Model model) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		model.addAttribute("principal", principal);

		return "/user/updateForm";
	}

	/**
	 * 비밀번호 찾기 폼
	 * @author 효린
	 */
	@GetMapping("/findPwd")
	private String getFindPwd() {

		return "/user/findPwdForm";
	}

	/** 비밀번호 찾기
	 * @author 효린 
	 * @return index페이지
	 */
	@PostMapping("/findPwd")
	private String findPwd(FindPwdDto findPwdDto) {

		User user = userService.selectUserByUsernameAndEmail(findPwdDto);
		// 임시 비밀번호 생성
		user.setPassword(TempNumberUtil.getTempPassword());		
		//userService.updateUserPwd(user);
		// 메일 전송
		mailService.sendTempPassword(user);
		// 비밀번호변경
		userService.updateUserPwd(user);
		return "redirect:/index";
	}
	
	private HttpEntity<MultiValueMap<String, String>> generateAuthCodeRequest(String code, String state) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "BbvLPxHgxKiCdntADysv");
		params.add("client_secret", "lJW7tHYXp6");
		params.add("code", code);
		return new HttpEntity<>(params, headers);
	}
	
	

	private ResponseEntity<NaverOAuthToken> requestAccessToken(HttpEntity request) {
		RestTemplate restTemplate = new RestTemplate();

		ResponseEntity<NaverOAuthToken> token = restTemplate.exchange("https://nid.naver.com/oauth2.0/token", HttpMethod.POST, request, NaverOAuthToken.class);
		
		return token;
	}

	private ResponseEntity<OAuthUserInfoForNaver> requestProfile(HttpEntity request) {
		RestTemplate restTemplate = new RestTemplate();
		return restTemplate.exchange("https://openapi.naver.com/v1/nid/me", HttpMethod.GET, request, OAuthUserInfoForNaver.class);
	}

	private HttpEntity<MultiValueMap<String, String>> generateProfileRequest(String accessToken) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer " + accessToken);
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		return new HttpEntity<>(headers);
	}

	@GetMapping("/naver/auth")
	public String authNaver(@RequestParam String code, @RequestParam String state, Model model) {
		ResponseEntity<NaverOAuthToken> token = requestAccessToken(generateAuthCodeRequest(code, state));
		System.out.println(token);
		HttpEntity<MultiValueMap<String, String>> entity = generateProfileRequest(token.getBody().getAccessToken());
		String username =  requestProfile(entity).getBody().getResponse().getId();
		User user = new User();
		user.setUsername(username);
		user.setPassword(bandiKey);
		User principal = userService.loginByNaver(user);
		if(principal.getEmail() == null) {
			model.addAttribute("user", user);
			return "/user/joinFormForNaver";
		}
		session.setAttribute(Define.PRINCIPAL, principal);
		return "redirect:/index";
	}
	
}
