package com.bandi.novel.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardDetailDto {
	private Integer id;
	private Integer userId;
	private Integer boardTypeId;
	private Integer views;
	private String username;
	private String title;
	private String content;
	private Integer categoryId;
	private String categoryName;
	private Timestamp createdAt;
}
