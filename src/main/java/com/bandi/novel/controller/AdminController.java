package com.bandi.novel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bandi.novel.dto.AnswerUpdateDto;
import com.bandi.novel.model.Answer;
import com.bandi.novel.model.Application;
import com.bandi.novel.model.Question;
import com.bandi.novel.service.AdminService;
import com.bandi.novel.service.ApplicationService;
import com.bandi.novel.service.QnaService;

/**
 * 관리자 페이지 
 * (Q&A, 연재문의, FAQ) 
 * @author 효린
 *
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private QnaService qnaService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private ApplicationService applicationService;

	/**
	 * @param model
	 * @return 질문 리스트 전체조회
	 */
	@GetMapping("/qnaList")
	public String qnaPage(@RequestParam(name = "proceed", defaultValue = "-1", required = false) String proceed, Model model) {

		List<Question> questionList = null;
		questionList = adminService.readAllQuestionList();
		model.addAttribute("questionList", questionList);
		return "/admin/questionList";
	}

	/**
	 * 비동기 통신 처리
	 * @return 질문 리스트 (전체)조회
	 */
	@GetMapping("/api/qnaList")
	@ResponseBody
	public List<Question> list(String proceed) {

		List<Question> questionList = null;
		if (proceed.equals("-1") || proceed.equals("")) {
			questionList = adminService.readAllQuestionList();
		} else {
			// 데이터 타입 변경
			questionList = adminService.readIncompleteQuestionList(Integer.parseInt(proceed));
		}
		return questionList;
	}

	/**
	 * @param id
	 * @param model
	 * @return 질문상세보기
	 */
	@GetMapping("/question/{id}")
	public String getQuestion(@PathVariable Integer id, Model model) {

		Question question = qnaService.readQuestionById(id);
		model.addAttribute("question", question);

		Answer answer = qnaService.readAnswerByQuestionId(id);
		if (answer == null) {
			model.addAttribute("answer", null);
		} else {
			model.addAttribute("answer", answer);
		}
		return "/admin/questionDetail";
	}

	/**
	 * 답변 등록
	 * 
	 * @param questionId
	 * @param answer
	 * @return 질문 상세보기
	 */
	@PostMapping("/answer/{questionId}")
	public String answer(@PathVariable Integer questionId, Answer answer) {

		adminService.createAnswer(answer, 1);
		adminService.updateQuestion(questionId, 1);
		return "redirect:/admin/question/" + questionId;
	}

	/**
	 * @param questionId
	 * @param model
	 * @return 답변 수정 폼
	 */
	@GetMapping("/answer/update/{questionId}")
	public String getUpdateAnswer(@PathVariable Integer questionId, Model model) {

		Question question = qnaService.readQuestionById(questionId);
		Answer answer = qnaService.readAnswerByQuestionId(questionId);
		model.addAttribute("question", question);
		model.addAttribute("answer", answer);

		return "/admin/answerUpdate";
	}

	/**
	 * 답변 수정
	 * 
	 * @param questionId
	 * @param answerUpdateDto
	 * @return 질문 상세보기
	 */
	@PostMapping("/answer/update/{questionId}")
	public String updateAnswerProc(@PathVariable Integer questionId, AnswerUpdateDto answerUpdateDto) {

		adminService.updateAnswerByQuestionId(answerUpdateDto);
		return "redirect:/admin/question/" + questionId;
	}

	/**
	 * 답변삭제
	 * 
	 * @param questionId
	 * @return 질문 상세보기
	 */
	@GetMapping("/answer/delete/{questionId}")
	public String deleteAnswer(@PathVariable Integer questionId) {

		adminService.deleteAnswer(questionId);
		adminService.updateQuestion(questionId, 0);
		return "redirect:/admin/question/" + questionId;
	}

	/**
	 * @param model
	 * @return 연재문의글 전체조회
	 */
	@GetMapping("/applicationList")
	public String getApplicationList(Model model) {

		List<Application> applicationList = applicationService.readAllApplication();
		model.addAttribute("applicationList", applicationList);

		return "/admin/applicationList";
	}

	/**
	 * @param id
	 * @param model
	 * @return 연재글 상세조회
	 */
	@GetMapping("/applicationDetail/{id}")
	public String getApplicationdetail(@PathVariable Integer id, Model model) {

		Application application = applicationService.readApplicationById(id);
		model.addAttribute("application", application);

		return "/admin/applicationDetail";
	}
	
	@GetMapping("/adminReport")
	public String getAdminReport() {
		
		return "/admin/adminForm";
	}

}
