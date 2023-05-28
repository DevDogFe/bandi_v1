package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.AgeGenderRecommendDto;
import com.bandi.novel.dto.response.MainRecommendDto;
import com.bandi.novel.dto.response.RecommendFavoritesDto;
import com.bandi.novel.repository.RecommendRepository;

/**
 * 추천 알고리즘 처리
 * @author 김지현
 *
 */
@Service
public class RecommendService {
	
	@Autowired
	private RecommendRepository recommendRepository;
	
	/**
	 * 나이 성별으로 추천 리스트
	 * @param ageGenderRecommendDto
	 * @return 소설리스트 
	 */
	@Transactional
	public List<MainRecommendDto> selectNovelsByAgeAndGender(AgeGenderRecommendDto ageGenderRecommendDto){
		
		return recommendRepository.selectByAgeAndGender(ageGenderRecommendDto);
		
	}
	
	/**
	 * 효린
	 * 좋아하는 장르 소설
	 * @param userId
	 * @return 소설리스트
	 */
	@Transactional
	public List<RecommendFavoritesDto> selectNovelByFavoriteGenre(Integer userId){
		
		List<RecommendFavoritesDto> list = recommendRepository.selectByFavoriteGenre(userId);
		
		return list;
	}
	
	/**
	 * 효린
	 * 이 소설을 좋아하는 유저들이 많이 보는 소설
	 * @param novelId
	 * @return 소설리스트
	 */
	@Transactional
	public List<RecommendFavoritesDto> selectFavoriteNovelByUsers(Integer novelId){
		
		List<RecommendFavoritesDto> list = recommendRepository.selectFavoriteNovelByUsers(novelId);
		return list;
	}

}
