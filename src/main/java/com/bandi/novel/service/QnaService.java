package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.QnaSearchDto;
import com.bandi.novel.dto.QuestionUpdateDto;
import com.bandi.novel.dto.response.QnaDto;
import com.bandi.novel.handler.exception.CustomRestfulException;
import com.bandi.novel.model.Answer;
import com.bandi.novel.model.Question;
import com.bandi.novel.repository.AnswerRepository;
import com.bandi.novel.repository.QuestionRepository;
import com.bandi.novel.utils.Define;

@Service
public class QnaService {

	@Autowired
	private QuestionRepository questionRepository;
	@Autowired
	private AnswerRepository answerRepository;
	
	/**
	 * @return 전체 Q&Alist
	 */
	public List<QnaDto> selectAllQna(){
		
		List<QnaDto> list = questionRepository.selectAllQna();
		return list;
	}


	/**
	 * @param principalId
	 * @return Q&A 조회 (마이페이지)
	 */
	public List<Question> selectQuestionByUserId(Integer principalId) {

		List<Question> list = questionRepository.selectQnaByUserId(principalId);
		
		return list;
	}

	/**
	 * Question 생성
	 * @param question
	 * @param principalId
	 */
	public void selectQuestion(Question question, Integer principalId) {

		question.setUserId(principalId);
		int result = questionRepository.insertQuestion(question);
		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	/**
	 * @param id
	 * @return Question 조회
	 */
	public Question selectQuestionById(Integer id) {
		Question questionEntity = questionRepository.selectById(id);
		return questionEntity;
	}

	/**
	 * Question 수정
	 * @param questionUpdateFormDto
	 * @param principalId
	 */
	@Transactional
	public void updateQuestion(QuestionUpdateDto questionUpdateDto, Integer principalId) {

		Question questionEntity = questionRepository.selectById(questionUpdateDto.getId());
		if (questionEntity == null) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		// session

		int result = questionRepository.updateById(questionUpdateDto);
		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	/**
	 * Question 삭제
	 * @param id
	 */
	@Transactional
	public void deleteQuestion(Integer id) {

		Question questionEntity = questionRepository.selectById(id);
		if (questionEntity == null) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		int result = questionRepository.deleteById(id);
		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}	


	/**
	 * @param questionId
	 * @return Answer 조회
	 */
	public Answer selectAnswerByQuestionId(Integer questionId) {

		Answer answerEntity = answerRepository.selectByQuestionId(questionId);
		return answerEntity;
	}
	
	/**
	 * 검색기능
	 * @param qnaSearchDto
	 * @return
	 */
	public List<QnaDto> readQnaListByKeyword(QnaSearchDto qnaSearchDto) {		
		
		return questionRepository.selectByKeyword(qnaSearchDto);
	}

}
