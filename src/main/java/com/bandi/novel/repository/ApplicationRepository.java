package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.ApplicationFromDto;
import com.bandi.novel.model.Application;

@Mapper
public interface ApplicationRepository {
	
	public List<Application> selectAll();
	
	public List<Application> selectByUserId(Integer userId);
	
	public Application selectById(Integer id);
	
	public int insertApplication(ApplicationFromDto applicationFromDto);
	
	public int updateById(Integer id);
	
	public int deleteById(Integer id);
	
	

}
