package com.bandi.novel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bandi.novel.model.Faq;
import com.bandi.novel.model.FaqCategory;
import com.bandi.novel.service.FaqService;
import com.bandi.novel.utils.FaqPageUtil;

/**
 * FAQ Controller
 * @author 효린
 */

@Controller
@RequestMapping("/faq")
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	
	/**
	 * @param model
	 * @return FAQ 전체조회
	 */
	@GetMapping({"/list","/list/{categoryId}"})	
	public String list(Model model, @PathVariable(required = false) Integer categoryId, @RequestParam(defaultValue = "1") Integer currentPage) {
		List<Faq> faqList = null;
		if(categoryId == null) {
			faqList = faqService.readAllFaqList().getData();			
		}else {
			faqList = faqService.readFaqList(categoryId).getData();
		}		
		List<FaqCategory> faqCategoryList = faqService.readFaqCategory();
		FaqPageUtil faqPageUtil = new FaqPageUtil(faqList.size(), 10, currentPage, 5, faqList);
		model.addAttribute("faqList", faqList);
		model.addAttribute("faqCategoryList",faqCategoryList);
		model.addAttribute("faqPageUtil", faqPageUtil);
		return "/cs/faqList";		
	}	
}
