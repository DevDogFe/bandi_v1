package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.handler.exception.CustomRestfulException;
import com.bandi.novel.model.Report;
import com.bandi.novel.model.ReportCategory;
import com.bandi.novel.repository.ReportCategoryRepository;
import com.bandi.novel.repository.ReportRepository;

@Service
public class ReportService {
	
	@Autowired
	private ReportCategoryRepository reportCategoryRepository;
	
	@Autowired
	private ReportRepository reportRepository;
	
	// 신고게시판 카테고리 조회
	@Transactional
	public List<ReportCategory> selectReportCategory() {
		List<ReportCategory> list = reportCategoryRepository.selectAll();
		return list;
	}
	
	// 신고 등록
	@Transactional
	public void createReport(Report report) {
		int resultRowCount = reportRepository.insert(report);
		if(resultRowCount != 1) {
			throw new CustomRestfulException("요청을 처리할 수 없습니다", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
