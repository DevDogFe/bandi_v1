package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.model.ContestNovel;

/**
 * 
 * @author 김경은
 */
@Mapper
public interface ContestNovelRepository {
	
	int insertContestNovel(ContestNovel contest);
	int deleteContestNovelById(int id);
}
