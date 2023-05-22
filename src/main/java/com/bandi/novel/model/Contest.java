package com.bandi.novel.model;

import lombok.Data;

@Data
public class Contest {

	private int id;
	private int userId;
	private String beginCreatedAt;
	private String endCreatedAt;
	private String title;
	private String content;
}
