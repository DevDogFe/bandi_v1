package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.AnswerUpdateDto;
import com.bandi.novel.dto.CategorySelectDto;
import com.bandi.novel.dto.UserSearchDto;
import com.bandi.novel.model.Answer;
import com.bandi.novel.model.Genre;
import com.bandi.novel.model.Question;
import com.bandi.novel.model.User;
import com.bandi.novel.repository.AnswerRepository;
import com.bandi.novel.repository.BoardCategoryRepository;
import com.bandi.novel.repository.GenreRepository;
import com.bandi.novel.repository.QuestionRepository;
import com.bandi.novel.repository.UserRepository;

@Service
public class AdminService {
	
	@Autowired
	private QuestionRepository questionRepository;
	@Autowired
	private AnswerRepository answerRepository;
	@Autowired
	private BoardCategoryRepository boardCategoryRepository;
	@Autowired
	private GenreRepository genreRepository;
	@Autowired
	private UserRepository userRepository;
	
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
	public void createAnswer(Answer answer, Integer principalId) {

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
	
	// 카테고리 등록
	@Transactional
	public void createCategory(CategorySelectDto categorySelectDto) {
		int resultRowCount = boardCategoryRepository.insert(categorySelectDto);
		if(resultRowCount != 1) {
			System.out.println("등록 실패");
		}
	}
	
	// 카테고리 삭제 
	@Transactional
	public Integer deleteCategoryById(Integer id) {
		int result = boardCategoryRepository.deleteById(id);
		return result;
	}
	
	// 장르 등록
	@Transactional
	public void createGenre(Genre genre) {
		int resultRowCount = genreRepository.insert(genre);
		if(resultRowCount != 1) {
			System.out.println("등록 실패");
		}
	}
	
	// 장르 삭제
	@Transactional
	public Integer deleteGenreById(Integer id) {
		int result = genreRepository.deleteById(id);
		return result;
	}
	
	// 유저롤 수정
	@Transactional
	public void updateUserRole(User user) {
		
	}
	
	// 사용자 검색
	@Transactional
	public List<User> searchUser(UserSearchDto userSearchDto) {
		List<User> list = userRepository.searchUser(userSearchDto);
		return list;
	}

}
