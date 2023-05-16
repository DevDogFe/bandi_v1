package com.bandi.novel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bandi.novel.model.Faq;
import com.bandi.novel.model.FaqCategory;
import com.bandi.novel.service.FaqService;

/**
 * FAQ Controller
 * @author 효린
 *
 */

@Controller
@RequestMapping("/faq")
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	
	@GetMapping("/list")	
	public String list(Model model) {
		
		List<Faq> faqList = faqService.readAllFaqList();
		List<FaqCategory> faqCategoryList = faqService.readFaqCategory();
		model.addAttribute("faqList", faqList);
		model.addAttribute("faqCategoryList",faqCategoryList);
		
		return "/cs/faqList";
		
	}
	
	@GetMapping("/list/{categoryId}")
	public String faqList(@PathVariable int categoryId, Model model) {
		
		List<Faq> faqList = faqService.readFaqList(categoryId);
		List<FaqCategory> faqCategoryList = faqService.readFaqCategory();
		model.addAttribute("faqList", faqList);		
		model.addAttribute("faqCategoryList",faqCategoryList);
		model.addAttribute("categoryId", categoryId);				
		
		return "/cs/faqList";		
	}
	
	

}
