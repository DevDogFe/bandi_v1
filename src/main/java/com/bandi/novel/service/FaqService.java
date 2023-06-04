package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.bandi.novel.dto.response.ResponseDto;
import com.bandi.novel.model.Faq;
import com.bandi.novel.model.FaqCategory;
import com.bandi.novel.repository.FaqRepository;
import com.bandi.novel.utils.Define;

@Service
public class FaqService {
	
	@Autowired
	private FaqRepository faqRepository;
	
	/**
	 * @return FAQ 전체조회
	 */
	public ResponseDto<List<Faq>> selectAllFaqList(){	
		List<Faq> list = faqRepository.selectAll(); 
		
		return new ResponseDto<List<Faq>>(HttpStatus.OK, Define.REQUEST_SUCCESS, true, list);
	}
	
	/**
	 * @return FAQ Category 전체 조회
	 */
	public List<FaqCategory> selectFaqCategory(){		
		
		return faqRepository.selectCategoryList();
	}
	
	/**
	 * @param id
	 * @return Category별 FAQ 조회
	 */
	public ResponseDto<List<Faq>> selectFaqList(int id) {	
		
		List<Faq> list = faqRepository.selectByCategoryId(id);
		
		return new ResponseDto<List<Faq>>(HttpStatus.OK, Define.REQUEST_SUCCESS, true, list);
	}

}
