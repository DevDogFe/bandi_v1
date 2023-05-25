package com.bandi.novel.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserPurchase {
	
	private Integer userId;
	private Integer sectionId;
	private Integer price;
	private Timestamp created_at;
}
