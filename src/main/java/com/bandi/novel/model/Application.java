package com.bandi.novel.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Application {
	
	private int id;
	private int userId;
	private String title;
	private String content;
	private String filename;
	private Timestamp createdAt;

}
