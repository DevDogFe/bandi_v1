package com.bandi.novel.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bandi.novel.dto.AdminReportDto;
import com.bandi.novel.dto.BoardDetailDto;
import com.bandi.novel.model.BoardFile;
import com.bandi.novel.model.Report;
import com.bandi.novel.model.ReportCategory;
import com.bandi.novel.model.User;
import com.bandi.novel.service.BoardService;
import com.bandi.novel.service.ReportService;
import com.bandi.novel.utils.Define;

@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private ReportService reportService;
	
	@Autowired
	private BoardService boardService;
	
	// 신고페이지
	@GetMapping("/reportPopup/{boardId}")
	public String getReport(Model model, @PathVariable Integer boardId) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		List<ReportCategory> reportCategory = reportService.selectReportCategory();
		model.addAttribute("reportCategory", reportCategory);
		model.addAttribute(boardId);
		return "/board/reportPopup";
	}
	
	// 신고등록
	@PostMapping("/reportPopup")
	public String createReportProc(Report report) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		String content = report.getContent().replaceAll("\r\n", "<br>");
		report.setUserId(principal.getId());
		report.setContent(content);
		reportService.createReport(report);
		return "/board/reportComplete";
	}
	
	// 신고 리스트
	@GetMapping("/reportList")
	public String getReportList(Model model) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		List<AdminReportDto> reportList = reportService.selectReport();
		System.out.println(reportList.toString());
		model.addAttribute("reportList", reportList);
		return "/admin/adminReport";
	}
	
	// 신고 상세보기
	@GetMapping("/reportDetail/{id}")
	public String getReportDetail(@PathVariable Integer id, Model model, HttpServletRequest request, HttpServletResponse response) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		Report report = reportService.selectReportDetailById(id);
		BoardDetailDto boardDetail = boardService.selectBoardDetailById(report.getBoardId());
		List<BoardFile> fileList = boardService.selectFileList(id);
		reportService.updateProceed(id);
		model.addAttribute("report", report);
		model.addAttribute("boardDetail", boardDetail);
		model.addAttribute("fileList", fileList);
		return "/admin/reportDetailPopup";
	}
}
