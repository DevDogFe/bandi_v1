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
import com.bandi.novel.service.NovelService;
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
	public ResponseDto<Boolean> unfavoriteProc(@PathVariable Integer novelId) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		userFavoriteService.deleteUserFavorite(principal.getId(), novelId);
		return new ResponseDto<Boolean>(200, "20000", Define.REQUEST_SUCCESS, "20000", true);

	}

	// 즐겨찾기 등록
	@PostMapping("/api/favorite/{novelId}")
	public ResponseDto<Boolean> favoriteProc(@PathVariable Integer novelId) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		userFavoriteService.insertUserFavorite(principal.getId(), novelId);
		return new ResponseDto<Boolean>(200, "20000", Define.REQUEST_SUCCESS, "20000", true);

	}

	// 댓글 삭제
	@DeleteMapping("/api/reply/{replyId}")
	public ResponseDto<Boolean> deleteNovelReplyProc(@PathVariable Integer replyId) {
		novelReplyService.deleteNovelReplyById(replyId);
		return new ResponseDto<Boolean>(200, "20000", Define.REQUEST_SUCCESS, "20000", true);
	}

	// 별점 등록
	@PostMapping("/api/score")
	public ResponseDto<?> scoreSection(@RequestBody Score score) {
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		score.setUserId(principal.getId());
		scoreService.scoreSection(score);
		System.out.println(score);
		return new ResponseDto<Score>(200, "200000", "ok", "200000", score);
	}
	
	

}
