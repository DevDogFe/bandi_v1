package com.bandi.novel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * QnaController
 * @author 효린
 */

@Controller
@RequestMapping("/qna")
public class QnaController {
	
	@GetMapping("/list")
	public String list(Model model) {
		
		return "/cs/qnaList";		
		
	}
	

}
