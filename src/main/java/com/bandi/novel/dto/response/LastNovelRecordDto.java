package com.bandi.novel.dto.response;

import lombok.Data;

// 모달 창에 마지막으로 본 소설 띄우는 dto
@Data
public class LastNovelRecordDto {
	
	private Integer userId;
	private Integer sectionId;
	private Integer novelId;
	private String title;
	private String content;
}
