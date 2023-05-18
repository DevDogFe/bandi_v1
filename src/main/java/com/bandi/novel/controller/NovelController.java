package com.bandi.novel.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.bandi.novel.dto.response.NovelDetailDto;
import com.bandi.novel.dto.response.NovelDto;
import com.bandi.novel.dto.response.NovelReplyListDto;
import com.bandi.novel.model.Contest;
import com.bandi.novel.model.Genre;
import com.bandi.novel.model.Novel;
import com.bandi.novel.model.NovelReply;
import com.bandi.novel.model.NovelSection;
import com.bandi.novel.model.ServiceType;
import com.bandi.novel.model.User;
import com.bandi.novel.model.UserFavorite;
import com.bandi.novel.service.NovelReplyService;
import com.bandi.novel.service.ContestService;
import com.bandi.novel.service.NovelService;
import com.bandi.novel.service.UserFavoriteService;
import com.bandi.novel.utils.Define;
import com.bandi.novel.utils.NovelReplyPageUtil;

/**
 * 웹소설관련 컨트롤러
 * 
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
	private NovelReplyService novelReplyService;
	@Autowired
	private ContestService contestService;
	@Autowired
	private UserFavoriteService userFavoriteService;

	/**
	 * @param model
	 * @return 작품 등록 페이지
	 */
	@GetMapping("/novel/registration")
	public String getRegistration(Model model) {

		List<Genre> genreList = novelService.selectGenreList();
		List<ServiceType> serviceTypeList = novelService.selectServiceTypeList();
		/**
		 * @auth 김경은
		 */
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
	 * 
	 * @param novel
	 * @return
	 */
	@PostMapping("/novel/registration")
	public String registrationProc(Integer contestId, Novel novel) {
		
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		novel.setUserId(principal.getId());
		/**
		 * @auth 김경은
		 * novelService의 insertNovel 수정함
		 */
		
		novelService.insertNovel(novel,contestId);
		
		if(novel.getServiceTypeId() == 1) {
			return "redirect:/pay";
		}
		if(novel.getServiceTypeId() == 2) {
			return "redirect:/free";
		}
		
		return "redirect:/contest/list";
		

	}

	/**
	 * 회차 등록 프로세스
	 * 
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
	 * 
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
	 * 
	 * @param model
	 * @param novelId
	 * @return
	 */
	@GetMapping("/novel/detail/{novelId}")
	public String getNovelDetail(Model model, @PathVariable Integer novelId) {

		// 소설 세부 정보
		NovelDetailDto novelDetailDto = novelService.selectNovelDetailById(novelId);
		// 소설 회차 리스트
		List<NovelSection> sectionList = novelService.selectNovelSectionListByNovelId(novelId);
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		// 즐겨찾기 여부
		if (principal != null) {
			boolean isFavorite = userFavoriteService.selectUserFavoriteByUserIdAndNovelId(principal.getId(), novelId);
			model.addAttribute("isFavorite", isFavorite);
		}
		model.addAttribute("sectionList", sectionList);
		model.addAttribute("detail", novelDetailDto);

		return "/novel/novelDetail";
	}

	/**
	 * 글 조회
	 * 
	 * @param model
	 * @param sectionId
	 * @return
	 */
	@GetMapping("/section/read/{sectionId}")
	public String getReadSection(Model model, @PathVariable Integer sectionId,
			@RequestParam(defaultValue = "1") Integer currentPage) {

		NovelSection novelSection = novelService.selectNovelSectionById(sectionId);
		List<NovelReplyListDto> replyList = novelReplyService.selectNovelReplyListBySectionId(sectionId);
		System.out.println(replyList.size());
		model.addAttribute("section", novelSection);

		NovelReplyPageUtil pageUtil = new NovelReplyPageUtil(replyList.size(), 10, currentPage, 5, replyList);
		model.addAttribute("replyList", pageUtil);

		return "/novel/readSection";
	}

	/**
	 * 리플 생성
	 * 
	 * @param novelReply
	 * @return
	 */
	@PostMapping("/novel/reply")
	public String replyProc(NovelReply novelReply) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		novelReply.setUserId(principal.getId());
		novelReplyService.insertNovelReply(novelReply);

		return "redirect:/section/read/" + novelReply.getSectionId();
	}

	

}
