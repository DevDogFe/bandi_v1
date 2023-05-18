package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.BoardDetailDto;
import com.bandi.novel.dto.BoardDto;
import com.bandi.novel.dto.BoardTypeDto;
import com.bandi.novel.dto.CategorySelectDto;
import com.bandi.novel.repository.BoardRepository;

@Service
public class BoardService {
	
	@Autowired
	private BoardRepository boardRepository;

	// 게시물 등록
	@Transactional
	public void createBoard(BoardDto boardDto) {
		
		int resultRowCount = boardRepository.insert(boardDto);
		if(resultRowCount != 1) {
			System.out.println("등록 실패");
		}
	}
	
	// 게시물 카테고리 리스트 불러오기
	@Transactional
	public List<CategorySelectDto> selectCategory() {
		List<CategorySelectDto> list = boardRepository.selectCategory();
		return list;
	}
	
	// 게시물 종류 리스트 불러오기
	@Transactional
	public List<BoardTypeDto> selectBoardType() {
		List<BoardTypeDto> list = boardRepository.selectBoardType();
		return list;
	}
	
	// 게시물 리스트 불러오기
//	@Transactional
//	public List<BoardDto> selectBoardList() {
//		List<BoardDto> list = boardRepository.selectBoardList();
//		return list;
//	}
	public List<BoardDto> selectBoardList(String boardName) {
		//boardName = "%" + boardName + "%";
		List<BoardDto> list = boardRepository.selectBoardList(boardName);
		return list;
	}
	
	// 게시물 상세보기
	@Transactional
	public BoardDetailDto selectBoardDetailById(int id) {
		
		return boardRepository.selectBoardDetailById(id);
	}
	
	// 게시물 수정하기
	@Transactional
	public int updateBoard(BoardDto boardDto) {
		int resultRowCount = boardRepository.updateBoard(boardDto);
		if(resultRowCount != 1) {
			System.out.println("수정 실패");
		}
		return resultRowCount;
	}
	
	// 게시물 삭제하기
	public int deleteBoard(int id) {
		int resultRowCount = boardRepository.deleteById(id);
		if(resultRowCount != 1) {
			System.out.println("삭제 실패");
		}
		return resultRowCount;
	}
}
