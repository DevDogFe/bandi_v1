package com.bandi.novel.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QnaDto {
	
	// question
	private Integer id;
	private Integer userId;
	private String title;
	private String questContent;
	private Integer faqCategoryId;
	private Integer proceed;
	private Timestamp questcreatedAt; 
	
	// answer
	private String ansContent;
	private Timestamp anscreatedAt;

}
