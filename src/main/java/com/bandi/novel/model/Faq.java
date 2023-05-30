package com.bandi.novel.model;

import lombok.Data;

@Data
public class Faq {
	
	private int id;
	private int faqCategoryId;
	private String categoryName;
	private String question;
	private String answer;

}
