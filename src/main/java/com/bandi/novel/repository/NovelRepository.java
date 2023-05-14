package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.response.NovelDto;
import com.bandi.novel.model.Novel;

/**
 * novel_tb DAO
 * @author 김지현
 *
 */
@Mapper
public interface NovelRepository {
	
	int insertNovel(Novel novel);
	
	// insert 전에 같은 작가의 같은 제목 있나 확인
	Novel selectNovelByUserIdAndTitle(Novel novel);
	
	List<NovelDto> selectPayNovels();

}
