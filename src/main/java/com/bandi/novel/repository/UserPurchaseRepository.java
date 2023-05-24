package com.bandi.novel.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserPurchaseRepository {
	
	int insertPuchaseRecord();
	
}
