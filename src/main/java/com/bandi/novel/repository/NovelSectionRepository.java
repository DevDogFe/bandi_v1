package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bandi.novel.dto.response.SectionDto;
import com.bandi.novel.dto.response.SectionListDto;
import com.bandi.novel.dto.response.UserPurchaseRentalRecord;
import com.bandi.novel.model.NovelSection;

@Mapper
public interface NovelSectionRepository {
	
	// 첫화 찾기
	Integer selectFirstSectionByNovelId(Integer novelId);

	List<SectionListDto> selectListByNovelId(Integer id);

	int insert(NovelSection novelSection);

	NovelSection selectById(Integer id);

	/**
	 * @auth 김경은 novelId를 활용한 전체 회차의 수 조회
	 */
	int selectNovelSectionCount(Integer novelId);

	/**
	 * @auth 김경은 id를 활용한 회차 삭제
	 */
	int deleteNovelSectionById(Integer id);

	/**
	 * @auth 김경은 novelId, sectionId를 활용한 조회
	 * 
	 */
	SectionDto selectNovelByPage(@Param("novelId") Integer novelId, @Param("sectionId") Integer sectionId);

	// 조회수 1 증가
	int updateViewsById(Integer sectionId);
	
	// 소설에 따른 유저 구매 대여 기록 조회 리스트
	List<UserPurchaseRentalRecord> selectPurchaseRentalRecord(@Param("userId") Integer userId,@Param("novelId") Integer novelId);
	// 소설 회차에 따른 유저 구매 대여 기록 조회
	UserPurchaseRentalRecord selectPurchaseRentalRecordByIds(@Param("userId") Integer userId,@Param("novelId") Integer novelId,
															@Param("sectionId") Integer sectionId);

}
