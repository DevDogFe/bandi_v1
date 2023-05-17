package com.bandi.novel.dto.response;

import lombok.Data;

@Data
public class ContestNovelDto {
	
	private Integer id;
	private String title;
	private Integer userId;
	private String username;
	private String genreName;
	private String contestName;
}
