package com.bandi.novel.dto.response;

import lombok.Data;

@Data
public class NovelDto {

	private Integer id;
	private String title;
	private Integer userId;
	private String nickName;
	private String genreName;
	private Integer genreId;
	private Integer favoriteCount;
	private String cover;
	private Double score;
	
	public Double score() {
		
		return Math.round(score*10)/10.0;
	}
}
