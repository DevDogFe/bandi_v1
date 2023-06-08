package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.adminNovelUpdateFormDto;
import com.bandi.novel.dto.response.GenreCountDto;
import com.bandi.novel.dto.response.MyFavoriteDto;
import com.bandi.novel.dto.response.NovelDetailDto;
import com.bandi.novel.dto.response.NovelDto;
import com.bandi.novel.dto.response.NovelSearchDto;
import com.bandi.novel.dto.response.ResponseDto;
import com.bandi.novel.dto.response.SectionDto;
import com.bandi.novel.handler.exception.CustomRestfulException;
import com.bandi.novel.model.Genre;
import com.bandi.novel.model.Novel;
import com.bandi.novel.model.NovelSection;
import com.bandi.novel.model.ServiceType;
import com.bandi.novel.repository.ContestNovelRepository;
import com.bandi.novel.repository.GenreRepository;
import com.bandi.novel.repository.NovelRepository;
import com.bandi.novel.repository.NovelSectionRepository;
import com.bandi.novel.repository.ServiceTypeRepository;
import com.bandi.novel.utils.Define;

/**
 * 소설 관련 서비스
 * 
 * @author 김지현
 */
@Service
public class NovelService {

	@Autowired
	private GenreRepository genreRepository;
	@Autowired
	private ServiceTypeRepository serviceTypeRepository;
	@Autowired
	private NovelRepository novelRepository;
	@Autowired
	private NovelSectionRepository novelSectionRepository;
	@Autowired
	private ContestNovelRepository contestNovelRepository;


	@Transactional
	public Integer selectServiceTypeByNovelId(Integer novelId) {
		
		return novelRepository.selectServiceTypeById(novelId);
	}
	
	@Transactional
	public List<Genre> selectGenreList() {

		return genreRepository.selectAll();
	}

	@Transactional
	public List<ServiceType> selectServiceTypeList() {

		return serviceTypeRepository.selectAll();
	}

	/**
	 * 소설 등록
	 * 
	 * @param novel
	 */
	@Transactional
	public void insertNovel(Novel novel, Integer contestId) {

		Novel novelEntity = novelRepository.selectNovelByUserIdAndTitle(novel);
		if (novelEntity != null) {
			throw new CustomRestfulException("작가님의 작품 중 같은 제목의 작품이 이미 있습니다.", HttpStatus.BAD_REQUEST);
		}

		int result = novelRepository.insertNovel(novel);

		/**
		 * @auth 김경은 novel모델로 id 조회해서 공모전 게시판에 등록
		 */
		if (contestId != 0) {
			int novelId = novelRepository.selectNovelIdByModel(novel);
			contestNovelRepository.insertContestNovel(novelId, contestId);
		}

		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	/**
	 * 유료소설 리스트
	 * 
	 * @return
	 */
	@Transactional
	public List<NovelDto> selectPayNovelList(Integer genreId, String search, String sort) {
		

		if (genreId != null || search != null) {
			return novelRepository.selectPayNovelsByGenreIdAndName(genreId, search, sort);
		}
		return novelRepository.selectPayNovels(sort);
	}

	/**
	 * 무료소설 리스트
	 * 
	 * @return
	 */
	@Transactional
	public List<NovelDto> selectFreeNovelList(Integer genreId, String search, String sort) {

		if (genreId != null || search != null) {
			return novelRepository.selectFreeNovelsByGenreIdAndName(genreId, search, sort);
		}

		return novelRepository.selectFreeNovels(sort);
	}
	
	/**
	 * 공모전소설 리스트
	 * 
	 * @return
	 */
	@Transactional
	public List<NovelDto> selectContestNovelList(String sort) {

		return novelRepository.selectContestNovels(sort);
	}
	
	/**
	 * 공모전소설 리스트
	 * 
	 * @return
	 */
	@Transactional
	public List<NovelDto> selectContestNovelListByLimit() {

		return novelRepository.selectContestNovelsByLimit();
	}

	/**
	 * 소설 조회
	 * 
	 * @param id
	 * @return
	 */
	@Transactional
	public NovelDetailDto selectNovelDetailById(Integer id) {

		NovelDetailDto dto = novelRepository.selectNovelDetailByNovelId(id);
		dto.setFirstSectionId(novelSectionRepository.selectFirstSectionByNovelId(id));
		
		return dto;
	}

	// 전체 소설 검색(관리자 페이지에서 사용함)
	@Transactional
	public ResponseDto<List<NovelSearchDto>> selectNovelListBySearch(String search) {
		
		List<NovelSearchDto> list = novelRepository.selectNovelListBySearch(search);

		return new ResponseDto<List<NovelSearchDto>>(HttpStatus.OK, Define.REQUEST_SUCCESS, true, list);
	}

	// 소설 서비스 타입 변경(관리자 페이지에서 사용함)
	@Transactional
	public ResponseDto<Integer> updateNovelListBySearch(adminNovelUpdateFormDto dto) {

		int result = novelRepository.updateNovelServiceType(dto);

		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return new ResponseDto<Integer>(HttpStatus.OK, Define.REQUEST_SUCCESS, true, result);
	}

	// 소설 삭제(관리자 페이지에서 사용함)
	@Transactional
	public ResponseDto<Integer> deleteNovel(Integer id) {
		
		int result = novelRepository.deleteNovelById(id);

		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return new ResponseDto<Integer>(HttpStatus.OK, Define.REQUEST_SUCCESS, true, result);
	}

	/**
	 * 회차 등록
	 * 
	 * @param novelSection
	 */
	@Transactional
	public void insertNovelSelection(NovelSection novelSection) {
		int result = novelSectionRepository.insert(novelSection);

		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	/**
	 * 회차 조회
	 * 
	 * @param id
	 * @return
	 */
	@Transactional
	public NovelSection selectNovelSectionById(Integer id) {
		return novelSectionRepository.selectById(id);
	}

	/**
	 * 소설 회차 조회수 증가
	 */
	@Transactional
	public void sectionViewsPlus(Integer sectionId) {
		novelSectionRepository.updateViewsById(sectionId);
	}

	/**
	 * 회차 조회(다음 이전 구현)
	 * 
	 * @author 김경은
	 * @return
	 */
	@Transactional
	public SectionDto selectNovelReadSection(int novelId, int sectionId) {

		SectionDto novelSection = novelSectionRepository.selectNovelByPage(novelId, sectionId);
		return novelSection;
	}

	/**
	 * section의 전체 회차 수(count) 조회
	 * 
	 * @author 김경은
	 * @param id
	 * @return
	 */
	@Transactional
	public int selectSectionCount(Integer novelId) {

		return novelSectionRepository.selectNovelSectionCount(novelId);
	}

	// 커버 업데이트
	@Transactional
	public void updateCover(Integer novelId, String cover) {
		novelRepository.updateCover(novelId, cover);
	}

	// 내 즐겨찾기 목록
	@Transactional
	public List<MyFavoriteDto> selectUserFavoriteNovelList(Integer userId, Integer limit) {
		return novelRepository.selectUserFavoriteListByUserId(userId, limit);
	}

	// 내 작품 목록
	@Transactional
	public List<MyFavoriteDto> selectMyNovels(Integer userId, Integer limit) {
		return novelRepository.selectMyNovelsByUserId(userId, limit);
	}
	
	// 장르 점유 조회
	@Transactional
	public List<GenreCountDto> selectGenreCount(){
		List<GenreCountDto> GenreCountlist = novelRepository.selectGenreCount();
		return GenreCountlist;
	}

}
