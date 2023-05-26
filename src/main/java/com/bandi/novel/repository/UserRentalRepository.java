package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.response.RentalRecordDto;
import com.bandi.novel.model.UserRental;

@Mapper
public interface UserRentalRepository {
	
	int insertRentalRecord(UserRental userRental);
	List<RentalRecordDto> selectByUserId(Integer userId);
	
}
