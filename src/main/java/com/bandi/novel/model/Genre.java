package com.bandi.novel.model;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class Genre {
	
	private int id;
	@NotBlank
	private String name;
}
