package com.bandi.novel.repository;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.model.Report;

@Mapper
public interface ReportRepository {
	
	// 신고 접수
	int insert(Report report);
}
