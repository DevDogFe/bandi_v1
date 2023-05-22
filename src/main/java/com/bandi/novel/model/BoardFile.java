package com.bandi.novel.model;

import lombok.Data;

@Data
public class BoardFile {
	
	private int boardId;
	private String rawFileName;
	private String encodedFileName;
	private String fileType;

}
