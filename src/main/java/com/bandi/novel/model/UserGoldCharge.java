package com.bandi.novel.model;

import java.sql.Timestamp;

import com.bandi.novel.utils.TimestampFormat;

import lombok.Data;

@Data
public class UserGoldCharge {
	
	private Integer id;
	private Integer userId;
	private Integer price;
	private String tid;	// 거래 id
	private Timestamp createdAt;
	
	public String createdAt() {
		return TimestampFormat.dateFormat(createdAt);
	}
}
