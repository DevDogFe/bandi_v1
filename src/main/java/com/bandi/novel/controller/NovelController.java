package com.bandi.novel.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.bandi.novel.dto.response.NovelDetailDto;
import com.bandi.novel.dto.response.NovelDto;
import com.bandi.novel.model.Contest;
import com.bandi.novel.model.Genre;
import com.bandi.novel.model.Novel;
import com.bandi.novel.model.NovelSection;
import com.bandi.novel.model.ServiceType;
import com.bandi.novel.model.User;
import com.bandi.novel.service.ContestService;
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
	@Autowired
	private ContestService contestService;
	
	/**
	 * @param model
	 * @return 작품 등록 페이지
	 */
	@GetMapping("/novel/registration")
	public String getRegistration(Model model) {
		
		List<Genre> genreList = novelService.selectGenreList();
		List<ServiceType> serviceTypeList = novelService.selectServiceTypeList();
		// 현재 신청 가능한 공모전 리스트 조회
		List<Contest> contestList = contestService.selectContestByDate();
		
		model.addAttribute("genreList", genreList);
		model.addAttribute("serviceTypeList", serviceTypeList);
		model.addAttribute("contestList",contestList);
		
		return "/novel/registrationForm";
	}
	/**
	 * @param model
	 * @return 회차 등록 페이지
	 */
	@GetMapping("/section/registration/{novelId}")
	public String getSectionRegistration(Model model, @PathVariable Integer novelId) {
		
		
		model.addAttribute("novelId", novelId);
		
		
		return "/novel/sectionRegistrationForm";
	}
	
	/**
	 * 작품 등록 프로세스
	 * @param novel
	 * @return 
	 */
	@PostMapping("/novel/registration")
	public String registrationProc(Integer contestId, Novel novel) {
		
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		novel.setUserId(principal.getId());
		novelService.insertNovel(novel);
		
		return "redirect:/pay";
	}
	/**
	 * 회차 등록 프로세스
	 * @param novel
	 * @return 
	 */
	@PostMapping("/section/registration")
	public String selectionRegistrationProc(NovelSection novelSection) {
		novelSection.setCurrentPrice(novelSection.getListPrice());
		
		novelService.insertNovelSelection(novelSection);
		
		return "redirect:/novel/detail/" + novelSection.getNovelId();
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
	
	/**
	 * 소설 조회
	 * @param model
	 * @param novelId
	 * @return
	 */
	@GetMapping("/novel/detail/{novelId}")
	public String getNovelDetail(Model model, @PathVariable Integer novelId) {
		
		NovelDetailDto novelDetailDto = novelService.selectNovelDetailById(novelId);
		List<NovelSection> sectionList = novelService.selectNovelSectionListByNovelId(novelId);
		model.addAttribute("sectionList", sectionList);
		model.addAttribute("detail", novelDetailDto);
		
		return "/novel/novelDetail";
	}
	
	@GetMapping("/section/read/{sectionId}")
	public String getReadSection(Model model, @PathVariable Integer sectionId) {
		
		NovelSection novelSection = novelService.selectNovelSectionById(sectionId);
		model.addAttribute("section", novelSection);
		
		return "/novel/readSection";
	}
	
}
