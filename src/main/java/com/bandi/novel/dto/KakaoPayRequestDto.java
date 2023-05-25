package com.bandi.novel.dto;

import lombok.Data;

@Data
public class KakaoPayRequestDto {

	private Integer sectionId;
	private Integer novelId;
	private String itemName;
	private Integer quantity;
	private Integer totalAmount;
	private Boolean isRental;
}
