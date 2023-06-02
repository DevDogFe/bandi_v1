package com.bandi.novel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.bandi.novel.dto.response.ResponseDto;
import com.bandi.novel.model.Faq;
import com.bandi.novel.service.FaqService;

@RestController
public class FaqApiController {

	@Autowired
	private FaqService faqService;

	// FAQ 카테고리 리스트 (효린)
	@GetMapping("/api/faq/{categoryId}")
	public ResponseDto<List<Faq>> getFaqList(@PathVariable Integer categoryId) {

		ResponseDto<List<Faq>> response = null;
		if (categoryId == 0) {
			response = faqService.readAllFaqList();
		} else {
			response = faqService.readFaqList(categoryId);
		}

		return response;
	}

}
