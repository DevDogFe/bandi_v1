package com.bandi.novel.repository;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.model.Score;

@Mapper
public interface ScoreRepository {

	int insertScore(Score score);
	
	int updateScore(Score score);
	
	Score selectByUserIdAndSectionId(Score score);
	
}
