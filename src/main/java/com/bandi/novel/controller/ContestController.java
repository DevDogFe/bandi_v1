package com.bandi.novel.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bandi.novel.dto.response.ContestNovelDto;
import com.bandi.novel.dto.response.LastNovelRecordDto;
import com.bandi.novel.dto.response.NovelDetailDto;
import com.bandi.novel.dto.response.NovelReplyListDto;
import com.bandi.novel.dto.response.NovleRecordSectionDto;
import com.bandi.novel.dto.response.SectionDto;
import com.bandi.novel.model.Contest;
import com.bandi.novel.model.Genre;
import com.bandi.novel.model.NovelReply;
import com.bandi.novel.model.User;
import com.bandi.novel.service.ContestService;
import com.bandi.novel.service.NovelReplyService;
import com.bandi.novel.service.NovelService;
import com.bandi.novel.service.UserFavoriteService;
import com.bandi.novel.service.UserNovelRecordService;
import com.bandi.novel.utils.Define;
import com.bandi.novel.utils.NovelPageUtil;
import com.bandi.novel.utils.NovelReplyPageUtil;

/**
 * 공모전 컨트롤러
 * 
 * @author 김경은
 */
@Controller
@RequestMapping("/contest")
public class ContestController {

	@Autowired
	private HttpSession session;
	@Autowired
	private ContestService contestService;
	@Autowired
	private NovelService novelService;
	@Autowired
	private NovelReplyService novelReplyService;
	@Autowired
	private UserNovelRecordService userNovelRecordService;
	@Autowired
	private UserFavoriteService userFavoriteService;

	/**
	 * @param model
	 * @return 공모전 상세 페이지
	 */
	@GetMapping("/detail/{id}")
	public String getContestEntry(@PathVariable Integer id, Model model) {
		
		Contest contest = contestService.selectContestById(id);
		model.addAttribute("contest",contest);

		return "/contest/contestDetail";
	}

	/**
	 * 
	 * @return 공모전 목록 페이지
	 */
	@GetMapping("/list")
	public String getContestList(Model model) {

		User principal = (User) session.getAttribute(Define.PRINCIPAL);

		if (principal == null) {
			return "/index";
		}

		// 공모전
		List<Contest> contestList = contestService.selectContestListByLimit();
		System.out.println(contestList.toString());
		// 공모전 소설
		List<ContestNovelDto> contestNovelList = contestService.selectContestNovelList();
		// 마지막으로 본 소설 조회
		LastNovelRecordDto novelRecord = userNovelRecordService.selectLastNovelRecord(principal.getId());
		if (novelRecord != null) {
			SectionDto novelSection = novelService.selectNovelReadSection(novelRecord.getNovelId(),
					novelRecord.getSectionId());
			model.addAttribute("novelRecord", novelRecord);
			model.addAttribute("section", novelSection);
		}
		//

		model.addAttribute("contestList", contestList);
		model.addAttribute("contestNovelList", contestNovelList);

		return "/contest/contestList";
	}

	/**
	 * 
	 * @return 공모전 등록 페이지
	 */
	@GetMapping("/registration")
	public String getContestRegistration() {

		return "/contest/contestRegistration";
	}

	/**
	 * 공모전 등록 프로세스
	 * 
	 * @param contest
	 * @return
	 */
	@PostMapping("/registration")
	public String registrationProc(Contest contest) {

		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		contest.setUserId(principal.getId());

		contestService.insertContest(contest);

		return "redirect:/contest/list";
	}

	/**
	 * 공모전 삭제
	 * 
	 * @return
	 */
	@GetMapping("/delete/{id}")
	public String deleteContest(@PathVariable Integer id) {

		// User principal = (User)session.getAttribute(Define.PRINCIPAL);
		// contest.setUserId(principal.getId());

		contestService.deleteContestById(id);

		return "redirect:/contest/list";
	}

	/**
	 * 공모전 수정 프로세스
	 * 
	 * @return
	 */
	@PostMapping("/update")
	public String updateContestProc(Contest contest) {

		// User principal = (User)session.getAttribute(Define.PRINCIPAL);
		// contest.setUserId(principal.getId());
		contestService.updateContest(contest);

		return "redirect:/contest/list";
	}

	/**
	 * 공모전 소설 리스트 조회 페이지
	 * 
	 * @return model
	 */
	@GetMapping("/novel/list")
	public String getContestNovelList(Model model, @RequestParam(defaultValue = "1") Integer currentPage, 
			@RequestParam(required = false) Integer genreId, @RequestParam(required = false) String search) {
		
		if("".equals(search)) {
			search = null;
		}
		
		List<ContestNovelDto> contestNovelList = contestService.selectContestNovelListBySearch(genreId,search);
		List<Genre> genreList = novelService.selectGenreList();
		NovelPageUtil novelPageUtil = new NovelPageUtil(contestNovelList,contestNovelList.size(), 20, currentPage, 5);
		model.addAttribute("contestNovelList", novelPageUtil);
		model.addAttribute("serviceType", "공모전");
		model.addAttribute("genreList", genreList);
		model.addAttribute("map", "contest/novel/list");
		
		return "/contest/contestNovelList";
	}

