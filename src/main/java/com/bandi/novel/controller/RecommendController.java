package com.bandi.novel.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bandi.novel.dto.response.MainRecommendDto;
import com.bandi.novel.model.User;
import com.bandi.novel.service.RecommendService;
import com.bandi.novel.utils.Define;

@Controller
public class RecommendController {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private RecommendService recommendService;
	
	@GetMapping("/recommend")
	public String Recommend(Model model) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		
		List<MainRecommendDto> genreList = recommendService.selectByFavoriteGenre(principal.getId());		
		model.addAttribute("genreList", genreList);
		
		return "/index";		
	}
	

}
