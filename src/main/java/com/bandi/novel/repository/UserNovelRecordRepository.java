package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bandi.novel.dto.response.LastNovelRecordDto;
import com.bandi.novel.dto.response.NovleRecordSectionDto;
import com.bandi.novel.dto.response.BestSectionDto;
import com.bandi.novel.model.UserNovelRecord;


@Mapper
public interface UserNovelRecordRepository {

	int insertNovelRecord(UserNovelRecord userNovelRecord);
	int updateNovelRecord(UserNovelRecord userNovelRecord);
	
	// userId로 기록이 있는지 없는지 확인
	UserNovelRecord selectNovelRecordByModel(UserNovelRecord userNovelRecord);
	// novelId와 userId로 본 소설 조회
	List<NovleRecordSectionDto> selectNovelRecord(@Param("userId")Integer userId
			,@Param("novelId")Integer novelId);
	
	// userId로 유저가 마지막에 본 소설 조회
	LastNovelRecordDto selectLastNovelRecord(Integer userId);
	
	/**
	 * 오늘 가장 많이 조회된 소설
	 * @author 김지현
	 */
	BestSectionDto selectTodayBestSection();
	/**
	 * 이달 가장 많이 조회된 소설
	 * @author 김지현
	 */
	BestSectionDto selectMonthBestSection();
}
