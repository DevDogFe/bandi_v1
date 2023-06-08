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

	Integer insertContestNovel(@Param("novelId") Integer novelId, @Param("contestId") Integer contestId);

	Integer deleteContestNovelByNovelId(Integer novelId);

	ContestNovel selectContestNovelByNovelId(Integer novelId);

	List<ContestNovelDto> selectContestNovelList(@Param("contestId") Integer countestId, @Param("sort") String sort);

	List<ContestNovel> selectContestNovelListByContestId(Integer contestId);
	
	// 검색 조회
	List<ContestNovelDto> selectContestNovelsByGenreIdAndName(@Param("genreId") Integer genreId,
			@Param("search") String search, @Param("contestId") Integer countestId, @Param("sort") String sort);
}
