package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bandi.novel.dto.QuestionUpdateFormDto;
import com.bandi.novel.model.Question;
import com.bandi.novel.repository.QuestionRepository;

@Service
public class QnaService {
	
	@Autowired
	private QuestionRepository qnaRepository;
	
	/**
	 * @return Q&A 전체조회
	 */
	public  List<Question> readAllQuestionList(){
		
		List<Question> list = qnaRepository.findAll();
		return list;
	}
	
	/**
	 * @param principalId
	 * @return Q&A 조회 (마이페이지)
	 */
	public List<Question> readQuestionByUserId(Integer principalId){
		
		List<Question> list = qnaRepository.findByUserId(principalId);
		
		return list;
		
	}
	
	/**
	 * Question 생성
	 * @param question
	 * @param principalId
	 */
	public void createQuestion(Question question, Integer principalId) {		
		
		question.setUserId(principalId);		
		int resultRowCount = qnaRepository.insert(question);
		if (resultRowCount != 1) {
			System.out.println("질문작성실패");		
		}
	}
	
	/**
	 * @param id
	 * @return Question 조회
	 */
	public Question readQuestionById(Integer id) {
		
		Question questionEntity = qnaRepository.findById(id);		
		return questionEntity;		
	}
	
	/**
	 * Question 수정
	 * @param questionUpdateFormDto
	 * @param principalId
	 */
	public void updateQuestion(QuestionUpdateFormDto questionUpdateFormDto ,Integer principalId) {
		
		Question questionEntity = qnaRepository.findById(questionUpdateFormDto.getId());
		if(questionEntity == null) {
			System.out.println("해당 글이 존재하지 않습니다");
		}
		// session
		
		int resultRowCount = qnaRepository.updateById(questionUpdateFormDto);
		if(resultRowCount != 1) {
			System.out.println("수정실패");
		}		
	}
	
	/**
	 * Question 삭제
	 * @param id
	 */
	public void deleteQuestion(Integer id) {
		
		int resultRowCount = qnaRepository.deleteById(id);
		if(resultRowCount != 1) {
			System.out.println("삭제 실패");
		}
	}
	
	

}
