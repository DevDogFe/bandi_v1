package com.bandi.novel.model;


import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class Contest {

	private int id;
	private int userId;
	private String beginCreatedAt;
	private String endCreatedAt;
	@NotBlank
	private String title;
	@NotBlank
	private String content;
	
}
