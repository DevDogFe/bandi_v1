package com.bandi.novel.dto.response;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NovelDetailDto {
	
	private int id;
	private int userId;
	private int serviceTypeId;
	private String title;
	private String overview;
	private String serialCycle;
	private String cover;
	private Timestamp createdAt;
	private String username;
	private String genreName;
}
