package com.bandi.novel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.bandi.novel.dto.response.ResponseDto;
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
	public ResponseDto<Integer> deleteReplyProc(@PathVariable Integer id) {
		ResponseDto<Integer> response = boardReplyService.deleteBoardReplyById(id);
		return response;
	}
	
	
}
