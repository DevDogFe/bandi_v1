package com.bandi.novel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.model.Like;
import com.bandi.novel.repository.BoardLikeRepository;


@Service
public class BoardLikeService {
	
	@Autowired
	private BoardLikeRepository boardLikeRepository;
	
	// 좋아요 조회
	@Transactional
	public boolean selectLikeByUserIdAndBoardId(Integer userId, Integer boardId) {
		if(boardLikeRepository.selectByUserIdAndBoardId(Like.builder().userId(userId).boardId(boardId).build()) != null) {
			return true;
		}
		return false;
	}
	
	// 좋아요 등록
	@Transactional
	public void insertLike(Integer userId, Integer boardId) {
		int result = boardLikeRepository.insert(Like.builder().userId(userId).boardId(boardId).build());
	}
	
	// 좋아요 해제
	@Transactional
	public void deleteLike(Integer userId, Integer boardId) {
		int result = boardLikeRepository.delete(Like.builder().userId(userId).boardId(boardId).build());
	}
	
}
