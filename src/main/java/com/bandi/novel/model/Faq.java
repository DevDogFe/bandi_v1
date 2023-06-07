package com.bandi.novel.model;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class Faq {
	
	private int id;
	private int faqCategoryId;
	private String categoryName;
	@NotBlank
	private String question;
	@NotBlank
	private String answer;

}
