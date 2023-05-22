package com.bandi.novel.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserNovelRecord {
	
	private Integer userId;
	private Integer novelId;
	private Integer sectionId;
}
