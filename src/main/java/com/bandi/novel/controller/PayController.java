package com.bandi.novel.controller;

import java.net.URI;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.bandi.novel.dto.KakaoPayRequestDto;
import com.bandi.novel.dto.response.KakaoPayPrepareToken;
import com.bandi.novel.dto.response.KakaoPaySuccessResponse;
import com.bandi.novel.model.User;
import com.bandi.novel.service.PayService;
import com.bandi.novel.utils.Define;

@Controller
@RequestMapping("/payment")
public class PayController {

	@Autowired
	private HttpSession session;
	@Autowired
	private PayService payService;

	private final String KAKAO_TEST_CID = "TC0ONETIME";
	private final String KAKAO_ADMIN_KEY = "22a92c03555fdcfae421a40a4e0afe06";
	private final RestTemplate restTemplate = new RestTemplate();
	private String kakaoTid = "";

	/**
	 * 결제 페이지 이동
	 * 
	 * @return
	 */
	@GetMapping("/userPay")
	public String getUserPay() {

		return "/pay/userPay";
	}

	/**
	 * 골드 충전 페이지 이동
	 * 
	 * @return
	 */
	@GetMapping("/charge")
	public String getChargeGold(Model model) {

		User principal = (User) session.getAttribute(Define.PRINCIPAL);

		int userGold = payService.selectUserGold(principal.getId());
		model.addAttribute("userGold", userGold);

		return "/pay/chargeGold";
	}

	/**
	 * 단편결제 요청
	 * 
	 * @return
	 */
	@PostMapping("/kakaoPay/ready")
	public String KakaoPayReadyController(KakaoPayRequestDto dto) {

		URI uri = UriComponentsBuilder.fromUriString("https://kapi.kakao.com").path("/v1/payment/ready").encode()
				.build().toUri();

		// header 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + KAKAO_ADMIN_KEY);
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// body 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("cid", KAKAO_TEST_CID);
		params.add("partner_order_id", "partner_order_id");
		params.add("partner_user_id", "partner_user_id");
		params.add("item_name", dto.getItemName()); // 상품명
		params.add("quantity", dto.getQuantity().toString()); // 주문 수량
		params.add("total_amount", dto.getTotalAmount().toString()); // 총금액
		params.add("vat_amount", "0"); // 부가세
		params.add("tax_free_amount", "0"); // 상품 비과세 금액
		params.add("approval_url", "http://localhost/payment/kakao/success/"+ dto.getNovelId() + "/"
				+ dto.getSectionId()); // 성공 시 redirect url
		params.add("fail_url", "http://localhost/payment/kakao/fail"); // 실패 시 redirect url
		params.add("cancel_url", "http://localhost/payment/kakao/cancel"); // 취소 시 redirect url

		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, headers);

		ResponseEntity<KakaoPayPrepareToken> responseToken = restTemplate.exchange(uri, HttpMethod.POST, requestEntity,
				KakaoPayPrepareToken.class);
		System.out.println(responseToken.toString());

		KakaoPayPrepareToken kakaoPayPrepareToken = responseToken.getBody();
		kakaoTid = kakaoPayPrepareToken.getTid();

		return "redirect:" + kakaoPayPrepareToken.getNext_redirect_pc_url();
	}

	/**
	 * 결제 승인 요청
	 * 
	 * @return
	 */
	@GetMapping("/kakao/success/{novelId}/{sectionId}")
	public String KaKaoPaySuccessController(@PathVariable Integer novelId, @PathVariable Integer sectionId,
			String pg_token) {

		User principal = (User) session.getAttribute(Define.PRINCIPAL);

		URI uri = UriComponentsBuilder.fromUriString("https://kapi.kakao.com").path("/v1/payment/approve").encode()
				.build().toUri();

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + KAKAO_ADMIN_KEY);
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// body 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("cid", KAKAO_TEST_CID);
		params.add("tid", kakaoTid);
		params.add("partner_order_id", "partner_order_id");
		params.add("partner_user_id", "partner_user_id");
		params.add("pg_token", pg_token);

		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, headers);
		ResponseEntity<KakaoPaySuccessResponse> response = restTemplate.exchange(uri, HttpMethod.POST, requestEntity,
				KakaoPaySuccessResponse.class);

		KakaoPaySuccessResponse kakaoSinglePayment = response.getBody();
		
		
		//유저 골드 정보 변경
		payService.purchaseNovel(principal.getId(),response.getBody().getAmount().getTotal());
		//유저 결제 회차 삽입
		payService.insertUserLibrary(principal.getId(),sectionId);

		return "redirect:/section/read/{novelId}/{sectionId}";
	}
}
