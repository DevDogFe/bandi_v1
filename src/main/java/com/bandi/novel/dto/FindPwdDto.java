package com.bandi.novel.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class FindPwdDto {
	
	@NotBlank
	@Size(min = 3, max = 20)
	private String username;
	@Email
	private String email;
}
