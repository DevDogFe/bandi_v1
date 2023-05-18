package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.BoardDetailDto;
import com.bandi.novel.dto.BoardDto;
import com.bandi.novel.dto.BoardTypeDto;
import com.bandi.novel.dto.CategorySelectDto;

@Mapper
public interface BoardRepository {
	
	// 게시물 등록
	public int insert(BoardDto boardDto);
	// select 박스 카테고리 종류 
	public List<CategorySelectDto> selectCategory();
	// select 박스 게시판 종류
	public List<BoardTypeDto> selectBoardType();
	// 게시물 조회
	public List<BoardDto> selectBoardList(String boardName);
	// 게시물 상세보기
	BoardDetailDto selectBoardDetailById(int id);
	// 게시물 수정
	public int updateBoard(BoardDto boardDto);
	// 게시물 삭제
	public int deleteById(int id);
}
