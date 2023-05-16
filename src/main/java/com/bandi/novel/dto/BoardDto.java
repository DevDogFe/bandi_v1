package com.bandi.novel.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardDto {
	private int userId;
	private int boardTypeId;
	private String title;
	private String content;
	private int categoryId;
	private Timestamp createdAt;
}
