package com.bandi.novel.dto;

import java.sql.Timestamp;

import com.bandi.novel.utils.TimestampFormat;

import lombok.Data;

@Data
public class QnaDto {
	
	private Integer id;
	private Integer userId;
	private String title;
	private String content;
	private Integer faqCategoryId;
	private Integer proceed;
	private Timestamp createdAt;
	
	private String username;
	private String CategoryName;
	
	public String createdAt() {
		
		return TimestampFormat.dateFormat(createdAt);
	}
	

}
