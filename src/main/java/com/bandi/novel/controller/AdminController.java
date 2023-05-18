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

import com.bandi.novel.dto.AnswerUpdateDto;
import com.bandi.novel.model.Answer;
import com.bandi.novel.model.Question;
import com.bandi.novel.service.AdminService;
import com.bandi.novel.service.QnaService;

/**
 * 관리자 페이지
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
		
	/**
	 * @param model
	 * @return 질문 리스트 전체조회 
	 */
	@GetMapping("/questionList")
	public String list(@RequestParam(name = "proceed", defaultValue = "", required = false)Integer proceed,Model model) {
		
		if (proceed == null) {
			List<Question> questionList = adminService.readAllQuestionList();
			model.addAttribute("questionList", questionList);			
		}else {			
			List<Question> questionList = adminService.readIncompleteQuestionList(proceed);
			model.addAttribute("questionList", questionList);		
		}
		
		return "/admin/questionList";			
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
		if(answer == null) {
			model.addAttribute("answer", null);			
		}else {
			model.addAttribute("answer", answer);			
		}	
		
		return "/admin/questionDetail";			
	}
	
	/**
	 * 답변 등록
	 * @param questionId
	 * @param answer
	 * @return 질문 상세보기
	 */
	@PostMapping("/answer/{questionId}")
	public String answer(@PathVariable Integer questionId, Answer answer) {
		
		// session
		adminService.createAnswer(answer);
		adminService.updateQuestion(questionId, 1);		
		return "redirect:/admin/question/" + questionId;		
	}
	
	@GetMapping("/answer/update/{questionId}")            
	public String getUpdateAnswer(@PathVariable Integer questionId, Model model) {
		
		Question question = qnaService.readQuestionById(questionId);
		Answer answer = qnaService.readAnswerByQuestionId(questionId);
		model.addAttribute("question", question);
		model.addAttribute( "answer", answer);		
		
		return "/admin/answerUpdate";		
	}
	
	@PostMapping("/answer/update/{questionId}")
	public String updateAnswerProc(@PathVariable Integer questionId, AnswerUpdateDto answerUpdateDto) {
	
		adminService.updateAnswerByQuestionId(answerUpdateDto);
		return "redirect:/admin/question/" + questionId;		
	}
	
	@GetMapping("/answer/delete/{questionId}")
	public String deleteAnswer(@PathVariable Integer questionId) {
		
		adminService.deleteAnswer(questionId);	
		adminService.updateQuestion(questionId, 0);
		
		return "redirect:/admin/question/" + questionId;
		
	}
	

}
