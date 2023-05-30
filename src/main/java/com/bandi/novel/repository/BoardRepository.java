package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.BoardDetailDto;
import com.bandi.novel.dto.BoardDto;
import com.bandi.novel.dto.BoardSearchDto;

@Mapper
public interface BoardRepository {
	
	// 게시물 등록
	public int insert(BoardDto boardDto);
	// 게시판 종류 별 게시물 조회
	public List<BoardDto> selectBoardListByBoardTypeId(Integer boardTypeId);
	// 게시물 상세보기
	BoardDetailDto selectBoardDetailById(Integer Id);
	// 게시물 수정
	public int updateBoard(BoardDto boardDto);
	// 게시물 삭제
	public int deleteById(Integer id);
	// 카테고리 별 게시물 조회
	public List<BoardDto> selectBoardListByCategoryId(Integer categoryId);
	// 조회수 
	int updateViewById(Integer boardId);
	// 게시물 검색 
	List<BoardDto> selectSearchList(BoardSearchDto boardSearchDto);
	// 방금 등록한 게시물 boardId 가져오기
	Integer selectBoardIdByDTO(BoardDto boardDto);
}
