package com.bandi.novel.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Score {

	private Integer userId;
	private Integer sectionId;
	private Integer score;
}
