package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.AnswerUpdateDto;
import com.bandi.novel.model.Answer;

@Mapper
public interface AnswerRepository {
	
	public List<Answer> findAll();
	public int insert(Answer answer);
	
	public Answer findByQuestionId(Integer questionId);
	public Answer findById(Integer id);	
	
	public int updateByQuestionId(AnswerUpdateDto answerUpdateDto);
	
	public int deleteByQuestionId(Integer questionId);
	

}
