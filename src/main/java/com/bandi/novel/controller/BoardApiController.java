package com.bandi.novel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bandi.novel.service.BoardReplyService;
import com.bandi.novel.service.BoardService;

@RestController
public class BoardApiController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private BoardReplyService boardReplyService;
	
	// 댓글 삭제
	@DeleteMapping("/api/deletereply/{id}")
	public Integer deleteReplyProc(@PathVariable Integer id) {
		int resultRow = boardReplyService.deleteBoardReplyById(id);
		return resultRow;
	}
	
	// 파일 삭제
	@DeleteMapping("/api/deletefile/{id}")
	public Integer deleteFileProc(@PathVariable Integer id) {
		int resultRow = boardService.deleteFile(id);
		return resultRow;
	}
	
}
