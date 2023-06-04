package com.bandi.novel.repository;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.AnswerUpdateDto;
import com.bandi.novel.model.Answer;

@Mapper
public interface AnswerRepository {

	public int insertAnswer(Answer answer);

	public Answer selectByQuestionId(Integer questionId);

	public Answer selectById(Integer id);

	public int updateByQuestionId(AnswerUpdateDto answerUpdateDto);

	public int deleteByQuestionId(Integer questionId);

}
