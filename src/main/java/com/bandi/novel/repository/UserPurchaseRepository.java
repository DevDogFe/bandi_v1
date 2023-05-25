package com.bandi.novel.repository;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.model.UserPurchase;

@Mapper
public interface UserPurchaseRepository {
	
	int insertPuchaseRecord(UserPurchase userPurchase);
	
}
