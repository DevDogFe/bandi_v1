package com.bandi.novel.dto.response;

import lombok.Data;

/**
 * 오늘 가장 많이 조회된 소설
 * @author 김지현
 *
 */
@Data
public class BestSectionDto {
	
	private Integer novelId;
	private Integer sectionId;
	private String novelTitle;
	private String sectionTitle;
	private Integer count;

}
