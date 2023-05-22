package com.bandi.novel.dto.response;


import lombok.Data;

@Data
public class KakaoPayPrepareToken {
	
	private String tid;
	private String next_redirect_pc_url;	// pc 웹일 경우 받는 결제 페이지
	private String created_at;
}
