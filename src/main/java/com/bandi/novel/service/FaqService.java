package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bandi.novel.model.Faq;
import com.bandi.novel.model.FaqCategory;
import com.bandi.novel.repository.FaqRepository;

@Service
public class FaqService {
	
	@Autowired
	private FaqRepository faqRepository;
	
	/**
	 * @return FAQ 전체조회
	 */
	public List<Faq> readAllFaqList(){	
		
		return faqRepository.findAll();
	}
	
	/**
	 * @return FAQ Category 전체 조회
	 */
	public List<FaqCategory> readFaqCategory(){		
		
		return faqRepository.findCategoryList();
	}
	
	/**
	 * @param id
	 * @return Category별 FAQ 조회
	 */
	public List<Faq> readFaqList(int id) {	
		
		return faqRepository.findByCategoryId(id);
	}
	

	
	

}
