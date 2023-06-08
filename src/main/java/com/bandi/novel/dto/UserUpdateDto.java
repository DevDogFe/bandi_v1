package com.bandi.novel.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

/**
 * 정보 수정용 dto
 * @author 김지현
 *
 */
@Data
public class UserUpdateDto {

	private Integer id;
	@NotBlank
	@Size(min = 3, max = 20)
	private String beforePassword;
	@NotBlank
	@Size(min = 3, max = 20)
	private String password;
	@NotBlank
	@Size(min = 3, max = 20)
	private String passwordCheck;
	@NotBlank
	@Size(min = 3, max = 10)
	private String nickName;
	
}
