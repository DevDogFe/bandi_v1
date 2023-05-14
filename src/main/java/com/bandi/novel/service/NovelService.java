package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.response.NovelDto;
import com.bandi.novel.model.Genre;
import com.bandi.novel.model.Novel;
import com.bandi.novel.model.ServiceType;
import com.bandi.novel.repository.GenreRepository;
import com.bandi.novel.repository.NovelRepository;
import com.bandi.novel.repository.ServiceTypeRepository;

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
	
	@Transactional
	public List<NovelDto> selectPayNovelList(){
		
		return novelRepository.selectPayNovels();
	}
	
	
}
