package com.bandi.novel.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bandi.novel.model.Report;
import com.bandi.novel.model.ReportCategory;
import com.bandi.novel.model.User;
import com.bandi.novel.service.ReportService;
import com.bandi.novel.utils.Define;

@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private ReportService reportService;
	
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
}
