package com.bandi.novel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.bandi.novel.service.AdminService;

@RestController
public class AdminApiController {
	
	@Autowired
	private AdminService adminService;
	
	// 카테고리 삭제
	@DeleteMapping("/api/category/{id}")
	public Integer deleteCategoryProc(@PathVariable Integer id) {
		int resultRow = adminService.deleteCategoryById(id);
		return resultRow;
	}
	
	// 장르 삭제
	@DeleteMapping("/api/genre/{id}")
	public Integer deleteGenreProc(@PathVariable Integer id) {
		int resultRow = adminService.deleteGenreById(id);
		return resultRow;
	}
}
