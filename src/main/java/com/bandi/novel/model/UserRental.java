package com.bandi.novel.model;

import lombok.Data;

@Data
public class UserRental {

	private Integer userId;
	private Integer sectionId;
	private Integer price;
	private String beginRental;
	private String endRental;
}
