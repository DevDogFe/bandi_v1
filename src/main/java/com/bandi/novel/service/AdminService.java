package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.AnswerUpdateDto;
import com.bandi.novel.dto.CategorySelectDto;
import com.bandi.novel.dto.UserRoleDto;
import com.bandi.novel.dto.UserSearchDto;
import com.bandi.novel.dto.response.BestSectionDto;
import com.bandi.novel.model.Answer;
import com.bandi.novel.model.Faq;
import com.bandi.novel.model.Genre;
import com.bandi.novel.model.Question;
import com.bandi.novel.model.User;
import com.bandi.novel.model.UserRole;
import com.bandi.novel.repository.AnswerRepository;
import com.bandi.novel.repository.BoardCategoryRepository;
import com.bandi.novel.repository.FaqRepository;
import com.bandi.novel.repository.GenreRepository;
import com.bandi.novel.repository.QuestionRepository;
import com.bandi.novel.repository.UserNovelRecordRepository;
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
	@Autowired
	private UserNovelRecordRepository userNovelRecordRepository;
	@Autowired
	private FaqRepository faqRepository;
	
	/**
	 * @return Question 전체조회
	 */
	public List<Question> readAllQuestionList() {

		List<Question> list = questionRepository.findAllQuestion();
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
	public Integer updateUserRole(User user) {
		int resultRowCount = userRepository.updateUserRole(user);
		if(resultRowCount != 1) {
			System.out.println("수정 실패");
		}
		return resultRowCount;
	}
	
	// 사용자 검색
	@Transactional
	public List<UserRoleDto> searchUser(UserSearchDto userSearchDto) {
		if(userSearchDto.getType() == null) {
			userSearchDto.setType("all");
		}
		List<UserRoleDto> list = userRepository.searchUser(userSearchDto);
		return list;
	}
	
	@Transactional
	public List<UserRole> selectUserRole() {
		List<UserRole> list = userRepository.selectUserRole();
		return list;
	}
	
	/**
	 * @author 김지현
	 * @return 오늘 가입자수
	 */
	@Transactional
	public Integer selectTodayJoinUserCount() {
		Integer count = userRepository.selectTodayJoinUserCount();
		if(count == null) {
			count = 0;
		}
		return count;
	}
	
	/**
	 * 오늘 가장 많이 조회된 회차
	 * @author 김지현
	 * @return
	 */
	@Transactional
	public BestSectionDto selectTodayBest() {
		BestSectionDto dto = userNovelRecordRepository.selectTodayBestSection();
		return dto;
	}
	
	/**
	 * 이달 가장 많이 조회된 회차
	 * @author 김지현
	 * @return
	 */
	@Transactional
	public BestSectionDto selectMonthBest() {
		BestSectionDto dto = userNovelRecordRepository.selectMonthBestSection();
		return dto;
	}
	/**
	 * FAQ 생성
	 * @param faq
	 */
	public void createFaq(Faq faq) {
		
		faqRepository.insert(faq);		
	}
	
	/**
	 * FAQ 수정
	 * @param id
	 */
	public void updateFaq(Integer id) {
		faqRepository.updateFaqById(id);
	}
	
	/**
	 * FAQ 삭제
	 * @param id
	 */
	public void deleteFaq(List<Integer> id) {
		
		faqRepository.deleteFaq(id);
		
	}
	
	/**
	 * FAQ 조회 
	 * @param id
	 * @return
	 */
	public Faq readFaq(Integer id) {
		return faqRepository.findById(id);
	}
	

}
