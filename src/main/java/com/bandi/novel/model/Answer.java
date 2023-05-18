package com.bandi.novel.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Answer {
	
	private Integer id;
	private Integer userId;
	private String content;
	private Integer questionId;
	private Timestamp createdAt;
	
	

}
