package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bandi.novel.dto.adminNovelUpdateFormDto;
import com.bandi.novel.dto.response.GenreCountDto;
import com.bandi.novel.dto.response.MyFavoriteDto;
import com.bandi.novel.dto.response.NovelDetailDto;
import com.bandi.novel.dto.response.NovelDto;
import com.bandi.novel.dto.response.NovelSearchDto;
import com.bandi.novel.model.Novel;

/**
 * novel_tb DAO
 * 
 * @author 김지현
 *
 */
@Mapper
public interface NovelRepository {
	
	Integer selectServiceTypeById(Integer id);
	
	List<GenreCountDto> selectGenreCount();

	int insertNovel(Novel novel);

	// insert 전에 같은 작가의 같은 제목 있나 확인
	Novel selectNovelByUserIdAndTitle(Novel novel);

	/**
	 * @auth 김경은 모델을 활용한 Novel 조회 NovelService 소설 등록 과정에 활용
	 */
	Integer selectNovelIdByModel(Novel novel);

	/**
	 * @auth 김경은 공모전 id를 활용한 삭제 처리 contestService delete에 사용
	 */
	int deleteNovelByContestId(Integer contestId);

	int deleteNovelById(Integer id);

	// 유료소설 전체
	List<NovelDto> selectPayNovels(String sort);

	// 무료소설 전체
	List<NovelDto> selectFreeNovels(String sort);
	
	// 공모전소설 전체
	List<NovelDto> selectContestNovels(String sort);

	// 유료소설 검색
	List<NovelDto> selectPayNovelsByGenreIdAndName(@Param("genreId") Integer genreId,@Param("search") String search, @Param("sort") String sort);
	
	// 무료소설 검색
	List<NovelDto> selectFreeNovelsByGenreIdAndName(@Param("genreId")Integer genreId,@Param("search") String search, @Param("sort") String sort);
	
	NovelDetailDto selectNovelDetailByNovelId(Integer id);
	
	// 커버 수정
	int updateCover(@Param("novelId") Integer Id, @Param("cover") String cover);
	
	// 유저 즐겨찾기 소설 목록
	List<MyFavoriteDto> selectUserFavoriteListByUserId(@Param("userId") Integer userId, @Param("limit") Integer limit);
	
	// 유저 내작품 목록
	List<MyFavoriteDto> selectMyNovelsByUserId(@Param("userId") Integer userId, @Param("limit") Integer limit);
	
	/**
	 * @auth 김경은 전체 소설 검색(관리자 페이지)
	 */
	List<NovelSearchDto> selectNovelListBySearch(String search);
	
	/**
	 * @auth 김경은 서비스 타입 수정(관리자 페이지)
	 */
	int updateNovelServiceType(adminNovelUpdateFormDto dto);

}
