package com.bandi.novel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.bandi.novel.service.BoardReplyService;
import com.bandi.novel.service.BoardService;

@RestController
public class BoardApiController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private BoardReplyService boardReplyService;
	
	@DeleteMapping("/api/reply/{id}")
	public Integer deleteReplyProc(@PathVariable Integer id) {
		int resultRow = boardReplyService.deleteBoardReplyById(id);
		return resultRow;
	}
	
}
