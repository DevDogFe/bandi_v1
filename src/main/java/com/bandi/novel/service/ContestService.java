package com.bandi.novel.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.model.Contest;
import com.bandi.novel.repository.ContestRepository;

/**
 * 
 * @author 김경은
 */
@Service
public class ContestService {
	
	@Autowired
	private ContestRepository contestRepository;
	
	@Transactional
	public List<Contest> selectContestListByLimit(){
		
		List<Contest> contestList = contestRepository.selectContestList();
		if(contestList == null) {
			throw new IllegalArgumentException("요청을 처리하지 못함.");
		}
		
		return contestList;
	}
	
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
	
	@Transactional
	public void deleteContestById(int id) {
		
		int result = contestRepository.deleteContestById(id);
		
		if(result != 1) {
			throw new IllegalArgumentException("요청을 처리하지 못함.");
		}
	}
	
	@Transactional
	public void updateContest(Contest contest) {
		
		System.out.println("=========================");
		System.out.println(contest.getTitle());
		System.out.println(contest.getContent());
		System.out.println(contest.getBeginCreatedAt());
		System.out.println(contest.getEndCreatedAt());
		System.out.println("=========================");
		
		int result = contestRepository.updateContestByModel(contest);
		
		if(result != 1) {
			throw new IllegalArgumentException("요청을 처리하지 못함.");
		}
	}
	
	@Transactional
	public List<Contest> selectContestByDate() {
		
		List<Contest> contest = contestRepository.selectContestListByDate();
		
		return contest;
	}
}
