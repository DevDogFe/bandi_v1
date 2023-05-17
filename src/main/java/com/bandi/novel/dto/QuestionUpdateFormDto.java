package com.bandi.novel.dto;

import lombok.Data;

@Data
public class QuestionUpdateFormDto {
	
	private int id;
	private int userId;
	private String title;
	private String content;
	private String faqCategoryId;

}
