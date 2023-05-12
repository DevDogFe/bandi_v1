package com.bandi.novel.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Question {
	
	private int id;
	private int userId;
	private String title;
	private String content;
	private int proceed;
	private Timestamp createdAt; 

}
