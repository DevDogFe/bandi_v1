package com.bandi.novel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.bandi.novel.dto.response.ResponseDto;
import com.bandi.novel.model.Score;
import com.bandi.novel.model.User;
import com.bandi.novel.service.NovelReplyService;
import com.bandi.novel.service.ScoreService;
import com.bandi.novel.service.UserFavoriteService;
import com.bandi.novel.utils.Define;

/**
 * 소설 관련 restful api 요청
 * 
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
	@Autowired
	private ScoreService scoreService;

	// 즐겨찾기 해제
	@DeleteMapping("/api/unfavorite/{novelId}")
	public ResponseDto<Integer> unfavoriteProc(@PathVariable Integer novelId) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		ResponseDto<Integer> response = userFavoriteService.deleteUserFavorite(principal.getId(), novelId);
		return response;

	}

	// 즐겨찾기 등록
	@PostMapping("/api/favorite/{novelId}")
	public ResponseDto<Integer> favoriteProc(@PathVariable Integer novelId) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		ResponseDto<Integer> response = userFavoriteService.insertUserFavorite(principal.getId(), novelId);
		return response;

	}

	// 댓글 삭제
	@DeleteMapping("/api/reply/{replyId}")
	public ResponseDto<Integer> deleteNovelReplyProc(@PathVariable Integer replyId) {
		ResponseDto<Integer> response = novelReplyService.deleteNovelReplyById(replyId);
		return response;
	}

	// 별점 등록
	@PostMapping("/api/score")
	public ResponseDto<String> scoreSection(@RequestBody Score score) {
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		score.setUserId(principal.getId());
		ResponseDto<String> response = scoreService.scoreSection(score);
		return response;
	}
	
	

}
