package com.bandi.novel.dto.response;

import java.sql.Timestamp;

import com.bandi.novel.utils.TimestampFormat;

import lombok.Data;

@Data
public class ContestDto {
	
	private int id;
	private int userId;
	private String nickName;
	private String title;
	private String content;
	private Timestamp beginCreatedAt;
	private Timestamp endCreatedAt;
	
	public String beginCreatedAt() {
		
		return TimestampFormat.simpleFormat(beginCreatedAt);
	}
	
	public String endCreatedAt() {
		
		return TimestampFormat.simpleFormat(endCreatedAt);
	}
}
