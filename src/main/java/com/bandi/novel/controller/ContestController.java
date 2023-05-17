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

import com.bandi.novel.dto.response.ContestNovelDto;
import com.bandi.novel.model.Contest;
import com.bandi.novel.model.ContestNovel;
import com.bandi.novel.model.User;
import com.bandi.novel.service.ContestService;
import com.bandi.novel.utils.Define;

/**
 * 공모전 컨트롤러
 * 
 * @author 김경은
 */
@Controller
public class ContestController {

	@Autowired
	private HttpSession session;

	@Autowired
	private ContestService contestService;

	/**
	 * @param model
	 * @return 공모전 상세 페이지
	 */
	@GetMapping("/contest/detail/{id}")
	public String getContestEntry(@PathVariable Integer id, Model model) {

		return "/contest/contestDetail";
	}

	/**
	 * 
	 * @return 공모전 목록 페이지
	 */
	@GetMapping("/contest/list")
	public String getContestList(Model model) {

		List<Contest> contestList = contestService.selectContestListByLimit();
		List<ContestNovelDto> contestNovelList = contestService.selectContestNovelList();

		model.addAttribute("contestList", contestList);
		model.addAttribute("contestNovelList", contestNovelList);

		return "/contest/contestList";
	}

	/**
	 * 
	 * @return 공모전 등록 페이지
	 */
	@GetMapping("/contest/registration")
	public String getContestRegistration() {

		return "/contest/contestRegistration";
	}

	/**
	 * 공모전 등록 프로세스
	 * 
	 * @param contest
	 * @return
	 */
	@PostMapping("/contest/registration")
	public String registrationProc(Contest contest) {

		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		contest.setUserId(principal.getId());

		contestService.insertContest(contest);

		return "redirect:/contest/list";
	}

	/**
	 * 공모전 삭제 프로세스
	 * 
	 * @return
	 */
	@GetMapping("/contest/delete/{id}")
	public String deleteContestProc(@PathVariable Integer id) {

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
	@PostMapping("/contest/update")
	public String updateContestProc(Contest contest) {

		// User principal = (User)session.getAttribute(Define.PRINCIPAL);
		// contest.setUserId(principal.getId());

		contestService.updateContest(contest);

		return "redirect:/contest/list";
	}

}
