package com.bandi.novel.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NovelReply {
	private int id;
	private int sectionId;
	private int userId;
	private String content;
	private Timestamp createdAt;
}
