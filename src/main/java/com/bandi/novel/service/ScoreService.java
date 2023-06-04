package com.bandi.novel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.response.ResponseDto;
import com.bandi.novel.handler.exception.CustomRestfulException;
import com.bandi.novel.model.Score;
import com.bandi.novel.repository.ScoreRepository;
import com.bandi.novel.utils.Define;

/**
 * 소설 회차 별점관련
 * 
 * @author 김지현
 *
 */
@Service
public class ScoreService {

	@Autowired
	private ScoreRepository scoreRepository;

	// 별점 매기기
	@Transactional
	public ResponseDto<String> scoreSection(Score score) {
		Score scoreEntity = scoreRepository.selectByUserIdAndSectionId(score);
		int result;
		if (scoreEntity == null) {
			result = scoreRepository.insertScore(score);
			if(result != 1) {
				throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
			}
			return new ResponseDto<String>(HttpStatus.OK, "별점이 등록되었습니다 (" + score.getScore() + ")", true, "insert");
		}
		
		result = scoreRepository.updateScore(score);
		if(result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseDto<String>(HttpStatus.OK, "별점이 수정되었습니다 (" + score.getScore() + ")", true, "update");
	}

	// 내가 매긴 별점 조회
	@Transactional
	public void selectSectionScoreByUserIdAndSectionId(Integer userId, Integer sectionId) {
		
		scoreRepository.selectByUserIdAndSectionId(Score.builder().userId(userId).sectionId(sectionId).build());
	}

}
