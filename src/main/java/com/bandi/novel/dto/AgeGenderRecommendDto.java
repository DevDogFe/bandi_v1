package com.bandi.novel.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class AgeGenderRecommendDto {

	private Integer userId;
	private String gender;
	private Date leftPort;
	private Date rightPort;
}
