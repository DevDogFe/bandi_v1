package com.bandi.novel.model;

import java.sql.Timestamp;

import com.bandi.novel.utils.TimestampFormat;

import lombok.Data;

@Data
public class Question {
	
	private Integer id;
	private Integer userId;
	private String title;
	private String content;
	private Integer faqCategoryId;
	private Integer proceed;
	private Timestamp createdAt;
	
	private String username;
	private String CategoryName;
	
	private String answer;
	private Timestamp answerCreatedAt; 
	
	
	public String createdAt() {
		
		return TimestampFormat.dateFormat(createdAt);
	}
	
	public String answerCreatedAt() {
		
		return TimestampFormat.dateFormat(answerCreatedAt);
	}

}
