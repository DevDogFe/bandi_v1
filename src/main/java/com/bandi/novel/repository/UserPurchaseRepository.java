package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.response.PurchaseRecordDto;
import com.bandi.novel.model.UserPurchase;

@Mapper
public interface UserPurchaseRepository {
	
	int insertPuchaseRecord(UserPurchase userPurchase);
	List<PurchaseRecordDto> selectByUserId(Integer userId);
}
