package com.bandi.novel.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class EventNotice {
	
	private int id;
	private String title;
	private String content;
	private int views;
	private Timestamp createdAt;

}
