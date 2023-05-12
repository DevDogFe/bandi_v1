package com.bandi.novel.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Novel {
	
	private int id;
	private int userId;
	private int genreId;
	private int serviceTypeId;
	private String title;
	private String overview;
	private String serialCycle;
	private String cover;
	private Timestamp createdAt;
}
