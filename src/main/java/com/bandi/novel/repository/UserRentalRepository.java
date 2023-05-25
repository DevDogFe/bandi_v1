package com.bandi.novel.repository;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.model.UserRental;

@Mapper
public interface UserRentalRepository {
	
	int insertRentalRecord(UserRental userRental);
	
}
