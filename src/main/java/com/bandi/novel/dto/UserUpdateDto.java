package com.bandi.novel.dto;

import lombok.Data;

/**
 * 정보 수정용 dto
 * @author 김지현
 *
 */
@Data
public class UserUpdateDto {

	private Integer id;
	private String beforePassword;
	private String password;
	private String passwordCheck;
	private String nickName;
	private String email;
	
}
