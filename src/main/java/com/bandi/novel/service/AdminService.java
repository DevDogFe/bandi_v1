package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.AnswerUpdateDto;
import com.bandi.novel.dto.CategorySelectDto;
import com.bandi.novel.dto.UserRoleDto;
import com.bandi.novel.dto.UserSearchDto;
import com.bandi.novel.dto.response.BestSectionDto;
import com.bandi.novel.dto.response.ResponseDto;
import com.bandi.novel.handler.exception.CustomRestfulException;
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
import com.bandi.novel.utils.Define;

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
	@Transactional
	public List<Question> selectAllQuestionList() {
		List<Question> list = questionRepository.selectAllQuestion();
		return list;
	}

	@Transactional
	public List<Question> selectIncompleteQuestionList(Integer proceed) {
		List<Question> list = questionRepository.selectByProceed(proceed);
		return list;
	}

	/**
	 * 답변 생성
	 * 
	 * @param answer
	 */
	@Transactional
	public void createAnswer(Answer answer, Integer principalId) {
		// TODO 로그인 해서 받는걸로 바꿀것
		answer.setUserId(1);
		int result = answerRepository.insertAnswer(answer);
		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	/**
	 * 답변 수정
	 * 
	 * @param answerUpdateDto
	 */
	@Transactional
	public void updateAnswerByQuestionId(AnswerUpdateDto answerUpdateDto) {
		Answer answerEntity = answerRepository.selectByQuestionId(answerUpdateDto.getQuestionId());
		if (answerEntity == null) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		int result = answerRepository.updateByQuestionId(answerUpdateDto);
		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	/**
	 * 답변 삭제
	 * 
	 * @param id
	 */
	@Transactional
	public void deleteAnswer(Integer questionId) {
		Answer answerEntity = answerRepository.selectByQuestionId(questionId);
		if (answerEntity == null) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		int result = answerRepository.deleteByQuestionId(questionId);
		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	/**
	 * 질문 처리상태 변경
	 * 
	 * @param questionId
	 */
	@Transactional
	public void updateQuestion(Integer questionId, Integer proceed) {

		Question questionEntity = questionRepository.selectById(questionId);
		if (questionEntity == null) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		questionEntity.setProceed(proceed);
		int result = questionRepository.updateProceedById(questionEntity);
		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	// 카테고리 등록
	@Transactional
	public void createCategory(CategorySelectDto categorySelectDto) {
		int result = boardCategoryRepository.insert(categorySelectDto);
		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 카테고리 삭제
	@Transactional
	public ResponseDto<Integer> deleteCategoryById(Integer id) {
		int result = boardCategoryRepository.deleteById(id);
		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseDto<Integer>(HttpStatus.OK, Define.REQUEST_SUCCESS, true, result);
	}

	// 장르 등록
	@Transactional
	public void createGenre(Genre genre) {
		int result = genreRepository.insert(genre);
		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 장르 삭제
	@Transactional
	public ResponseDto<Integer> deleteGenreById(Integer id) {
		int result = genreRepository.deleteById(id);
		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseDto<Integer>(HttpStatus.OK, Define.REQUEST_SUCCESS, true, result);
	}

	// 유저롤 수정
	@Transactional
	public ResponseDto<Integer> updateUserRole(User user) {
		int result = userRepository.updateUserRole(user);
		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseDto<Integer>(HttpStatus.OK, Define.REQUEST_SUCCESS, true, result);
	}

	// 사용자 검색
	@Transactional
	public List<UserRoleDto> searchUser(UserSearchDto userSearchDto) {
		if (userSearchDto.getType() == null) {
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
		if (count == null) {
			count = 0;
		}
		return count;
	}

	/**
	 * 오늘 가장 많이 조회된 회차
	 * 
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
	 * 
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
	 * 
	 * @param faq
	 */
	@Transactional
	public void createFaq(Faq faq) {

		int result = faqRepository.insertFaq(faq);
		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	/**
	 * FAQ 수정
	 * 
	 * @param id
	 */
	@Transactional
	public void updateFaq(Integer id) {
		int result = faqRepository.updateFaqById(id);
		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	/**
	 * FAQ 삭제
	 * 
	 * @param id
	 */
	@Transactional
	public ResponseDto<Integer> deleteFaq(List<Integer> id) {

		int result = faqRepository.deleteFaq(id);
		if (result != 1) {
			throw new CustomRestfulException(Define.REQUEST_FAIL, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return new ResponseDto<Integer>(HttpStatus.OK, Define.REQUEST_SUCCESS, true, result);

	}

	/**
	 * FAQ 조회
	 * 
	 * @param id
	 * @return
	 */
	@Transactional
	public Faq readFaq(Integer id) {
		return faqRepository.selectById(id);
	}

}
