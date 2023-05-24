package com.bandi.novel.model;

import java.sql.Date;

import lombok.Data;

@Data
public class User {
	
	private Integer id;
	private String username;
	private String password;
	private String userRole;
	private String nickName;
	private String email;
	private Date birthDate;
	private String gender;
	private Boolean external;
	
	public String gender() {
		if(this.gender.equals("male")) {
			return "남성";
		}
		return "여성";
	}
}
