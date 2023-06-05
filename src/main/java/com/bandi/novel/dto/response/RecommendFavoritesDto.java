package com.bandi.novel.dto.response;

import lombok.Data;

@Data
public class RecommendFavoritesDto {
	
	private Integer id;
	private String title;
	private String cover;	
	private String genreName;
	private String nickName;
	
	private String author;

}
