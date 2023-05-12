package com.bandi.novel.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardReply {
	
	private int id;
	private int userId;
	private int boardId;
	private String content;
	private Timestamp createdAt;

}
