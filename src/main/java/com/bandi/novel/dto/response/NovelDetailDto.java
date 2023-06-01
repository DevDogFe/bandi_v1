package com.bandi.novel.dto.response;

import java.sql.Timestamp;

import com.bandi.novel.utils.TimestampFormat;

import lombok.Data;

@Data
public class NovelDetailDto {
	
	private Integer id;
	private Integer userId;
	private Integer serviceTypeId;
	private String serviceTypeName;
	private String title;
	private String overview;
	private String serialCycle;
	private String cover;
	private Timestamp createdAt;
	private String username;
	private String genreName;
	private String nickName;
	private Integer firstSectionId;
	
	public String createdAt() {
		return TimestampFormat.format(createdAt);
	}
}
