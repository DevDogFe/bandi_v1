package com.bandi.novel.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bandi.novel.dto.AgeGenderRecommendDto;
import com.bandi.novel.dto.response.MainRecommendDto;
import com.bandi.novel.dto.response.RankPageDto;
import com.bandi.novel.dto.response.RecommendFavoritesDto;
import com.bandi.novel.model.User;
import com.bandi.novel.service.RecommendService;
import com.bandi.novel.utils.Define;
import com.bandi.novel.utils.GenerationUtil;

@Controller
public class SampleController {

	@Autowired
	private HttpSession session;
	@Autowired
	private RecommendService recommendService;

	@GetMapping("/index")
	public String sample(Model model) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		if (principal != null) {
			GenerationUtil generationUtil = new GenerationUtil(principal.getGeneration());
			AgeGenderRecommendDto recommendDto = new AgeGenderRecommendDto(principal.getId(), principal.getGender(),
					generationUtil);

			List<MainRecommendDto> ageGenderList = recommendService.selectNovelsByAgeAndGender(recommendDto);

			List<MainRecommendDto> totalRecommendList = recommendService.selectTotalRecommendedNovels(recommendDto);
			model.addAttribute("ageGenderList", ageGenderList);
			model.addAttribute("totalRecommendList", totalRecommendList);

			List<RecommendFavoritesDto> genreList = recommendService.selectNovelByFavoriteGenre(principal.getId());
			model.addAttribute("genreList", genreList);
		}

		return "/index";
	}

	// 템플릿 예시
	@GetMapping("/main")
	public String main(Model model) {

		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		
		
		if (principal != null) {
			
			List<RecommendFavoritesDto> novelByGenreList = recommendService.selectNovelByFavoriteGenre(principal.getId());
			List<MainRecommendDto> totalRecommendList = recommendService
					.selectTotalRecommendedNovels(new AgeGenderRecommendDto(principal.getId(), principal.getGender(),
							new GenerationUtil(principal.getGeneration())));
			model.addAttribute("novelList1", novelByGenreList);
			model.addAttribute("novelList2", totalRecommendList);
		} else {
			List<RankPageDto> payNovelBest = recommendService.selectRankToFavorite(1, 6);
			model.addAttribute("novelList1", payNovelBest);
			
		}
		List<RankPageDto> totalNovelBest = recommendService.selectTotalRankToFavorite(15);
		model.addAttribute("novelList3", totalNovelBest);
		return "/main";
	}

	@GetMapping("/profile")
	public String profile() {

		return "/profile";
	}

	@GetMapping("/streams")
	public String streams() {

		return "/streams";
	}

	@GetMapping("/details")
	public String details() {

		return "/details";
	}

	@GetMapping("/browse")
	public String browse() {

		return "/browse";
	}

	@GetMapping("/error")
	public String handleError() {
		return "/error/notFound";
	}

	@GetMapping("/sample")
	public String getJoinForm() {

		return "/cssTest";
	}

	@GetMapping("/novelList")
	public String getNovelList() {

		return "/cssLayout/cssNovelList";
	}

	@GetMapping("/boardList")
	public String getBoardList() {

		return "/cssLayout/cssBoardList";
	}
}
