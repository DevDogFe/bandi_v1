package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.response.NovelDetailDto;
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
	
	/**
	 * @auth 김경은
	 * 모델을 활용한 Novel 조회
	 * NovelService 소설 등록 과정에 활용
	 */
	Integer selectNovelIdByModel(Novel novel);
	/**
	 * @auth 김경은
	 * 공모전 id를 활용한 삭제 처리
	 * contestService delete에 사용
	 */
	int deleteNovelByContestId(int contestId);
	int deleteNovelById(int id);
	
	List<NovelDto> selectPayNovels();
	
	NovelDetailDto selectNovelDetailByNovelId(Integer id);

}
