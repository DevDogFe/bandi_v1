package com.bandi.novel.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Account {
	
	private Integer id;
	private Integer sales;
	private Integer refund;
	private String memo;

}
