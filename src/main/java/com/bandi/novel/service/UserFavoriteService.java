package com.bandi.novel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.model.UserFavorite;
import com.bandi.novel.repository.UserFavoriteRepository;

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
	public void insertUserFavorite(Integer userId, Integer novelId) {
		int result = userFavoriteRepository.insert(UserFavorite.builder().userId(userId).novelId(novelId).build());
		// todo 예외처리
	}
	
	@Transactional
	public void deleteUserFavorite(Integer userId, Integer novelId) {
		int result = userFavoriteRepository.delete(UserFavorite.builder().userId(userId).novelId(novelId).build());
		// todo 예외처리
	}

}
