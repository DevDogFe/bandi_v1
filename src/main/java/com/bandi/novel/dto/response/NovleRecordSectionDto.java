package com.bandi.novel.dto.response;

import java.sql.Timestamp;

import com.bandi.novel.utils.TimestampFormat;

import lombok.Data;

// 유저가 조회한 소설 데이터 포함한 dto
@Data
public class NovleRecordSectionDto {

	private Integer id;
	private Integer novelId;
	private String title;
	private String content;
	private Timestamp createdAt;
	private Integer recommend;
	private Integer favorite;
	private Integer views;
	private Integer listPrice;
	private Integer rentPrice;
	// 본적이 없는 경우 null로 날라옴
	private Integer userId;
	private Integer recordAt;
	// 회차 평점 평균
	private Double score;

	public String createdAt() {
		return TimestampFormat.format(createdAt);
	}

	public Double score() {
		return Math.round(score * 10) / 10.0;
	}
}
