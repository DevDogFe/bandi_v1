package com.bandi.novel.dto;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class CategorySelectDto {
	private Integer id;
	private Integer boardTypeId;
	@NotBlank
	private String categoryName;
}
