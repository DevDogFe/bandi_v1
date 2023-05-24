package com.bandi.novel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.model.Score;
import com.bandi.novel.repository.ScoreRepository;

/**
 * 소설 회차 별점관련
 * @author 김지현
 *
 */
@Service
public class ScoreService {
	
	@Autowired
	private ScoreRepository scoreRepository;
	
	// 별점 매기기
	@Transactional
	public void scoreSection(Score score) {
		Score scoreEntity = scoreRepository.selectByUserIdAndSectionId(score);
		if(scoreEntity == null) {
			scoreRepository.insertScore(score);
		} else {
			scoreRepository.updateScore(score);
		}
	}
	
	// 내가 매긴 별점 조회
	@Transactional
	public void selectSectionScoreByUserIdAndSectionId(Integer userId, Integer SectionId) {
		Score score = new Score();
		score.setUserId(userId);
		score.setSectionId(SectionId);
		scoreRepository.selectByUserIdAndSectionId(score);
	}

}
