package com.bandi.novel.model;

import java.sql.Timestamp;

import com.bandi.novel.utils.TimestampFormat;

import lombok.Data;

@Data
public class Application {
	
	private Integer id;
	private Integer userId;
	private String username;
	private String tel;
	private String title;
	private String content;
	
	private Timestamp createdAt;
	
	public String createdAt() {
		
		return TimestampFormat.dateFormat(createdAt);
	}

}
