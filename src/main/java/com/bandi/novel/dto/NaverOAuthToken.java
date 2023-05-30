package com.bandi.novel.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class NaverOAuthToken {
	
	private String tokenType;
	private String refreshToken;
	private String accessToken;
	private Integer expiresIn;
	private String errorDescription;
}
