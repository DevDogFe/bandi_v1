package com.bandi.novel.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bandi.novel.dto.ApplicationFromDto;
import com.bandi.novel.handler.exception.CustomRestfulException;
import com.bandi.novel.model.Application;
import com.bandi.novel.service.ApplicationService;
import com.bandi.novel.utils.Define;

/**
 * 연재문의
 * 
 * @author 효린
 */
//@MultipartConfig
@Controller
@RequestMapping("/application")
public class ApplicationController {

	@Autowired
	private ApplicationService applicationService;

	/**
	 * @return 연재문의 내역
	 */
	@GetMapping("/list")
	public String getList(Model model) {
		/*
		 * User principal = (User) session.getAttribute(Define.PRINCIPAL);
		 * List<Application> applyList =
		 * applicationService.readApplicationByUserId(principal.getId());
		 */
		List<Application> application = applicationService.selectApplicationByUserId(1);
		model.addAttribute("application", application);

		return "/cs/applicationList";
	}

	@GetMapping("/detail/{id}")
	public String getApplicationDetail(@PathVariable Integer id, Model model) {

		// User principal = (User) session.getAttribute(Define.PRINCIPAL);
		Application application = applicationService.selectApplicationById(id);
		model.addAttribute("application", application);

		return "/cs/applicationDetail";

	}

	/**
	 * @return 연재문의 작성 폼
	 */
	@GetMapping("/write")
	public String getApplication() {

		return "/cs/applicationForm";
	}

	/**
	 * 연재문의 작성
	 * 
	 * @return 연재문의 내역
	 */

	@PostMapping("/write")
	public String applicationProc(ApplicationFromDto applicationFromDto) {

		/*
		 * User principal = (User) session.getAttribute(Define.PRINCIPAL);
		 * application.setUserId(principal.getId());
		 */
		System.out.println(applicationFromDto);
		applicationFromDto.setUserId(1);
		applicationService.insertApplication(applicationFromDto);
		return "redirect:/index";
	}

	/**
	 * 연재문의 글 삭제
	 * 
	 * @param id
	 * @return 연재문의 내역
	 */
	@GetMapping("/delete/{id}")
	public String deleteApplication(@PathVariable Integer id) {

		applicationService.deleteApplication(id);

		return "redirect:/application/list";

	}

}