	/**
	 * 공모전 소설 각 회차 리스트 조회 페이지
	 * 
	 * @return model
	 */
	@GetMapping("/novel/detail/{novelId}")
	public String getContestNovelDetail(@PathVariable Integer novelId, Model model) {

		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		
		if(principal == null) {
			return "redirect:/index";
		}
		
		// 소설 세부 정보
		NovelDetailDto novelDetailDto = novelService.selectNovelDetailById(novelId);
		// 소설 회차 리스트
		List<NovleRecordSectionDto> novelSectionList = userNovelRecordService.selectNovelRecord(principal.getId(),
				novelId);
		// 즐겨찾기 여부
		if (principal != null) {
			boolean isFavorite = userFavoriteService.selectUserFavoriteByUserIdAndNovelId(principal.getId(), novelId);
			model.addAttribute("isFavorite", isFavorite);
		}

		model.addAttribute("detail", novelDetailDto);
		model.addAttribute("novelSectionList", novelSectionList);

		return "/contest/contestNovelDetail";
	}

	/**
	 * 공모전 소설 회차 조회 페이지
	 * 
	 * @return model
	 */
	@GetMapping("/novel/read/{novelId}/{sectionId}")
	public String getContestNovelReadSection(HttpServletRequest request, HttpServletResponse response,
			@PathVariable Integer novelId, @PathVariable Integer sectionId,
			@RequestParam(defaultValue = "1") Integer currentPage, Model model) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);

		// 이전글 다음글 기능
		SectionDto novelSection = novelService.selectNovelReadSection(novelId, sectionId);
		//

		// 본 소설 저장 혹은 업데이트
		userNovelRecordService.NovelRecord(principal.getId(), novelId, sectionId);
		//

		List<NovelReplyListDto> replyList = novelReplyService.selectNovelReplyListBySectionId(sectionId);
		NovelReplyPageUtil pageUtil = new NovelReplyPageUtil(replyList.size(), 10, currentPage, 5, replyList);

		// 조회수 올리기(쿠키에 userId와 sectionId 담아서 중복방지)
		Integer userId = -1;
		if (principal != null) {
			userId = principal.getId();
		} 

		Cookie[] cookies = request.getCookies();
		boolean isSectionCookie = false;
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("sectionCookie")) {
					isSectionCookie = true;
					if (!cookie.getValue().contains("[" + userId + "_" + sectionId + "]")) {
						cookie.setValue(cookie.getValue() + "[" + userId + "_" + sectionId + "]");
						System.out.println(cookie.getValue() + "[" + userId + "_" + sectionId + "]");
						cookie.setMaxAge(60 * 60 * 24);
						response.addCookie(cookie);
						novelService.sectionViewsPlus(sectionId);
						novelSection.setViews(novelSection.getViews() + 1);
					}
				}
			}
		}

		if (!isSectionCookie) {
			Cookie sectionCookie = new Cookie("sectionCookie", "[" + userId + "_" + sectionId + "]");
			sectionCookie.setMaxAge(60 * 60 * 24);
			sectionCookie.setPath("/");
			response.addCookie(sectionCookie);
			novelService.sectionViewsPlus(sectionId);
			novelSection.setViews(novelSection.getViews() + 1);
		}
		// 조회수 up 여기까지

		model.addAttribute("section", novelSection);
		model.addAttribute("replyList", pageUtil);

		return "/contest/contestNovelReadSection";
	}

	/**
	 * 공모전 소설 삭제
	 * 
	 * @return
	 */
	@GetMapping("/novel/delete/{id}")
	public String deleteContestNovel(@PathVariable Integer id) {

		// User principal = (User)session.getAttribute(Define.PRINCIPAL);
		// contest.setUserId(principal.getId());

		contestService.deleteContestNovelById(id);

		return "redirect:/contest/list";
	}

	/**
	 * 공모전 소설 회차 삭제
	 * 
	 * @return
	 */
	@GetMapping("/novel/section/delete/{id}")
	public String deleteContestNovelSection(@PathVariable Integer id) {

		// User principal = (User)session.getAttribute(Define.PRINCIPAL);
		// contest.setUserId(principal.getId());
		contestService.deleteContestNovelSectionById(id);

		return "redirect:/contest/list";
	}

	/**
	 * 리플 생성
	 * 
	 * @param novelReply
	 * @return
	 */
	@PostMapping("/novel/reply/{novelId}")
	public String contestReplyProc(@PathVariable Integer novelId, NovelReply novelReply) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		novelReply.setUserId(principal.getId());
		novelReplyService.insertNovelReply(novelReply);

		return "redirect:/contest/novel/read/" + novelId + "/" + novelReply.getSectionId();
	}
}
