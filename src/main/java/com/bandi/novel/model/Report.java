package com.bandi.novel.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Report {
	
	private Integer id;
	private Integer userId;
	private Integer boardId;
	private String content;
	private Integer categoryId;
	private Integer proceed;
	private Timestamp createdAt;

}
