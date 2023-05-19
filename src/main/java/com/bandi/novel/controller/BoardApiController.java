package com.bandi.novel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.bandi.novel.dto.BoardDto;
import com.bandi.novel.service.BoardService;

@RestController
public class BoardApiController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/api/list/{categoryId}")
	public List<BoardDto> selectBoardListByCategoryId(@PathVariable Integer categoryId) {
		List<BoardDto> list = boardService.selectBoardListByCategoryId(categoryId);
		return list;
	}
}
