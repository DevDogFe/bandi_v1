package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.QnaDto;
import com.bandi.novel.model.Question;

@Mapper
public interface QnaRepository {
	
	public List<QnaDto> findAll();	
	public List<QnaDto> findByUserId(Integer userId);
	
	public Question insert(Question question);
	

}
