package com.bandi.novel.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PayNovel {
	
	private int id;
	private String genreId;
	private int userId;
	private String title;
	private String content;
	private Timestamp createdAt;
	private int recommend;
	private int favorite;
	private int view;
	private int listPrice;
	private int currentPrice;
}
