package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.QuestionUpdateFormDto;
import com.bandi.novel.model.Question;

@Mapper
public interface QuestionRepository {
	
	public List<Question> findAll();	
	public List<Question> findByUserId(Integer userId);
	
	public int insert(Question question);
	public Question findById(Integer id);
	public int updateById(QuestionUpdateFormDto questionUpdateFormDto);
	public int deleteById(Integer id);

}
