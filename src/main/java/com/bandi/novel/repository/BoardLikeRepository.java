package com.bandi.novel.repository;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.model.Like;

@Mapper
public interface BoardLikeRepository {
	
	// 좋아요 등록
	int insert(Like like);
	// 좋아요 조회
	Like selectByUserIdAndBoardId(Like like);
	// 좋아요 해제
	int delete(Like like);
}
