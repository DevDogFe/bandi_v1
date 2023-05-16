package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.BoardDto;
import com.bandi.novel.dto.CategorySelectDto;
import com.bandi.novel.model.Board;
import com.bandi.novel.repository.BoardRepository;

@Service
public class BoardService {
	
	@Autowired
	private BoardRepository boardRepository;

	@Transactional
	public void createBoard(BoardDto boardDto) {
		
		int resultRowCount = boardRepository.insert(boardDto);
		if(resultRowCount != 1) {
			System.out.println("등록 실패");
		}
	}
	
	@Transactional
	public List<Board> findAll() {
		List<Board> boardList = boardRepository.findAll();
		if(boardList == null) {
			System.out.println("실패");
		}
		
		return boardList;
	}
	
	public List<CategorySelectDto> selectCategory() {
		List<CategorySelectDto> list = boardRepository.selectCategory();
		return list;
	}
}
