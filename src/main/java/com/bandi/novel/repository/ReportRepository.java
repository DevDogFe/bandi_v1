package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.dto.AdminReportDto;
import com.bandi.novel.model.Report;

@Mapper
public interface ReportRepository {
	
	// 신고 접수
	int insert(Report report);
	// 신고 접수 리스트 확인
	List<AdminReportDto> selectAll();
	// 신고 접수 상세보기
	Report selectReportDetailById(Integer id);
	// 신고 접수 확인상태 수정
	int updateProceedById(Integer id);
}
