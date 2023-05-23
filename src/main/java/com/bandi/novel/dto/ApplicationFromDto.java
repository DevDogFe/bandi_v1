package com.bandi.novel.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ApplicationFromDto {
	
	private Integer userId;
	private String tel;
	private String title;
	private String content;
	
	private MultipartFile file;
	private String originFilename;
	private String uploadFilename;

}
