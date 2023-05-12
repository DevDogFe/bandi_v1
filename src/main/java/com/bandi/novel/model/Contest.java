package com.bandi.novel.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Contest {

	private int id;
	private int userId;
	private Timestamp beginCreatedAt;
	private Timestamp endCreatedAt;
	private String title;
	private String content;
}
