package com.bandi.novel.dto;

import lombok.Data;

@Data
public class OAuthUserInfo {

	private Long id;
	private Properties properties;

	@Data
	public class Properties {
		private String nickname;
	}
}
