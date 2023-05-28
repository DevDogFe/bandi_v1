package com.bandi.novel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.bandi.novel.dto.adminNovelUpdateFormDto;
import com.bandi.novel.dto.response.NovelDetailDto;
import com.bandi.novel.dto.response.NovelSearchDto;
import com.bandi.novel.service.AdminService;
import com.bandi.novel.service.NovelService;

@RestController
public class AdminApiController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private NovelService novelService;

	@DeleteMapping("/api/category/{id}")
	public Integer deleteCategoryProc(@PathVariable Integer id) {
		int resultRow = adminService.deleteCategoryById(id);
		return resultRow;
	}

	// 소설 검색
	@GetMapping("/api/novel/{search}")
	public List<NovelSearchDto> getNovelBySearch(@PathVariable String search) {

		List<NovelSearchDto> novelList = novelService.selectNovelListBySearch(search);

		return novelList;
	}

	// 소설 서비스 타입 변경
	@PutMapping("/api/novel/update")
	public int updateNovelServiceType(@RequestBody adminNovelUpdateFormDto dto) {

		int result = novelService.updateNovelListBySearch(dto);

		return result;
	}

	// 소설 삭제
	@DeleteMapping("/api/novel/delete/{novelId}")
	public int deleteNovel(@PathVariable Integer novelId) {

		int result = novelService.deleteNovel(novelId);

		return result;
	}

}
