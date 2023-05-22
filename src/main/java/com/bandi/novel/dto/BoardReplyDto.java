package com.bandi.novel.dto;

import java.sql.Timestamp;

import com.bandi.novel.utils.TimestampFormat;

import lombok.Data;

@Data
public class BoardReplyDto {
	
	private Integer id;
	private Integer boardId;
	private Integer userId;
	private String content;
	private String username;
	private Timestamp createdAt;
	
	public String createdAt() {
		return TimestampFormat.format(createdAt);
	}
}
