package com.bandi.novel.dto;

import lombok.Data;

@Data
public class OAuthUserInfoForNaver {
	
	private String resultcode;
	private String message;
	private Response response;
	
	@Data
	public class Response {
		private String id;
	}
	
}
