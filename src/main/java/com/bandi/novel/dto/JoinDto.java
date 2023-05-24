package com.bandi.novel.dto;

import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class JoinDto {

	@NotBlank
	@Size(min = 3, max = 20)
	private String username;
	@NotBlank
	@Size(min = 3, max = 20)
	private String password;
	@NotBlank
	@Size(min = 3, max = 20)
	private String passwordCheck;
	@NotBlank
	@Size(min = 3, max = 20)
	private String nickName;
	@NotBlank
	@Email
	private String email;
	private Date birthDate;
	private String gender;
	private String external;
	
}
