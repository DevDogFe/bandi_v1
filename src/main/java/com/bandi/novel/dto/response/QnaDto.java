package com.bandi.novel.dto.response;

import java.sql.Timestamp;

import com.bandi.novel.utils.TimestampFormat;

import lombok.Data;

@Data
public class QnaDto {
	
	private Integer id;
	private String CategoryName;
	private String title;
	private String nickName;
	private Timestamp createdAt;
	
	private String answer;
	private Timestamp answerCreatedAt;
	
	public String createdAt() {
		
		return TimestampFormat.dateFormat(createdAt);
	}
	
	public String answerCreatedAt() {
		
		return TimestampFormat.dateFormat(answerCreatedAt);
	}
	
	public String nickName() {

		String name = nickName.substring(0, 1) + "***";

		return name;
	}

}
