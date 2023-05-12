package com.bandi.novel.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class FreeNovelReply {
	
	private int id;
	private int boardId;
	private int userId;
	private String content;
	private Timestamp createdAt;
}
