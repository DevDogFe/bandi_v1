package com.bandi.novel.model;

import java.sql.Timestamp;

import com.bandi.novel.utils.TimestampFormat;

import lombok.Data;

@Data
public class UserGoldCharge {
	
	private Integer userId;
	private Integer price;
	private Timestamp createdAt;
	
	public String createdAt() {
		return TimestampFormat.dateFormat(createdAt);
	}
}
