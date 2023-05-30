package com.bandi.novel.dto.response;

import java.sql.Timestamp;

import com.bandi.novel.utils.TimestampFormat;

import lombok.Data;

@Data
public class NovelSearchDto {
	
	private int id;
	private String userName;
	private String serviceTypeName;
	private String genreName;
	private String title;
	private String serialCycle;
	private String cover;
	private Timestamp createdAt;
	
	public String createdAt() {
		return TimestampFormat.format(createdAt);
	}
}
