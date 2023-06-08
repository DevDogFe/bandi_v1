package com.bandi.novel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.bandi.novel.dto.BoardDetailDto;
import com.bandi.novel.dto.response.ResponseDto;
import com.bandi.novel.handler.exception.CustomRestfulException;
import com.bandi.novel.model.User;
import com.bandi.novel.service.BoardReplyService;
import com.bandi.novel.service.BoardService;
import com.bandi.novel.utils.Define;

@RestController
public class BoardApiController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private BoardReplyService boardReplyService;
	@Autowired
	private HttpSession session;

	// 댓글 삭제
	@DeleteMapping("/api/deletereply/{id}")
	public ResponseDto<Integer> deleteReplyProc(@PathVariable Integer id) {
		ResponseDto<Integer> response = boardReplyService.deleteBoardReplyById(id);
		return response;
	}


	// 관리자 게시물 삭제
	@DeleteMapping("/api/board/delete/{id}")
	public ResponseDto<Integer> deleteBoard(@PathVariable Integer id) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		if (principal.getUserRole() != 1) {
			throw new CustomRestfulException(Define.UNAUTHED, HttpStatus.UNAUTHORIZED);
		}
		ResponseDto<Integer> response = boardService.deleteBoard(id);
		return response;
	}

}
