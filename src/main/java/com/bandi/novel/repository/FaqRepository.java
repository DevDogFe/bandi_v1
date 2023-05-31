package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.model.Faq;
import com.bandi.novel.model.FaqCategory;

@Mapper
public interface FaqRepository {

	public List<FaqCategory> findCategoryList();

	public List<Faq> findAll();

	public List<Faq> findByCategoryId(Integer id);

	public int insert(Faq faq);

	public int updateFaqById(Integer id);

	// 카테고리 수정
	public int updateCategoryById();
	
	public int deleteFaq(List<Integer> id);
	
	public Faq findById(Integer id);

}
