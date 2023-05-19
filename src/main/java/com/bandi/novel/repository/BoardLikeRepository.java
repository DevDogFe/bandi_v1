package com.bandi.novel.repository;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.model.Like;

@Mapper
public interface BoardLikeRepository {
	
	int insert(Like like);
	Like selectByUserIdAndBoardId(Like like);
	int delete(Like like);
}
