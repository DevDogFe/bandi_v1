package com.bandi.novel.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardDto {
	private int id;
	private int userId;
	private String username;
	private int boardTypeId;
	private String boardName;
	private String title;
	private String content;
	private int categoryId;
	private String categoryName;
	private Timestamp createdAt;
}
