package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.BoardDetailDto;
import com.bandi.novel.dto.BoardDto;
import com.bandi.novel.dto.BoardTypeDto;
import com.bandi.novel.dto.CategorySelectDto;
import com.bandi.novel.model.BoardType;

@Mapper
public interface BoardCategoryRepository {
	
	// select 박스 카테고리 종류 
	public List<CategorySelectDto> selectCategory(Integer boardTypeId);
}
