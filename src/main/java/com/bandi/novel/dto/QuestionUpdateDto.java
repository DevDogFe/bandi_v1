package com.bandi.novel.dto;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class QuestionUpdateDto {
	
	private int id;
	private int userId;
	@NotBlank
	private String title;
	@NotBlank
	private String content;
	private String faqCategoryId;

}
