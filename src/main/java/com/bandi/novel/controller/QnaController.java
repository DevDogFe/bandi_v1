package com.bandi.novel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bandi.novel.dto.QnaDto;
import com.bandi.novel.model.FaqCategory;
import com.bandi.novel.service.FaqService;
import com.bandi.novel.service.QnaService;

/**
 * QnaController
 * @author 효린
 */

@Controller
@RequestMapping("/qna")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	@Autowired
	private FaqService faqService;
	
	@GetMapping("/list")
	public String list(Model model) {
		
		List<QnaDto> qnaList = qnaService.readAllQnaList();
		model.addAttribute("qnaList", qnaList);		
		
		return "/cs/qnaList";			
	}
	
	@GetMapping("/write")
	public String getWrite(Model model) {
		
		// session
		List<FaqCategory> faqCategorylist = faqService.readFaqCategory();
		model.addAttribute("faqCategorylist", faqCategorylist);
		
		return "/cs/questionForm";
	}
	
	@PostMapping("/write-proc")
	public String writeProc() {
		
		return "/cs/qnaList";		
	}
	
	
	
	

}
