package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.ApplicationFromDto;
import com.bandi.novel.model.Application;

@Mapper
public interface ApplicationRepository {
	
	public List<Application> findAll();
	
	public List<Application> findByUserId(Integer userId);
	
	public Application findById(Integer id);
	
	public int insert(ApplicationFromDto applicationFromDto);
	
	public int updateById(Integer id);
	
	public int deleteById(Integer id);
	
	

}
