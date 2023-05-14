package com.bandi.novel.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.bandi.novel.dto.response.NovelDetailDto;
import com.bandi.novel.dto.response.NovelDto;
import com.bandi.novel.model.Genre;
import com.bandi.novel.model.Novel;
import com.bandi.novel.model.ServiceType;
import com.bandi.novel.model.User;
import com.bandi.novel.service.NovelService;
import com.bandi.novel.utils.Define;

/**
 * 웹소설관련 컨트롤러
 * @author 김지현
 *
 */
@Controller
public class NovelController {

	@Autowired
	private HttpSession session;
	@Autowired
	private NovelService novelService;
	
	/**
	 * @param model
	 * @return 작품 등록 페이지
	 */
	@GetMapping("/registration")
	public String getRegistration(Model model) {
		
		List<Genre> genreList = novelService.selectGenreList();
		List<ServiceType> serviceTypeList = novelService.selectServiceTypeList();
		
		model.addAttribute("genreList", genreList);
		model.addAttribute("serviceTypeList", serviceTypeList);
		
		return "/novel/registrationForm";
	}
	
	/**
	 * 작품 등록 프로세스
	 * @param novel
	 * @return 
	 */
	@PostMapping("/registration")
	public String registrationProc(Novel novel) {
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		novel.setUserId(principal.getId());
		novelService.insertNovel(novel);
		
		return "redirect:/registration";
	}
	
	/**
	 * 유료소설 목록 띄우기
	 * @param model
	 * @return
	 */
	@GetMapping("/pay")
	public String getPayList(Model model) {
		
		 List<NovelDto> payNovelList = novelService.selectPayNovelList();
		 model.addAttribute("novelList", payNovelList);
		 model.addAttribute("serviceType", "유료");
		
		return "/novel/novelList";
	}
	
	@GetMapping("/novel/detail/{id}")
	public String getNovelDetail(Model model, @PathVariable Integer id) {
		
		NovelDetailDto novelDetailDto = novelService.selectNovelDetailById(id);
		model.addAttribute("selectionList", null);
		model.addAttribute("detail", novelDetailDto);
		
		return "/novel/novelDetail";
	}
	
}
