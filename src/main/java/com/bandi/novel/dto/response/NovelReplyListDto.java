package com.bandi.novel.dto.response;

import java.sql.Timestamp;

import com.bandi.novel.utils.TimestampFormat;

import lombok.Data;

@Data
public class NovelReplyListDto {
	
	private Integer id;
	private Integer sectionId;
	private Integer userId;
	private String content;
	private Timestamp createdAt;
	private String username;
	private String nickName;
	
	public String createdAt() {
		return TimestampFormat.format(createdAt);
	}
	

}
