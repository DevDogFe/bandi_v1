package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bandi.novel.dto.response.ContestNovelDto;
import com.bandi.novel.model.ContestNovel;

/**
 * 
 * @author 김경은
 */
@Mapper
public interface ContestNovelRepository {
	
	int insertContestNovel(@Param("novelId")int novelId,@Param("contestId")int contestId);
	int deleteContestNovelById(int id);
	
	List<ContestNovelDto> selectContestNovelList();
	ContestNovel selectContestByNovelId(int novelId);
	List<ContestNovel> selectContestByContestId(int contestId);
}
