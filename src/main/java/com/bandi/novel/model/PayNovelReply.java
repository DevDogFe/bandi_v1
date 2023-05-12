package com.bandi.novel.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PayNovelReply {

	private int id;
	private int boardId;
	private int userId;
	private Timestamp createdAt;
	private String content;
}
