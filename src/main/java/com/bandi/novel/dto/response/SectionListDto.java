package com.bandi.novel.dto.response;

import java.sql.Timestamp;

import com.bandi.novel.utils.TimestampFormat;

import lombok.Data;

@Data
public class SectionListDto {

	private Integer id;
	private Integer novelId;
	private String title;
	private String content;
	private Timestamp createdAt;
	private Integer favorite;
	private Integer views;
	private Integer listPrice;
	private Integer rentPrice;
	private Integer score;
	
	public String createdAt() {
		
		return TimestampFormat.format(createdAt);
	}
}
