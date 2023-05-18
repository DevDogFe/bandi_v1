package com.bandi.novel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bandi.novel.model.User;
import com.bandi.novel.service.UserFavoriteService;
import com.bandi.novel.utils.Define;

@RestController
public class NovelApiController {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private UserFavoriteService userFavoriteService;
	
	@DeleteMapping("/api/unfavorite/{novelId}")
	public Integer unfavoriteProc(@PathVariable Integer novelId) {
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		userFavoriteService.deleteUserFavorite(principal.getId(), novelId);
		return novelId;
		
	}
	
	@PostMapping("/api/favorite/{novelId}")
	public Integer favoriteProc(@PathVariable Integer novelId) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		userFavoriteService.insertUserFavorite(principal.getId(), novelId);
		return novelId;

	}

}
