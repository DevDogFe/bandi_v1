package com.bandi.novel.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Answer {
	
	private int id;
	private int userId;
	private String content;
	private Timestamp createdAt;

}
