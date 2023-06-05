package com.bandi.novel.model;

import java.sql.Timestamp;

import com.bandi.novel.utils.TimestampFormat;

import lombok.Data;

@Data
public class NovelSection {
	
	private Integer id;
	private Integer novelId;
	private String title;
	private String content;
	private Timestamp createdAt;
	private Integer recommend;
	private Integer favorite;
	private Integer views;
	private Integer listPrice;
	private Integer rentPrice;
	
	public String createdAt() {
		
		return TimestampFormat.format(createdAt);
	}
}
