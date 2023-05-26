package com.bandi.novel.dto;

import lombok.Data;

@Data
public class KakaoRefundRequestDto {
	
	private Integer id;	// gold_charge_tb의 id(PK)
	private String itemName;
	private String tid;	// 거래 내역의 id
	private Integer RefundPrice;
}
