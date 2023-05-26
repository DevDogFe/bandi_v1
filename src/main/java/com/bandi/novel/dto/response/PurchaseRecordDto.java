package com.bandi.novel.dto.response;

import java.sql.Timestamp;

import com.bandi.novel.utils.TimestampFormat;

import lombok.Data;

@Data
public class PurchaseRecordDto {
	
	private String novelTitle; // 소설 제목
	private String sectionTitle; // 소설 회차 제목
	private Integer price; // 구매시 가격
	private Timestamp createdAt;
	
	public String createdAt() {
		return TimestampFormat.dateFormat(createdAt);
	}
}
