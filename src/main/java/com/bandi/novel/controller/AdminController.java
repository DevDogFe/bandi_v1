package com.bandi.novel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bandi.novel.model.Question;
import com.bandi.novel.service.FaqService;
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
		
	/**
	 * @param model
	 * @return 질문 리스트 전체조회 (관리자)
	 */
	@GetMapping("/qnaList")
	public String list(Model model) {
		
		List<Question> questionList = qnaService.readAllQuestionList();
		model.addAttribute("questionList", questionList);		
		
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
		
		return "/admin/questionDetail";			
	}

}
