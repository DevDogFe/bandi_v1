package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		int result = novelRepository.insertNovel(novel);
		
		if(result != 1) {
			// 던지기
			System.out.println("insertNovelResult: " + result);
		}
	}
	
	
}
