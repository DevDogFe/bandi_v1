package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.AgeGenderRecommendDto;
import com.bandi.novel.dto.response.MainRecommendDto;
import com.bandi.novel.dto.response.PreferGenreForTotalRecommendDto;

@Mapper
public interface RecommendRepository {

	List<MainRecommendDto> selectByAgeAndGender(AgeGenderRecommendDto ageGenderRecommendDto);
	
	
	
	/**
	 * 맞춤 추천 알고리즘 위한 dao
	 * selectPreferGenre()
	 * selectByAgeAndGenderForTotalRecommend()
	 */
	List<PreferGenreForTotalRecommendDto> selectPreferGenre(Integer userId);
	List<MainRecommendDto> selectByAgeAndGenderForTotalRecommend(AgeGenderRecommendDto ageGenderRecommendDto);
	
	// 많이 본 장르 소설 추천 
	List<MainRecommendDto> selectByFavoriteGenre(Integer userId);
	

	
	
	
	
	
}
