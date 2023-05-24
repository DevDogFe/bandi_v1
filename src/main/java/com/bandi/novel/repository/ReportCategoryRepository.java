package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.model.ReportCategory;

@Mapper
public interface ReportCategoryRepository {

	// 신고카테고리 조회
	List<ReportCategory> selectAll();
}
