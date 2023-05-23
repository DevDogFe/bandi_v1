package com.bandi.novel.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Board {
	
	private Integer id;
	private Integer userId;
	private Integer boardTypeId;
	private String title;
	private String content;
	private String encodedFileName;
	private Integer likes;
	private Integer views;
	private Integer categoryId;
	private Timestamp createdAt;

}
