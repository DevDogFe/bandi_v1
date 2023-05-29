package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.AnswerUpdateDto;
import com.bandi.novel.dto.QuestionUpdateDto;
import com.bandi.novel.dto.response.QnaDto;
import com.bandi.novel.model.Answer;
import com.bandi.novel.model.Question;
import com.bandi.novel.repository.AnswerRepository;
import com.bandi.novel.repository.QuestionRepository;

@Service
public class QnaService {

	@Autowired
	private QuestionRepository questionRepository;
	@Autowired
	private AnswerRepository answerRepository;
	
	/**
	 * @return 전체 Q&Alist
	 */
	public List<QnaDto> readAllQna(){
		
		List<QnaDto> list = questionRepository.findAllQna();
		return list;
	}


	/**
	 * @param principalId
	 * @return Q&A 조회 (마이페이지)
	 */
	public List<Question> readQuestionByUserId(Integer principalId) {

		List<Question> list = questionRepository.findQnaByUserId(principalId);
		return list;
	}

	/**
	 * Question 생성
	 * @param question
	 * @param principalId
	 */
	public void createQuestion(Question question, Integer principalId) {

		question.setUserId(principalId);
		int resultRowCount = questionRepository.insert(question);
		if (resultRowCount != 1) {
			System.out.println("질문작성실패");
		}
	}

	/**
	 * @param id
	 * @return Question 조회
	 */
	public Question readQuestionById(Integer id) {
		Question questionEntity = questionRepository.findById(id);
		return questionEntity;
	}

	/**
	 * Question 수정
	 * @param questionUpdateFormDto
	 * @param principalId
	 */
	@Transactional
	public void updateQuestion(QuestionUpdateDto questionUpdateDto, Integer principalId) {

		Question questionEntity = questionRepository.findById(questionUpdateDto.getId());
		if (questionEntity == null) {
			System.out.println("해당 글이 존재하지 않습니다");
		}
		// session

		int resultRowCount = questionRepository.updateById(questionUpdateDto);
		if (resultRowCount != 1) {
			System.out.println("수정실패");
		}
	}

	/**
	 * Question 삭제
	 * @param id
	 */
	@Transactional
	public void deleteQuestion(Integer id) {

		Question questionEntity = questionRepository.findById(id);
		if (questionEntity == null) {
			System.out.println("해당 글이 존재하지 않습니다");
		}
		int resultRowCount = questionRepository.deleteById(id);
		if (resultRowCount != 1) {
			System.out.println("삭제 실패");
		}
	}	


	/**
	 * @param questionId
	 * @return Answer 조회
	 */
	public Answer readAnswerByQuestionId(Integer questionId) {

		Answer answerEntity = answerRepository.findByQuestionId(questionId);
		return answerEntity;
	}

}
