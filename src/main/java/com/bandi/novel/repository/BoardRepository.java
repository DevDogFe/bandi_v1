package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.BoardDto;
import com.bandi.novel.dto.CategorySelectDto;
import com.bandi.novel.model.Board;

@Mapper
public interface BoardRepository {
	
	public int insert(BoardDto boardDto);
	public List<Board> findAll();
	public List<CategorySelectDto> selectCategory();
}
