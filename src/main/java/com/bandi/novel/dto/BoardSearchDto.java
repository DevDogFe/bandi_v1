package com.bandi.novel.dto;

import lombok.Data;

@Data
public class BoardSearchDto {

	// 검색 필터
	private Integer boardTypeId;
	private Integer categoryId;
	private String type;
	private String keyword;
}
