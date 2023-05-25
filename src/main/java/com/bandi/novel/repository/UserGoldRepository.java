package com.bandi.novel.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bandi.novel.model.UserGold;

@Mapper
public interface UserGoldRepository {
	
	UserGold selectUserGoldByUserId(Integer userId); 
	int updateUserGold(UserGold userGold);
}
