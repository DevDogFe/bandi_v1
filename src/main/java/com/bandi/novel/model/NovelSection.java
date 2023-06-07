package com.bandi.novel.model;

import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.bandi.novel.utils.TimestampFormat;

import lombok.Data;

@Data
public class NovelSection {
	
	private Integer id;
	private Integer novelId;
	@NotBlank
	@Size(max = 255)
	private String title;
	@NotBlank
	private String content;
	private Timestamp createdAt;
	private Integer recommend;
	private Integer favorite;
	private Integer views;
	private Integer listPrice;
	private Integer rentPrice;
	
	public String createdAt() {
		
		return TimestampFormat.format(createdAt);
	}
}
