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
	// 카테고리 추가
	Integer insert(CategorySelectDto categorySelectDto);
	// 카테고리 삭제  
	Integer deleteById(Integer id);
}
