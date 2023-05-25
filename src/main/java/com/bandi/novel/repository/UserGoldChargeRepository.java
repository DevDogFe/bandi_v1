package com.bandi.novel.repository;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.model.UserGoldCharge;

@Mapper
public interface UserGoldChargeRepository {

	int insertGoldChargeRecord(UserGoldCharge userGoldCharge);
	
}
