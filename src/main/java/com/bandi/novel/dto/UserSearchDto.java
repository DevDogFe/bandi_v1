package com.bandi.novel.dto;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class UserSearchDto {
	
	private String type;
	@NotBlank
	private String keyword;
	
}
