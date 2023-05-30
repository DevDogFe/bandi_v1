package com.bandi.novel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.bandi.novel.dto.LoginDto;
import com.bandi.novel.dto.UserUpdateDto;
import com.bandi.novel.dto.response.ResponseDto;
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
	public ResponseDto<Boolean> updateProc(@RequestBody UserUpdateDto userUpdateDto) {
		
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

		return new ResponseDto<Boolean>(200, "20000", "유저정보를 업데이트하였습니다.", "20000", true);
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
	 * 
	 * URL 설계 !!! Query String --> 정렬된 데이터 처리 사용 
	 * path // 정렬되지 않은 데이터 !!! -- 일괄적으로 //
	 */
	@GetMapping("/api/nickname")
	public Boolean nickNameCheck(String nickName) {
		return userService.checkNickName(nickName);
	}

	@PostMapping("/api/login")
	public ResponseDto<Boolean> loginProc(@RequestBody LoginDto loginDto) {
		ResponseDto<User> resUser = userService.loginByUsernameAndPassword(loginDto);
		Boolean result = true;
		if (resUser.getData() == null) {
			result = false;
		}
		User principal = resUser.getData();
		session.setAttribute("principal", principal);

		return new ResponseDto<Boolean>(resUser.getStatusCode(), resUser.getCode(), resUser.getMessage(),
				resUser.getResultCode(), result);
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
			System.out.println("이미 가입된 사용자 이메일입니다");
			return new ResponseDto<String>(500, "50000", "이미 가입된 사용자 이메일입니다.", "50000", null);
		}
		// 인증번호 생성 
		String key = TempNumberUtil.getAuthKey();

		AuthKey authKey = new AuthKey(email, key);
		// 인증번호 저장
		// userService.createAuthKey(authKey);
		// 인증번호 메일 전송
		mailService.sendAuthKey(authKey);
		return new ResponseDto<String>(200, "20000", "인증번호가 발송되었습니다.", "20000", key);
	}

	/**
	 * 효린 이메일 인증번호
	 * 
	 * @param inputKey
	 * @param email
	 * @return T/F
	 */
	@PostMapping("/api/authKey")
	public Boolean authKeycheck(String inputKey, String email) {

		return userService.checkAuthKey(email, inputKey);
	}

//	private HttpEntity<MultiValueMap<String, String>> generateAuthCodeRequest(String code, String state) {
//		HttpHeaders headers = new HttpHeaders();
//		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
//
//		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
//		params.add("grant_type", "authorization_code");
//		params.add("client_id", "BbvLPxHgxKiCdntADysv");
//		params.add("client_secret", "lJW7tHYXp6");
//		params.add("code", code);
//		return new HttpEntity<>(params, headers);
//	}
//
//	private ResponseEntity<NaverOAuthToken> requestAccessToken(HttpEntity request) {
//		RestTemplate restTemplate = new RestTemplate();
//
//		ResponseEntity<NaverOAuthToken> token = restTemplate.exchange("https://nid.naver.com/oauth2.0/token", HttpMethod.POST, request, NaverOAuthToken.class);
//		
//		return token;
//	}
//
//	private ResponseEntity<OAuthUserInfoForNaver> requestProfile(HttpEntity request) {
//		RestTemplate restTemplate = new RestTemplate();
//		return restTemplate.exchange("https://openapi.naver.com/v1/nid/me", HttpMethod.GET, request, OAuthUserInfoForNaver.class);
//	}
//
//	private HttpEntity<MultiValueMap<String, String>> generateProfileRequest(String accessToken) {
//		HttpHeaders headers = new HttpHeaders();
//		headers.add("Authorization", "Bearer " + accessToken);
//		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
//		System.out.println(headers);
//		return new HttpEntity<>(headers);
//	}
//
//	@GetMapping("/naver/auth")
//	public String authNaver(@RequestParam String code, @RequestParam String state) {
//		System.out.println(state);
//		ResponseEntity<NaverOAuthToken> token = requestAccessToken(generateAuthCodeRequest(code, state));
//		System.out.println(token);
//		HttpEntity<MultiValueMap<String, String>> entity = generateProfileRequest(token.getBody().getAccessToken());
//		String username =  requestProfile(entity).getBody().getResponse().getId();
//		User user = new User();
//		user.setUsername(username);
//		user.setPassword(bandiKey);
//		User principal = userService.loginByNaver(user);
//		session.setAttribute(Define.PRINCIPAL, principal);
//		return username;
//	}

}
