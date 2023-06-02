package com.bandi.novel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bandi.novel.dto.response.ResponseDto;
import com.bandi.novel.model.User;
import com.bandi.novel.service.BoardLikeService;
import com.bandi.novel.utils.Define;

@RestController
public class BoardLikeApiController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private BoardLikeService boardLikeService;
	
	// 좋아요 등록
	@PostMapping("/api/like/{boardId}")
	public ResponseDto<Integer> likeProc(@PathVariable Integer boardId) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		ResponseDto<Integer> response = boardLikeService.insertLike(principal.getId(), boardId);
		return response;
	}
	
	// 좋아요 해제
	@DeleteMapping("/api/unlike/{boardId}")
	public ResponseDto<Integer> unLikeProc(@PathVariable Integer boardId) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		ResponseDto<Integer> response = boardLikeService.deleteLike(principal.getId(), boardId);
		return response;
	}

}
