package com.bandi.novel.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bandi.novel.dto.ApplicationFromDto;
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
		 * List<Application> applyList = applicationService.readApplicationByUserId(principal.getId());
		 */
		List<Application> application = applicationService.readApplicationByUserId(1);
		model.addAttribute("application", application);

		return "/cs/applicationList";
	}

	@GetMapping("/detail/{id}")
	public String getApplicationDetail(@PathVariable Integer id, Model model) {

		// User principal = (User) session.getAttribute(Define.PRINCIPAL);
		Application application = applicationService.readApplicationById(id);
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
	public String ApplicationProc(ApplicationFromDto applicationFromDto) {

		/*
		 * User principal = (User) session.getAttribute(Define.PRINCIPAL);
		 * application.setUserId(principal.getId());
		 */
		System.out.println(applicationFromDto);
		// 파일 업로드
		MultipartFile file = applicationFromDto.getFile();
		if (file.isEmpty() == false) {
			System.out.println("!111111111");
			if (file.getSize() > Define.MAX_FILE_SIZE) {
				// throw new CustomRestfullException("파일 크기는 20MB이상 클 수 없습니다",
				// HttpStatus.BAD_REQUEST);
				System.out.println("파일크기안됨");
			}
			try {
				System.out.println("2222222222222");
				String saveDirectory = Define.UPLOAD_DIRECTORY;
				File dir = new File(saveDirectory);
				if (dir.exists() == false) {
					dir.mkdirs();
				}
				UUID uuid = UUID.randomUUID();
				String fileName = uuid + "_" + file.getOriginalFilename();
				String uploadPath = Define.UPLOAD_DIRECTORY + File.separator + fileName;
				File destination = new File(uploadPath);
				file.transferTo(destination);
				applicationFromDto.setOriginFilename(file.getOriginalFilename());
				applicationFromDto.setUploadFilename(fileName);
				System.out.println(fileName + " / " + file.getOriginalFilename());

			} catch (Exception e) {
				e.getStackTrace();
			}
		}
		applicationFromDto.setUserId(1);
		System.out.println(applicationFromDto);
		applicationService.createApplication(applicationFromDto);
		return "redirect:/application/list";
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