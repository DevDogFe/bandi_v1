package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.AgeGenderRecommendDto;
import com.bandi.novel.dto.response.MainRecommendDto;
import com.bandi.novel.dto.response.PreferGenreForTotalRecommendDto;
import com.bandi.novel.dto.response.RankPageDto;
import com.bandi.novel.dto.response.RecommendFavoritesDto;
import com.bandi.novel.repository.RecommendRepository;
import com.bandi.novel.utils.TotalRecommendUtil;

/**
 * 추천 알고리즘 처리
 * 
 * @author 김지현
 *
 */
@Service
public class RecommendService {

	@Autowired
	private RecommendRepository recommendRepository;

	/**
	 * 나이 성별으로 추천 리스트
	 * 
	 * @param ageGenderRecommendDto
	 * @return 소설리스트
	 */
	@Transactional
	public List<MainRecommendDto> selectNovelsByAgeAndGender(AgeGenderRecommendDto ageGenderRecommendDto) {

		return recommendRepository.selectByAgeAndGender(ageGenderRecommendDto);

	}

	/**
	 * 나이, 성별, 즐겨찾기, 평점으로 추천리스트
	 * 
	 * @param ageGenderRecommendDto
	 * @return
	 */
	@Transactional
	public List<MainRecommendDto> selectTotalRecommendedNovels(AgeGenderRecommendDto ageGenderRecommendDto) {
		List<PreferGenreForTotalRecommendDto> genreList = recommendRepository
				.selectPreferGenre(ageGenderRecommendDto.getUserId());
		List<MainRecommendDto> tempList = recommendRepository
				.selectByAgeAndGenderForTotalRecommend(ageGenderRecommendDto);
		List<MainRecommendDto> resultList = TotalRecommendUtil.getTotalRecommendList(genreList, tempList);

		return resultList;
	}
	
	/**
	 * 전체서비스 즐겨찾기 기준 랭크
	 * @param limit
	 * @return
	 */
	@Transactional
	public List<RankPageDto> selectTotalRankToFavorite(Integer limit){
		return recommendRepository.selectTotalRankToFavorite(limit);
	}

	/**
	 * 특정서비스 즐겨찾기 기준 랭크
	 * @param serviceTypeId
	 * @param limit
	 * @return
	 */
	@Transactional
	public List<RankPageDto> selectRankToFavorite(Integer serviceTypeId, Integer limit){
		return recommendRepository.selectRankToFavoriteByServiceTypeId(serviceTypeId, limit);
	}
	
	/**
	 * 특정서비스 별점 기준 랭크
	 * @param serviceTypeId
	 * @param limit
	 * @return
	 */
	@Transactional
	public List<RankPageDto> selectRankToScore(Integer serviceTypeId, Integer limit){
		return recommendRepository.selectRankToScoreByServiceTypeId(serviceTypeId, limit);
	}
	
	
	/**
	 * 효린
	 * 좋아하는 장르 소설
	 * @param userId
	 * @return 소설리스트
	 */
	@Transactional
	public List<RecommendFavoritesDto> selectNovelByFavoriteGenre(Integer userId){
		// 유저가 좋아하는 장르 인기소설
		List<RecommendFavoritesDto> list = recommendRepository.selectByFavoriteGenre(userId);
		
		if(list == null || list.size() < 6) {
			// 유저 즐겨찾기 없을시 인기장르의 인기소설
			list = recommendRepository.selectBestNovelOfBestGenre();
		}
		
		return list;
	}
	
	/**
	 * 효린
	 * 이 소설을 좋아하는 유저들이 많이 보는 소설
	 * @param novelId
	 * @return 소설리스트
	 */
	@Transactional
	public List<RecommendFavoritesDto> selectOtherRecommendedNovelByNovelId(Integer novelId){
		
		List<RecommendFavoritesDto> list = recommendRepository.selectRecommendedNovelByNovelId(novelId);
		return list;
	}

}
