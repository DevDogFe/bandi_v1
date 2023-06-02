package com.bandi.novel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.response.ResponseDto;
import com.bandi.novel.handler.exception.CustomRestfulException;
import com.bandi.novel.model.UserFavorite;
import com.bandi.novel.repository.UserFavoriteRepository;
import com.bandi.novel.utils.Define;

@Service
public class UserFavoriteService {
	
	@Autowired
	private UserFavoriteRepository userFavoriteRepository;
	
	/**
	 * 즐겨찾기 되어있는지 확인
	 * @param userId
	 * @param novelId
	 * @return 즐겨찾기 되어있으면 true, 아니면 false
	 */
	@Transactional
	public boolean selectUserFavoriteByUserIdAndNovelId(Integer userId, Integer novelId) {
		if(userFavoriteRepository.selectByUserIdAndNovelId(UserFavorite.builder().userId(userId).novelId(novelId).build()) != null) {
			return true;
		}
		return false;
		
	}
	
	/**
	 * 즐겨찾기 추가
	 * @param userId
	 * @param novelId
	 */
	@Transactional
	public ResponseDto<Integer> insertUserFavorite(Integer userId, Integer novelId) {
		int result = userFavoriteRepository.insert(UserFavorite.builder().userId(userId).novelId(novelId).build());
		if(result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseDto<Integer>(HttpStatus.OK, Define.REQUEST_SUCCESS, true, result);
	}
	
	/**
	 * 즐겨찾기 삭제
	 * @param userId
	 * @param novelId
	 */
	@Transactional
	public ResponseDto<Integer> deleteUserFavorite(Integer userId, Integer novelId) {
		int result = userFavoriteRepository.delete(UserFavorite.builder().userId(userId).novelId(novelId).build());
		if(result != 1) {
			throw new CustomRestfulException("요청을 처리하지 못했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseDto<Integer>(HttpStatus.OK, Define.REQUEST_SUCCESS, true, result);
	}
	
	/**
	 * 소설 작품별 즐겨찾기 총합
	 * @param novelId
	 * @return
	 */
	@Transactional
	public Integer selectFavoriteSumByNovelId(Integer novelId) {
		Integer favoriteSum = userFavoriteRepository.selectUserFavoriteSumByNovelId(novelId);
		if(favoriteSum == null) {
			favoriteSum = 0;
		}
		return favoriteSum;
	}

}
