package com.bandi.novel.dto;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.bandi.novel.utils.TimestampFormat;

import lombok.Data;

@Data
public class BoardDto {
	private Integer id;
	private Integer userId;
	private Integer views;
	private String username;
	private Integer boardTypeId;
	private String boardName;
	private String title;
	private String content;
	private Integer categoryId;
	private String categoryName;
	private Timestamp createdAt;
	private MultipartFile[] files;
	private List<String> fileName;
	private List<String> rawFilName;
	
	public String createdAt() {
		return TimestampFormat.format(createdAt);
	}
}
