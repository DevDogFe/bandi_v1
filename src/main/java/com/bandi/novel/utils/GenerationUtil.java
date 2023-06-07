package com.bandi.novel.utils;

import java.sql.Date;
import java.time.LocalDate;

import lombok.Data;

/**
 * n0대 시작 date와 끝 date 뽑아내는 유틸
 * @author 김지현
 *
 */
@Data
public class GenerationUtil {
	
	private Date leftPort;
	private Date rightPort;
	private int generation;
	
	public GenerationUtil(int generation) {
		this.generation = generation; 
		int currentYear = LocalDate.now().getYear();
		leftPort = new Date(currentYear - generation - 9 - 1900, 0, 1);
		rightPort = new Date(currentYear- generation + 1 - 1900, 0, 1);
		
	}

}
