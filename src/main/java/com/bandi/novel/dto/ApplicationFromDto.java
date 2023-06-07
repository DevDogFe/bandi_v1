package com.bandi.novel.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class ApplicationFromDto {
	
	private Integer userId;
	@NotBlank
	private String title;
	@NotBlank
	private String content;
	@NotBlank
	@Size(min = 11, max = 13)
	private String tel;

}
