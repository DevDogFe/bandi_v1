package com.bandi.novel.dto.response;

import lombok.Data;

@Data
public class MainRecommendDto {
	
	private Integer id;
	private Integer genreId;
	private String title;
	private String cover;
	private Integer favoriteCount;
	private Double score;
	//
	private String genreName;
}
