package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.response.NovelDetailDto;
import com.bandi.novel.dto.response.NovelDto;
import com.bandi.novel.model.Genre;
import com.bandi.novel.model.Novel;
import com.bandi.novel.model.ServiceType;
import com.bandi.novel.repository.GenreRepository;
import com.bandi.novel.repository.NovelRepository;
import com.bandi.novel.repository.ServiceTypeRepository;

/**
 * 소설 관련 서비스
 * @author 김지현
 *
 */
@Service
public class NovelService {

	@Autowired
	private GenreRepository genreRepository;
	@Autowired
	private ServiceTypeRepository serviceTypeRepository;
	@Autowired
	private NovelRepository novelRepository;
	
	@Transactional
	public List<Genre> selectGenreList(){
		
		return genreRepository.selectAll();
	}
	
	@Transactional
	public List<ServiceType> selectServiceTypeList(){
		
		return serviceTypeRepository.selectAll();
	}
	
	/**
	 * 소설 등록
	 * @param novel
	 */
	@Transactional
	public void insertNovel(Novel novel) {
		Novel novelEntity = novelRepository.selectNovelByUserIdAndTitle(novel);
		if(novelEntity != null) {
			throw new IllegalArgumentException("작가님의 작품 중 같은 제목의 작품이 이미 있습니다.");
		}
		
		int result = novelRepository.insertNovel(novel);
		
		if(result != 1) {
			// 던지기
			System.out.println("insertNovelResult: " + result);
		}
	}
	
	/**
	 * 유료소설 리스트
	 * @return
	 */
	@Transactional
	public List<NovelDto> selectPayNovelList(){
		
		return novelRepository.selectPayNovels();
	}
	
	/**
	 * 소설 조회
	 * @param id
	 * @return
	 */
	@Transactional
	public NovelDetailDto selectNovelDetailById(Integer id) {
		
		return novelRepository.selectNovelDetailByNovelId(id);
	}
	
}
