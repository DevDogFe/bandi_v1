package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.AnswerUpdateDto;
import com.bandi.novel.model.Answer;
import com.bandi.novel.model.Question;
import com.bandi.novel.repository.AnswerRepository;
import com.bandi.novel.repository.QuestionRepository;

@Service
public class AdminService {
	
	@Autowired
	private QuestionRepository questionRepository;
	@Autowired
	private AnswerRepository answerRepository;
	
	/**
	 * @return Question 전체조회
	 */
	public List<Question> readAllQuestionList() {

		List<Question> list = questionRepository.findAll();
		return list;
	}	
	
	public List<Question> readIncompleteQuestionList(Integer proceed){
		
		List<Question> list = questionRepository.findByProceed(proceed);
		return list;
	}
	
	/**
	 * 답변 생성
	 * @param answer
	 */
	@Transactional
	public void createAnswer(Answer answer) {

		answer.setUserId(1);
		int resultRowCount = answerRepository.insert(answer);
		if (resultRowCount != 1) {
			System.out.println("답변 작성 실패");
		}

	}
	
	/**
	 * 답변 수정
	 * @param answerUpdateDto
	 */
	@Transactional
	public void updateAnswerByQuestionId(AnswerUpdateDto answerUpdateDto) {
		
		Answer answerEntity = answerRepository.findByQuestionId(answerUpdateDto.getQuestionId());
		if(answerEntity == null) {
			System.out.println("해당 답변 존재하지 않습니다");			
		}
		
		int resultRowCount = answerRepository.updateByQuestionId(answerUpdateDto);
		if (resultRowCount != 1) {
			System.out.println("답변 수정 실패");
		}
	}
	
	/**
	 * 답변 삭제
	 * @param id
	 */
	@Transactional
	public void deleteAnswer(Integer questionId) {		
		
		Answer answerEntity = answerRepository.findByQuestionId(questionId);
		if(answerEntity == null) {
			System.out.println("해당 답변 존재하지 않습니다");			
		}
		
		// session		
		int resultRowCount = answerRepository.deleteByQuestionId(questionId);
		if (resultRowCount != 1) {
			System.out.println("답변 삭제 실패");			
		}
		
	}
	
	/**
	 * 질문 처리상태 변경
	 * @param questionId
	 */
	@Transactional
	public void updateQuestion(Integer questionId, Integer proceed) {
		
		Question questionEntity = questionRepository.findById(questionId);
		if(questionEntity == null) {
			System.out.println("이미 삭제된 글입니다");
		}		
		
		questionEntity.setProceed(proceed);
		int resultRowCount = questionRepository.updateProceedById(questionEntity);
		if(resultRowCount != 1) {
			System.out.println("처리변경 실패");
		}
		
	}

}
