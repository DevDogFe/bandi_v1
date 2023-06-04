package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.QnaSearchDto;
import com.bandi.novel.dto.QuestionUpdateDto;
import com.bandi.novel.dto.response.QnaDto;
import com.bandi.novel.model.Question;

@Mapper
public interface QuestionRepository {

	public List<QnaDto> selectAllQna();	
	
	public List<Question> selectAllQuestion();
	
	public List<Question> selectQnaByUserId(Integer userId);
	
	public List<Question> selectByProceed(Integer proceed);

	public int insertQuestion(Question question);

	public Question selectById(Integer id);

	public int updateById(QuestionUpdateDto questionUpdateDto);

	public int deleteById(Integer id);
	
	public int updateProceedById(Question question);
	
	public List<QnaDto> selectByKeyword(QnaSearchDto qnaSearchDto);

}
