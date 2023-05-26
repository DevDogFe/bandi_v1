package com.bandi.novel.dto.response;

import java.sql.Date;

import lombok.Data;

@Data
public class RankPageDto {
	
	private Integer id;
	private Integer userId;
	private Integer genreId;
	private Integer serviceTypeId;
	private String title;
	private String serialCycle;
	private String cover;
	private String serviceTypeName;
	private String genreName;
	private Integer favoriteCount;
	private Double score;
	private Date createdAt;

}
