package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.response.ContestNovelDto;
import com.bandi.novel.handler.exception.CustomRestfulException;
import com.bandi.novel.model.Contest;
import com.bandi.novel.model.ContestNovel;
import com.bandi.novel.repository.ContestNovelRepository;
import com.bandi.novel.repository.ContestRepository;
import com.bandi.novel.repository.NovelRepository;
import com.bandi.novel.repository.NovelSectionRepository;
import com.bandi.novel.utils.Define;

/**
 * 
 * @author 김경은
 */
@Service
public class ContestService {
	
	@Autowired
	private ContestRepository contestRepository;
	@Autowired
	private ContestNovelRepository contestNovelRepository;
	@Autowired
	private NovelRepository novelRepository;
	@Autowired
	private NovelSectionRepository novelSectionRepository;
	
	@Transactional
	public void insertContest(Contest contest) {
		/*
		 * Contest contestEntity = contestRepository.selectContestByUserIdAndTitle();
		 * if(contestEntity != null) {
		 * 
		 * }
		 */
		int result = contestRepository.insertContest(contest);
		
		if(result != 1) {
			throw new IllegalArgumentException("요청을 처리하지 못함.");
		}
	}
	
	/**
	 * 공모전 날짜로 리스트 조회
	 * @return 공모전 리스트
	 */
	@Transactional
	public List<Contest> selectContestByDate() {
		
		List<Contest> contest = contestRepository.selectContestListByDate();
		
		return contest;
	}
	
	/**
	 * 공모전 id로 조회
	 * @return 공모전
	 */
	@Transactional
	public Contest selectContestById(Integer id) {
		
		Contest contest = contestRepository.selectContestById(id);
		
		return contest;
	}
	
	@Transactional
	public List<Contest> selectContestListByLimit(){
		
		List<Contest> contestList = contestRepository.selectContestList();
		if(contestList == null) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return contestList;
	}
	
	/**
	 * 공모전 업데이트
	 * @return 공모전 리스트
	 */
	@Transactional
	public void updateContest(Contest contest) {
		
		int result = contestRepository.updateContestByModel(contest);
		
		if(result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	/**
	 * 공모전 삭제
	 * @return 공모전 
	 */
	@Transactional
	public void deleteContestById(int contestId) {
		
		int novelResult = novelRepository.deleteNovelByContestId(contestId);
		if (novelResult != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// contest에서 삭제
		int contestResult = contestRepository.deleteContestById(contestId);
		if(contestResult != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	/**
	 * 공모전 게시판 아이디 조회
	 * @return 공모전 
	 */
	@Transactional
	public ContestNovel selectContestByNovelId(int id) {
		
		ContestNovel contestNovel = contestNovelRepository.selectContestNovelByNovelId(id);
		
		return contestNovel;
	}
	
	/**
	 * 공모전 게시판 리스트 조회
	 * @return 공모전 
	 */
	@Transactional
	public List<ContestNovelDto> selectContestNovelList() {
		
		List<ContestNovelDto> contestNovelList = contestNovelRepository.selectContestNovelList();
		
		return contestNovelList;
	}
	
	/**
	 * 공모전 게시판 리스트 검색 조회
	 * @return 공모전 
	 */
	@Transactional
	public List<ContestNovelDto> selectContestNovelListBySearch(Integer genreId, String search) {
		
		if(genreId != null || search != null) {
			return contestNovelRepository.selectContestNovelsByGenreIdAndName(genreId, search);
		}
		
		return contestNovelRepository.selectContestNovelList();
	}
	
	
	/**
	 * 공모전 소설 삭제
	 * @return 공모전 
	 */
	@Transactional
	public void deleteContestNovelById(int id) {
		
		int result = novelRepository.deleteNovelById(id);
		
		if(result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	/**
	 * 공모전 소설 회차 삭제
	 * @return 공모전 
	 */
	@Transactional
	public void deleteContestNovelSectionById(int id) {
		
		int result = novelSectionRepository.deleteNovelSectionById(id);
		
		if(result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
