package com.bandi.novel.model;

import lombok.Data;

@Data
public class BoardFile {
	
	private int boardId;
	private String rawFilename;
	private String encodedFilename;
	private String fileType;

}
