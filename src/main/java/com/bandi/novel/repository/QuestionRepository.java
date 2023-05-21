package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.QuestionUpdateDto;
import com.bandi.novel.model.Question;

@Mapper
public interface QuestionRepository {

	
	public List<Question> findAll();
	
	public List<Question> findByQnaUserId(Integer userId);
	
	public List<Question> findByProceed(Integer proceed);

	public int insert(Question question);

	public Question findById(Integer id);

	public int updateById(QuestionUpdateDto questionUpdateDto);

	public int deleteById(Integer id);
	
	public int updateProceedById(Question question);

}
