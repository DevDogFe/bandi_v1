package com.bandi.novel.dto.response;

import lombok.Data;
/**
 * 장르 점유율 위한 dto
 * @author 김지현
 */
@Data
public class GenreCountDto {
	
	private String name;
	private Integer count;
}
