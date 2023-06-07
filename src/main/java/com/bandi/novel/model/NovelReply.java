package com.bandi.novel.model;

import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class NovelReply {
	private int id;
	private int sectionId;
	private int userId;
	private int novelId;
	@NotBlank
	@Size(max = 255)
	private String content;
	private Timestamp createdAt;
}
