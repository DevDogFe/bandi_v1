package com.bandi.novel.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
	
	
	@GetMapping("/registration")
	public String getRegistration(Model model) {
		
		List<Genre> genreList = novelService.selectGenreList();
		List<ServiceType> serviceTypeList = novelService.selectServiceTypeList();
		
		model.addAttribute("genreList", genreList);
		model.addAttribute("serviceTypeList", serviceTypeList);
		
		return "/novel/registrationForm";
	}
	
	@PostMapping("/registration")
	public String registrationProc(Novel novel) {
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		novel.setUserId(principal.getId());
		novelService.insertNovel(novel);
		
		return "redirect:/registration";
	}
	
}
