package com.bandi.novel.model;

import lombok.Data;

@Data
public class EventNoticeFile {
	
	private int eventNoticeId;
	private String rawFilename;
	private String encodedFilename;
	private String fileType;

}
