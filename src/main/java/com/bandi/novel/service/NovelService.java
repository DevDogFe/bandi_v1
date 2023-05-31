package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.adminNovelUpdateFormDto;
import com.bandi.novel.dto.response.GenreCountDto;
import com.bandi.novel.dto.response.MyFavoriteDto;
import com.bandi.novel.dto.response.NovelDetailDto;
import com.bandi.novel.dto.response.NovelDto;
import com.bandi.novel.dto.response.NovelSearchDto;
import com.bandi.novel.dto.response.SectionDto;
import com.bandi.novel.model.Genre;
import com.bandi.novel.model.Novel;
import com.bandi.novel.model.NovelSection;
import com.bandi.novel.model.ServiceType;
import com.bandi.novel.repository.ContestNovelRepository;
import com.bandi.novel.repository.GenreRepository;
import com.bandi.novel.repository.NovelRepository;
import com.bandi.novel.repository.NovelSectionRepository;
import com.bandi.novel.repository.ServiceTypeRepository;

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

	@Autowired

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
			throw new IllegalArgumentException("작가님의 작품 중 같은 제목의 작품이 이미 있습니다.");
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
			// 던지기
			System.out.println("insertNovelResult: " + result);
		}
	}

	/**
	 * 유료소설 리스트
	 * 
	 * @return
	 */
	@Transactional
	public List<NovelDto> selectPayNovelList(Integer genreId, String search, String sort) {
		
		System.out.println(genreId + " / " + search);

		if (genreId != null || search != null) {
			System.out.println("11111111111");
			return novelRepository.selectPayNovelsByGenreIdAndName(genreId, search, sort);
		}
		System.out.println(sort);
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
	 * 소설 조회
	 * 
	 * @param id
	 * @return
	 */
	@Transactional
	public NovelDetailDto selectNovelDetailById(Integer id) {

		return novelRepository.selectNovelDetailByNovelId(id);
	}

	// 전체 소설 검색(관리자 페이지에서 사용함)
	@Transactional
	public List<NovelSearchDto> selectNovelListBySearch(String search) {

		return novelRepository.selectNovelListBySearch(search);
	}

	// 소설 서비스 타입 변경(관리자 페이지에서 사용함)
	@Transactional
	public int updateNovelListBySearch(adminNovelUpdateFormDto dto) {

		int result = novelRepository.updateNovelServiceType(dto);

		if (result != 1) {
			System.out.println("업데이트 실패");
		}

		return result;
	}

	// 소설 삭제(관리자 페이지에서 사용함)
	@Transactional
	public int deleteNovel(Integer id) {
		
		int result = novelRepository.deleteNovelById(id);

		if (result != 1) {
			System.out.println("삭제 실패");
		}

		return result;
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
			throw new IllegalArgumentException("요청을 처리하지 못함.");
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
