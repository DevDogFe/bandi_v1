package com.bandi.novel.model;

import lombok.Data;

@Data
public class BoardFile {
	private Integer id;
	private Integer boardId;
	private String rawFileName;
	private String encodedFileName;
}
