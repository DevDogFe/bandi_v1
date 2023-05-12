package com.bandi.novel.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Board {
	
	private int id;
	private int userId;
	private int boardTypeId;
	private String title;
	private String content;
	private int likes;
	private int views;
	private int categoryId;
	private Timestamp createdAt;

}
