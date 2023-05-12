package com.bandi.novel.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Report {
	
	private int id;
	private int userId;
	private int boardId;
	private String content;
	private int categoryId;
	private int proceed;
	private Timestamp createdAt;

}
