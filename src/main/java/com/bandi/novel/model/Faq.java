package com.bandi.novel.model;

import lombok.Data;

@Data
public class Faq {
	
	private int id;
	private int fqaCategoryId;
	private String question;
	private String answer;

}
