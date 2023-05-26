package com.bandi.novel.dto.response;

import lombok.Data;

@Data
public class KakaoRefundResponse {
	private String aid; // 요청 고유 번호
    private String tid; // 결제 고유 번호
    private String cid; // 가맹점 코드
    private String status;
    private String partner_order_id; // 가맹점 주문 번호
    private String partner_user_id; // 가맹점 회원 id
    private String payment_method_type; // 결제 수단
    private KakaoAmount amount; // 결제 금액 정보
    private KakaoAmount approved_cancel_amount; // 이번 요청으로 취소된 금액
    private KakaoAmount canceled_amount; // 누계 취소 금액
    private KakaoAmount cancel_available_amount; // 남은 취소 가능 금액
    private String item_name; // 상품명
    private String item_code; // 상품 코드
    private int quantity; // 상품 수량
    private String created_at; // 결제 요청 시간
    private String approved_at; // 결제 승인 시간
    private String payload; // 결제 승인 요청에 대해 저장 값, 요청 시 전달 내용
}
