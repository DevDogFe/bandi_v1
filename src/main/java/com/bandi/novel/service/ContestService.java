package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.response.ContestNovelDto;
import com.bandi.novel.model.Contest;
import com.bandi.novel.model.ContestNovel;
import com.bandi.novel.repository.ContestNovelRepository;
import com.bandi.novel.repository.ContestRepository;
import com.bandi.novel.repository.NovelRepository;
import com.bandi.novel.repository.NovelSectionRepository;

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
	 * 공모전 조회
	 * @return 공모전 리스트
	 */
	@Transactional
	public List<Contest> selectContestByDate() {
		
		List<Contest> contest = contestRepository.selectContestListByDate();
		
		return contest;
	}
	
	@Transactional
	public List<Contest> selectContestListByLimit(){
		
		List<Contest> contestList = contestRepository.selectContestList();
		if(contestList == null) {
			throw new IllegalArgumentException("요청을 처리하지 못함.");
		}
		
		return contestList;
	}
	
	@Transactional
	public void updateContest(Contest contest) {
		
		int result = contestRepository.updateContestByModel(contest);
		
		if(result != 1) {
			throw new IllegalArgumentException("요청을 처리하지 못함.");
		}
	}
	
	/**
	 * 공모전 삭제
	 * @return 공모전 
	 */
	@Transactional
	public void deleteContestById(int contestId) {
		
		int novelResult = novelRepository.deleteNovelByContestId(contestId);
		
		// contest에서 삭제
		int contestResult = contestRepository.deleteContestById(contestId);
		System.out.println(novelResult + contestResult);
		if(contestResult != 1) {
			throw new IllegalArgumentException("요청을 처리하지 못함.");
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
	 * 공모전 소설 삭제
	 * @return 공모전 
	 */
	@Transactional
	public void deleteContestNovelById(int id) {
		
		int result = novelRepository.deleteNovelById(id);
		
		if(result != 1) {
			throw new IllegalArgumentException("요청을 처리하지 못함.");
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
			throw new IllegalArgumentException("요청을 처리하지 못함.");
		}
	}
}
