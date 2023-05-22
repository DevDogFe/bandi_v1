package com.bandi.novel.controller;

import java.net.URI;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.bandi.novel.dto.KaKaoPayPrepareToken;
import com.bandi.novel.dto.OAuthToken;
import com.bandi.novel.model.Contest;

@Controller
@RequestMapping("/payment")
public class PayController {
	
	private final String KAKAO_TEST_CID = "TC0ONETIME";
	private final String KAKAO_ADMIN_KEY = "22a92c03555fdcfae421a40a4e0afe06";
	private final RestTemplate restTemplate = new RestTemplate();
	private String kakaoTid = "";
	
	/**
	 * 결제 페이지 이동
	 * @return 
	 */
	@GetMapping("/userPay")
	public String getUserPay() {
		
		return "/pay/userPay";
	}
	
	/**
	 * 결제 요청
	 * @return 
	 */
	@GetMapping("/kakaoPay/ready")
	@ResponseBody // 이녀석은 viewResolver가 아니라 데이터를 반환
	public String KaKaoPayReadyController() {

		URI uri = UriComponentsBuilder.fromUriString("https://kapi.kakao.com")
									.path("/v1/payment/ready")
									.encode()
									.build()
									.toUri();
		
		// header 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK"+KAKAO_ADMIN_KEY);
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// body 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String,String>();
		params.add("cid", KAKAO_TEST_CID);
		params.add("partner_order_id", "partner_order_id");
		params.add("partner_user_id", "partner_user_id");
		params.add("item_name", "단종이 너무 강함");	//상품명
        params.add("quantity", "1");	//주문 수량
        params.add("total_amount", "2200");	//총금액
        params.add("vat_amount", "부가세");	//부가세
        params.add("tax_free_amount", "0");	//상품 비과세 금액
        params.add("approval_url", "http://localhost:8080/pay/kakao/success"); // 성공 시 redirect url
        params.add("cancel_url", "http://localhost:8080/pay/kakao/cancel"); // 취소 시 redirect url
        params.add("fail_url", "http://localhost:8080/pay/kakao/fail"); // 실패 시 redirect url
		
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, headers);
        
        ResponseEntity<KaKaoPayPrepareToken> responseToken = restTemplate.exchange("https://kapi.kakao.com/v1/payment/ready", HttpMethod.POST, requestEntity, KaKaoPayPrepareToken.class);
        KaKaoPayPrepareToken kaKaoPayPrepareToken = responseToken.getBody();
        kakaoTid = kaKaoPayPrepareToken.getTid();
		
		return "redirect:/"+kaKaoPayPrepareToken.getNext_redirect_pc_url();
	}
	
	/**
	 * 결제 승인 요청
	 * @return 
	 */
	@GetMapping("/kakaoPay/success")
	@ResponseBody
	public String KaKaoPaySuccessController() {
		
		
		
		return "";
	}
}
