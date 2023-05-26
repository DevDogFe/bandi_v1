package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.model.UserGoldCharge;

@Mapper
public interface UserGoldChargeRepository {

	int insertGoldChargeRecord(UserGoldCharge userGoldCharge);
	List<UserGoldCharge> selectByUserId(Integer userId);
}
