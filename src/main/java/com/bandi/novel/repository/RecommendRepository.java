package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bandi.novel.dto.AgeGenderRecommendDto;
import com.bandi.novel.dto.response.MainRecommendDto;
import com.bandi.novel.dto.response.PreferGenreForTotalRecommendDto;
import com.bandi.novel.dto.response.RankPageDto;
import com.bandi.novel.dto.response.RecommendFavoritesDto;

/**
 * 추천 리스트 뽑기위한 dao
 * @author 김지현
 *
 */
@Mapper
public interface RecommendRepository {

	List<MainRecommendDto> selectByAgeAndGender(AgeGenderRecommendDto ageGenderRecommendDto);
	
	// 특정서비스(유료, 무료, 장르)로 즐겨찾기 랭크
	List<RankPageDto> selectRankToFavoriteByServiceTypeId(@Param("serviceTypeId") Integer serviceTypeId, @Param("limit") Integer limit);
	// 특정서비스(유료, 무료, 장르)로 별점 랭크
	List<RankPageDto> selectRankToScoreByServiceTypeId(@Param("serviceTypeId") Integer serviceTypeId, @Param("limit") Integer limit);
	// 전체서비스 즐겨찾기 랭크
	List<RankPageDto> selectTotalRankToFavorite(Integer limit);
	
	// 인기장르의 인기소설 조회
	List<RecommendFavoritesDto> selectBestNovelOfBestGenre();
	// 인기장르의 소설 조회
	List<RecommendFavoritesDto> selectNovelOfBestGenre();
	
		
	/**
	 * 맞춤 추천 알고리즘 위한 dao
	 * selectPreferGenre()
	 * selectByAgeAndGenderForTotalRecommend()
	 */
	List<PreferGenreForTotalRecommendDto> selectPreferGenre(Integer userId);
	List<MainRecommendDto> selectByAgeAndGenderForTotalRecommend(AgeGenderRecommendDto ageGenderRecommendDto);	
	
	/**
	 * 효린
	 * 많이 본 장르 소설 추천 
	 */
	List<RecommendFavoritesDto> selectByFavoriteGenre(Integer userId);
	// 이 소설을 본 사람들이 좋아하는 소설추천
	List<RecommendFavoritesDto> selectRecommendedNovelByNovelId(Integer novelId);
}
