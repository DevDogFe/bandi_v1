package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bandi.novel.dto.response.SectionDto;
import com.bandi.novel.model.NovelSection;

@Mapper
public interface NovelSectionRepository {

	List<NovelSection> selectListByNovelId(Integer id);
	
	int insert(NovelSection novelSection);
	
	NovelSection selectById(Integer id);
	
	/**
	 * @auth 김경은
	 * novelId를 활용한 전체 회차의 수 조회 
	 */
	int selectNovelSectionCount(Integer novelId);
	
	/**
	 * @auth 김경은
	 * id를 활용한 회차 삭제
	 */
	int deleteNovelSectionById(Integer id);
	
	/**
	 * @auth 김경은
	 * novelId, sectionId를 활용한 조회
	 * 
	 */
	SectionDto selectNovelByPage(@Param("novelId")Integer novelId,
			@Param("sectionId")Integer sectionId);
}
