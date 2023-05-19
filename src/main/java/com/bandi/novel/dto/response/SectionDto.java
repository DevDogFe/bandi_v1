package com.bandi.novel.dto.response;

import java.sql.Timestamp;

import com.bandi.novel.utils.TimestampFormat;

import lombok.Data;

@Data
public class SectionDto {

	private Integer id;
	private Integer novelId;
	private String title;
	private String content;
	private Timestamp createdAt;
	private Integer recommend;
	private Integer favorite;
	private Integer views;
	private Integer prevId;
	private Integer nextId;
	private String prevTitle;
	private String nextTitle;
	private Integer listPrice;
	private Integer currentPrice;
	
	public String createdAt() {
		return TimestampFormat.format(createdAt);
	}
}
