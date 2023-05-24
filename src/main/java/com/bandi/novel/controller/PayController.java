package com.bandi.novel.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.security.Principal;

import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	 * @return
	 */
	@GetMapping("/userPay")
	public String getUserPay() {

		return "/pay/userPay";
	}

	/**
	 * 골드 충전 페이지 이동
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
	 * 단편 결제, 대여 요청
	 * @return
	 */
	@PostMapping("/kakaoPay/ready")
	public String KakaoPayReadyController(KakaoPayRequestDto dto, HttpServletResponse response) {

		// 유저 골드 확인하고 금액보다 적으면 골드 충전 페이지로 이동
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		if (!((payService.selectUserGold(principal.getId()) - dto.getTotalAmount()) >= 0)) {
			PrintWriter out;
			response.setContentType("text/html;charset=UTF-8");
			try {
				out = response.getWriter();
				out.println("<script>alert('금액이 부족합니다.'); location.href='/payment/charge'</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		URI uri = UriComponentsBuilder.fromUriString("https://kapi.kakao.com").path("/v1/payment/ready").encode()
				.build().toUri();

		// header 생성
		HttpHeaders headers = getPayReadyHeader();

		// body 생성
		MultiValueMap<String, String> params = getPayReadyBody();
		params.add("item_name", dto.getItemName()); // 상품명
		params.add("quantity", dto.getQuantity().toString()); // 주문 수량
		params.add("total_amount", dto.getTotalAmount().toString()); // 총금액

		if (dto.isRental()) {
			// 성공 시 redirect url
			params.add("approval_url","http://localhost/payment/kakao/purchase/success/" + dto.getNovelId() + "/" + dto.getSectionId());
		} else {
			params.add("approval_url","http://localhost/payment/rental/kakao/success/" + dto.getNovelId() + "/" + dto.getSectionId()); 
		}

		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, headers);

		ResponseEntity<KakaoPayPrepareToken> responseToken = restTemplate.exchange(uri, HttpMethod.POST, requestEntity,
				KakaoPayPrepareToken.class);

		KakaoPayPrepareToken kakaoPayPrepareToken = responseToken.getBody();
		kakaoTid = kakaoPayPrepareToken.getTid();

		return "redirect:" + kakaoPayPrepareToken.getNext_redirect_pc_url();
	}

	/**
	 * 골드 충전 요청
	 * @return
	 */
	@PostMapping("/kakaoPay/gold/ready")
	public String KakaoPayGoldChargeController(KakaoPayRequestDto dto) {

		URI uri = UriComponentsBuilder.fromUriString("https://kapi.kakao.com").path("/v1/payment/ready").encode()
				.build().toUri();

		// header 생성
		HttpHeaders headers = getPayReadyHeader();

		// body 생성
		MultiValueMap<String, String> params = getPayReadyBody();
		params.add("item_name", dto.getItemName()); // 상품명
		params.add("quantity", dto.getQuantity().toString()); // 주문 수량
		params.add("total_amount", dto.getTotalAmount().toString()); // 총금액
		params.add("approval_url", "http://localhost/payment/kakao/gold/success"); // 성공 시 redirect url

		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, headers);

		ResponseEntity<KakaoPayPrepareToken> responseToken = restTemplate.exchange(uri, HttpMethod.POST, requestEntity,
				KakaoPayPrepareToken.class);

		KakaoPayPrepareToken kakaoPayPrepareToken = responseToken.getBody();
		kakaoTid = kakaoPayPrepareToken.getTid();

		return "redirect:" + kakaoPayPrepareToken.getNext_redirect_pc_url();
	}

	/**
	 * 단편 결제 승인 요청
	 * @return
	 */
	@GetMapping("/kakao/purchase/success/{novelId}/{sectionId}")
	public String KaKaoPaySuccessController(@PathVariable Integer novelId, @PathVariable Integer sectionId,
			String pg_token) {

		KakaoPaySuccessResponse kakaoSinglePayment = getKakaoSuccess(pg_token);
		User principal = (User) session.getAttribute(Define.PRINCIPAL);

		// 유저 골드 사용 구매 처리
		payService.purchaseNovel(principal.getId(), kakaoSinglePayment.getAmount().getTotal());
		// 유저 결제 회차 삽입 !!!!!!
		payService.insertUserLibrary(principal.getId(), sectionId);

		return "redirect:/section/read/{novelId}/{sectionId}";
	}
	
	/**
	 * 단편 대여 결제 승인 요청
	 * @return
	 */
	@GetMapping("/kakao/rental/success/{novelId}/{sectionId}")
	public String KaKaoPayRentalSuccessController(@PathVariable Integer novelId, @PathVariable Integer sectionId,
			String pg_token) {

		KakaoPaySuccessResponse kakaoSinglePayment = getKakaoSuccess(pg_token);
		User principal = (User) session.getAttribute(Define.PRINCIPAL);

		// 유저 골드 사용 대여 처리
		payService.rentalNovel(principal.getId(), kakaoSinglePayment.getAmount().getTotal());

		return "redirect:/section/read/{novelId}/{sectionId}";
	}

	/**
	 * 골드 결제 승인 요청
	 * 
	 * @return
	 */
	@GetMapping("/kakao/gold/success")
	public String KaKaoPayGoldSuccessController(String pg_token) {

		KakaoPaySuccessResponse kakaoSinglePayment = getKakaoSuccess(pg_token);
		User principal = (User) session.getAttribute(Define.PRINCIPAL);

		// 유저 골드 정보 변경
		payService.chargeGold(principal.getId(), kakaoSinglePayment.getAmount().getTotal());

		return "redirect:/index";
	}

	// 클래스화
	/**
	 * 결제 요청 헤더
	 * @return
	 */
	public HttpHeaders getPayReadyHeader() {

		// header 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + KAKAO_ADMIN_KEY);
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		return headers;
	}

	/**
	 * 결제 요청 바디
	 * 
	 * @return
	 */
	public MultiValueMap<String, String> getPayReadyBody() {

		// body 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("cid", KAKAO_TEST_CID);
		params.add("partner_order_id", "partner_order_id");
		params.add("partner_user_id", "partner_user_id");
		params.add("vat_amount", "0"); // 부가세
		params.add("tax_free_amount", "0"); // 상품 비과세 금액
		params.add("fail_url", "http://localhost/payment/kakao/fail"); // 실패 시 redirect url
		params.add("cancel_url", "http://localhost/payment/kakao/cancel"); // 취소 시 redirect url

		return params;
	}

	/**
	 * 결제 승인 요청
	 * 
	 * @return
	 */
	public KakaoPaySuccessResponse getKakaoSuccess(String pg_token) {

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

		return response.getBody();
	}
	//
}
