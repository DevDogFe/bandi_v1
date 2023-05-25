package com.bandi.novel.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserGoldCharge {
	
	private Integer userId;
	private Integer price;
	private Timestamp createdAt;
}
