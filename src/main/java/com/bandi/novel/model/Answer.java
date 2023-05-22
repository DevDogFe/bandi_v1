package com.bandi.novel.model;

import java.sql.Timestamp;

import com.bandi.novel.utils.TimestampFormat;

import lombok.Data;

@Data
public class Answer {
	
	private Integer id;
	private Integer userId;
	private String content;
	private Integer questionId;
	private Timestamp createdAt;

	public String createdAt() {
		
		return TimestampFormat.dateFormat(createdAt);
	}

	

}
