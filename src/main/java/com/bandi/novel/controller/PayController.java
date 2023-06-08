package com.bandi.novel.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.bandi.novel.dto.KakaoPayRequestDto;
import com.bandi.novel.dto.KakaoRefundRequestDto;
import com.bandi.novel.dto.response.KakaoPayPrepareToken;
import com.bandi.novel.dto.response.KakaoPaySuccessResponse;
import com.bandi.novel.dto.response.KakaoRefundResponse;
import com.bandi.novel.dto.response.LastNovelRecordDto;
import com.bandi.novel.dto.response.RecommendFavoritesDto;
import com.bandi.novel.handler.exception.CustomRestfulException;
import com.bandi.novel.model.User;
import com.bandi.novel.service.PayService;
import com.bandi.novel.service.RecommendService;
import com.bandi.novel.service.UserNovelRecordService;
import com.bandi.novel.utils.Define;

@Controller
@RequestMapping("/payment")
public class PayController {

	@Autowired
	private HttpSession session;
	@Autowired
	private PayService payService;
	@Autowired
	private UserNovelRecordService userNovelRecordService;
	@Autowired
	private RecommendService recommendService;

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
	public String getUserPay(Model model) {
		
		User principal = (User) session.getAttribute(Define.PRINCIPAL);

		// 장르기반 추천리스트
		List<RecommendFavoritesDto> genreList = recommendService.selectNovelByFavoriteGenre(principal.getId());
		// 우측 바에 마지막 으로 본 소설
		LastNovelRecordDto lastNovel = userNovelRecordService.selectLastNovelRecord(principal.getId());
		// 우측바 유저 골드 정보,
		Integer gold = payService.selectUserGold(principal.getId());
		
		model.addAttribute("genreList", genreList);
		model.addAttribute("gold", gold);
		model.addAttribute("lastNovel", lastNovel);

		
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

		// 장르기반 추천리스트
		List<RecommendFavoritesDto> genreList = recommendService.selectNovelByFavoriteGenre(principal.getId());
		// 우측 바에 마지막 으로 본 소설
		LastNovelRecordDto lastNovel = userNovelRecordService.selectLastNovelRecord(principal.getId());
		// 우측바 유저 골드 정보,
		Integer gold = payService.selectUserGold(principal.getId());
		
		model.addAttribute("genreList", genreList);
		model.addAttribute("gold", gold);
		model.addAttribute("lastNovel", lastNovel);

		return "/pay/chargeGold";
	}

	/**
	 * 골드 결제 환불 요청
	 * 
	 * @return
	 */
	@PostMapping("/gold/refund")
	public String goldRefund(KakaoRefundRequestDto dto) {

		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		URI uri = UriComponentsBuilder.fromUriString("https://kapi.kakao.com").path("/v1/payment/cancel").encode()
				.build().toUri();

		HttpHeaders headers = getPayReadyHeader();

		// body 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("cid", KAKAO_TEST_CID);
		params.add("tid", dto.getTid());
		params.add("cancel_amount", dto.getRefundPrice().toString()); // 취소 금액
		params.add("cancel_tax_free_amount", "0"); // 취소 비과세 금액

		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, headers);

		try {
			ResponseEntity<KakaoRefundResponse> responseToken = restTemplate.exchange(uri, HttpMethod.POST,
					requestEntity, KakaoRefundResponse.class);

			if (responseToken.getBody().getAmount().getTotal() != 0) {
				payService.RefundGold(principal.getId(), responseToken.getBody().getAmount().getTotal(), dto.getId());

			} else {
				throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} catch (Exception e) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return "redirect:/myInfo";
	}

