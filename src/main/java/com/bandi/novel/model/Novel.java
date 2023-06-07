package com.bandi.novel.model;

import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class Novel {
	
	private int id;
	private int userId;
	private int genreId;
	private int serviceTypeId;
	@NotBlank
	@Size(max = 100)
	private String title;
	@NotBlank
	private String overview;
	private String serialCycle;
	@Size(max = 255)
	private String cover;
	private Timestamp createdAt;
}
