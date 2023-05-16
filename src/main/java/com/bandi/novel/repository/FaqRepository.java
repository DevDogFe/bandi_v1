package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.model.Faq;
import com.bandi.novel.model.FaqCategory;

@Mapper
public interface FaqRepository {
	
	public List<FaqCategory> findCategoryList();
	
	public List<Faq> findAll();	
	public List<Faq> findByCategoryId(int id);	
	

}
