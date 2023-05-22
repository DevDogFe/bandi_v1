package com.bandi.novel.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)	// 네이밍 전략
public class KaKaoPayPrepareToken {
	
	private String tid;
	private String next_redirect_pc_url;	// pc 웹일 경우 받는 결제 페이지
	private String created_at;
}
