package com.bandi.novel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bandi.novel.model.User;
import com.bandi.novel.service.NovelReplyService;
import com.bandi.novel.service.UserFavoriteService;
import com.bandi.novel.utils.Define;

/**
 * 소설 관련 restful api 요청
 * @author 김지현
 *
 */
@RestController
public class NovelApiController {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private UserFavoriteService userFavoriteService;
	@Autowired
	private NovelReplyService novelReplyService;
	
	// 즐겨찾기 해제
	@DeleteMapping("/api/unfavorite/{novelId}")
	public Integer unfavoriteProc(@PathVariable Integer novelId) {
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		userFavoriteService.deleteUserFavorite(principal.getId(), novelId);
		return novelId;
		
	}
	
	// 즐겨찾기 등록
	@PostMapping("/api/favorite/{novelId}")
	public Integer favoriteProc(@PathVariable Integer novelId) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		userFavoriteService.insertUserFavorite(principal.getId(), novelId);
		return novelId;

	}
	
	@DeleteMapping("/api/reply/{replyId}")
	public Integer deleteNovelReplyProc(@PathVariable Integer replyId) {
		System.out.println("replyId: " + replyId);
		novelReplyService.deleteNovelReplyById(replyId);
		
		return replyId;
	}

}
