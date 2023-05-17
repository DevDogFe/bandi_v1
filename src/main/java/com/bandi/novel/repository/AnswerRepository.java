package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.model.Answer;

@Mapper
public interface AnswerRepository {
	
	public List<Answer> findAll();

}
