package com.bandi.novel.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardDetailDto {
	private int id;
	private int userId;
	private int boardTypeId;
	private String username;
	private String title;
	private String content;
	private int categoryId;
	private String categoryName;
	private Timestamp createdAt;
}
