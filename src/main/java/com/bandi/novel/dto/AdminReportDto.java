package com.bandi.novel.dto;

import java.sql.Timestamp;

import com.bandi.novel.utils.TimestampFormat;

import lombok.Data;

@Data
public class AdminReportDto {
	private Integer id;
	private Integer userId;
	private String username;
	private String content;
	private Integer categoryId;
	private String categoryName;
	private Integer proceed;
	private Timestamp createdAt;
	
	public String createdAt() {
		return TimestampFormat.format(createdAt);
	}
}
