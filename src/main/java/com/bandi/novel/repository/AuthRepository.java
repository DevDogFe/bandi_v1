package com.bandi.novel.repository;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.model.AuthKey;

@Mapper
public interface AuthRepository {

	public AuthKey FindByEmail(String email);

	public int insert(AuthKey authKey);
	
	public int updateByEmail(AuthKey authKey);

}