	/**
	 * 골드 결제 처리
	 * 
	 * @return
	 */
	@PostMapping("/gold/purchase/{serviceTypeId}")
	public String goldPurchase(@PathVariable Integer serviceTypeId, KakaoPayRequestDto dto,
			HttpServletResponse response) {

		// 유저 골드 확인하고 금액보다 적으면 골드 충전 페이지로 이동
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		if (!((payService.selectUserGold(principal.getId()) - dto.getTotalAmount()) >= 0)) {
			PrintWriter out;
			response.setContentType("text/html;charset=UTF-8");
			try {
				out = response.getWriter();
				out.println("<script>alert('골드가 부족합니다.'); location.href='/payment/charge'</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			// 골드 결제 처리
			payService.purchaseNovel(principal.getId(), dto.getTotalAmount(), dto.getSectionId());
		}

		return "redirect:/section/read/" + dto.getNovelId() + "/" + dto.getSectionId() + "/" + serviceTypeId;
	}

	/**
	 * 골드 대여 처리
	 * 
	 * @return
	 */
	@PostMapping("/gold/rental/{serviceTypeId}")
	public String goldRental(@PathVariable Integer serviceTypeId, KakaoPayRequestDto dto,
			HttpServletResponse response) {

		// 유저 골드 확인하고 금액보다 적으면 골드 충전 페이지로 이동
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		if (!((payService.selectUserGold(principal.getId()) - dto.getTotalAmount()) >= 0)) {
			PrintWriter out;
			response.setContentType("text/html;charset=UTF-8");
			try {
				out = response.getWriter();
				out.println("<script>alert('골드가 부족합니다.'); location.href='/payment/charge'</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			// 골드 대여 처리
			payService.rentalNovel(principal.getId(), dto.getTotalAmount(), dto.getSectionId());
		}

		return "redirect:/section/read/" + dto.getNovelId() + "/" + dto.getSectionId() + "/" + serviceTypeId;
	}

	/**
	 * 단편 결제, 대여 요청
	 * 
	 * @return
	 */
	@PostMapping("/kakaoPay/ready/{serviceTypeId}")
	public String KakaoPayReadyController(@PathVariable Integer serviceTypeId, KakaoPayRequestDto dto,
			HttpServletResponse response) {

		/*
		 * // 유저 골드 확인하고 금액보다 적으면 골드 충전 페이지로 이동 User principal = (User)
		 * session.getAttribute(Define.PRINCIPAL); if
		 * (!((payService.selectUserGold(principal.getId()) - dto.getTotalAmount()) >=
		 * 0)) { PrintWriter out; response.setContentType("text/html;charset=UTF-8");
		 * try { out = response.getWriter(); out.
		 * println("<script>alert('금액이 부족합니다.'); location.href='/payment/charge'</script>"
		 * ); out.flush(); } catch (IOException e) { e.printStackTrace(); } }
		 */

		URI uri = UriComponentsBuilder.fromUriString("https://kapi.kakao.com").path("/v1/payment/ready").encode()
				.build().toUri();

		// header 생성
		HttpHeaders headers = getPayReadyHeader();

		// body 생성
		MultiValueMap<String, String> params = getPayReadyBody();
		params.add("item_name", dto.getItemName()); // 상품명
		params.add("quantity", dto.getQuantity().toString()); // 주문 수량
		params.add("total_amount", dto.getTotalAmount().toString()); // 총금액

		if (dto.getIsRental() != null) {
			// 성공 시 redirect url
			params.add("approval_url", "http://192.168.0.82/payment/kakao/rental/success/" + dto.getNovelId() + "/"
					+ dto.getSectionId() + "/" + serviceTypeId);
		} else {
			params.add("approval_url", "http://192.168.0.82/payment/kakao/purchase/success/" + dto.getNovelId() + "/"
					+ dto.getSectionId() + "/" + serviceTypeId);
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
	 * 
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
		params.add("approval_url", "http://192.168.0.82/payment/kakao/gold/success"); // 성공 시 redirect url

		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, headers);

		ResponseEntity<KakaoPayPrepareToken> responseToken = restTemplate.exchange(uri, HttpMethod.POST, requestEntity,
				KakaoPayPrepareToken.class);

		KakaoPayPrepareToken kakaoPayPrepareToken = responseToken.getBody();
		kakaoTid = kakaoPayPrepareToken.getTid();

		return "redirect:" + kakaoPayPrepareToken.getNext_redirect_pc_url();
	}

	/**
	 * 단편 결제 승인 요청
	 * 
	 * @return
	 */
	@GetMapping("/kakao/purchase/success/{novelId}/{sectionId}/{serviceTypeId}")
	public String KaKaoPaySuccessController(@PathVariable Integer novelId, @PathVariable Integer sectionId,
			@PathVariable Integer serviceTypeId, String pg_token) {

		KakaoPaySuccessResponse kakaoSinglePayment = getKakaoSuccess(pg_token);
		User principal = (User) session.getAttribute(Define.PRINCIPAL);

		// 유저 골드 사용 구매 처리
		payService.purchaseNovel(principal.getId(), kakaoSinglePayment.getAmount().getTotal(), sectionId);
		// 유저 결제 회차 삽입 !!!!!!
		payService.insertUserLibrary(principal.getId(), sectionId);
		
		

		return "redirect:/section/read/" + novelId + "/" + sectionId + "/" + serviceTypeId;
	}

	/**
	 * 단편 대여 결제 승인 요청
	 * 
	 * @return
	 */
	@GetMapping("/kakao/rental/success/{novelId}/{sectionId}/{serviceTypeId}")
	public String KaKaoPayRentalSuccessController(@PathVariable Integer novelId, @PathVariable Integer sectionId,
			@PathVariable Integer serviceTypeId, String pg_token) {

		KakaoPaySuccessResponse kakaoSinglePayment = getKakaoSuccess(pg_token);
		User principal = (User) session.getAttribute(Define.PRINCIPAL);

		// 유저 골드 사용 대여 처리
		payService.rentalNovel(principal.getId(), kakaoSinglePayment.getAmount().getTotal(), sectionId);

		
		
		return "redirect:/section/read/" + novelId + "/" + sectionId + "/" + serviceTypeId;
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
		payService.chargeGold(principal.getId(), kakaoSinglePayment.getAmount().getTotal(),
				kakaoSinglePayment.getTid());

		return "redirect:/main";
	}

	// 클래스화
	/**
	 * 결제 요청 헤더
	 * 
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
		params.add("fail_url", "http://192.168.0.82/payment/kakao/fail"); // 실패 시 redirect url
		params.add("cancel_url", "http://192.168.0.82/payment/kakao/cancel"); // 취소 시 redirect url

		return params;
	}

	/**
	 * 결제 승인 요청
	 * 
	 * @return
	 */
	public KakaoPaySuccessResponse getKakaoSuccess(String pg_token) {

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
