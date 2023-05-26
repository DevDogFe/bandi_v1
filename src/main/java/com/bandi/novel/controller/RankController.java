package com.bandi.novel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bandi.novel.dto.response.RankPageDto;
import com.bandi.novel.service.RecommendService;
import com.bandi.novel.utils.Define;

/**
 * 베스트 페이지
 * @author 김지현
 *
 */
@Controller
public class RankController {
	
	@Autowired
	private RecommendService recommendService; 
	
	@GetMapping("/best")
	public String getRankPage(Model model, @RequestParam(defaultValue = "0") Integer sort) {
		
		if(sort == Define.SORT_FAVORITE) {
			List<RankPageDto> payNovelSortByFavorite = recommendService.selectRankToFavorite(Define.TYPE_PAY, 10); 
			List<RankPageDto> freeNovelSortByFavorite = recommendService.selectRankToFavorite(Define.TYPE_FREE, 10); 
			List<RankPageDto> contestNovelSortByFavorite = recommendService.selectRankToFavorite(Define.TYPE_CONTEST, 10);
			model.addAttribute("payNovelList", payNovelSortByFavorite);
			model.addAttribute("freeNovelList", freeNovelSortByFavorite);
			model.addAttribute("contestNovelList", contestNovelSortByFavorite);
			
		} else {
			List<RankPageDto> payNovelSortByScore = recommendService.selectRankToScore(Define.TYPE_PAY, 10);
			List<RankPageDto> freeNovelSortByScore = recommendService.selectRankToScore(Define.TYPE_FREE, 10);
			List<RankPageDto> contestNovelSortByScore = recommendService.selectRankToScore(Define.TYPE_CONTEST, 10);
			model.addAttribute("payNovelList", payNovelSortByScore);
			model.addAttribute("freeNovelList", freeNovelSortByScore);
			model.addAttribute("contestNovelList", contestNovelSortByScore);
		}
		
		
		return "/rank/rankPage";
	}
	

}
