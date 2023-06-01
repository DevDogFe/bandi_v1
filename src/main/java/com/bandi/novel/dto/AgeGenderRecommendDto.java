package com.bandi.novel.dto;

import java.sql.Date;

import com.bandi.novel.utils.GenerationUtil;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class AgeGenderRecommendDto {

	private Integer userId;
	private String gender;
	private Date leftPort;
	private Date rightPort;
	
	public AgeGenderRecommendDto(Integer userId, String gender, GenerationUtil generationUtil) {
		
		this.userId = userId;
		this.gender = gender;
		leftPort = generationUtil.getLeftPort();
		rightPort = generationUtil.getRightPort();
		
	}
}
