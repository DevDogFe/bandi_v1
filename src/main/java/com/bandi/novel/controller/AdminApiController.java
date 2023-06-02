package com.bandi.novel.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.bandi.novel.dto.adminNovelUpdateFormDto;
import com.bandi.novel.dto.response.GenreCountDto;
import com.bandi.novel.dto.response.NovelSearchDto;
import com.bandi.novel.dto.response.ResponseDto;
import com.bandi.novel.model.User;
import com.bandi.novel.service.AccountService;
import com.bandi.novel.service.AdminService;
import com.bandi.novel.service.NovelService;
import com.bandi.novel.utils.Define;

@RestController
public class AdminApiController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private NovelService novelService;
	@Autowired
	private AccountService accountService;

	
	// 카테고리 삭제
	@DeleteMapping("/api/category/{id}")
	public ResponseDto<Integer> deleteCategory(@PathVariable Integer id) {
		ResponseDto<Integer> response = adminService.deleteCategoryById(id);
		return response;
	}

	// 소설 검색
	@GetMapping("/api/novel/{search}")
	public ResponseDto<List<NovelSearchDto>> getNovelSearch(@PathVariable String search) {
		ResponseDto<List<NovelSearchDto>> response = novelService.selectNovelListBySearch(search);
		return response;
	}

	// 소설 서비스 타입 변경
	@PutMapping("/api/novel/update")
	public ResponseDto<Integer> updateNovelServiceType(@RequestBody adminNovelUpdateFormDto dto) {
		ResponseDto<Integer> response = novelService.updateNovelListBySearch(dto);
		return response;
	}

	// 소설 삭제
	@DeleteMapping("/api/novel/delete/{novelId}")
	public ResponseDto<Integer> deleteNovel(@PathVariable Integer novelId) {
		ResponseDto<Integer> response = novelService.deleteNovel(novelId);
		return response;
	}

	
	// 장르 삭제
	@DeleteMapping("/api/genre/{id}")
	public ResponseDto<Integer> deleteGenreProc(@PathVariable Integer id) {
		ResponseDto<Integer> response = adminService.deleteGenreById(id);
		return response;
	}
	
	// 유저롤 수정 
	@PostMapping("/api/userRole")
	public ResponseDto<Integer> updateUserRoleProc(@RequestBody User user) {
		ResponseDto<Integer> response = adminService.updateUserRole(user);
		return response;
	}
	
	/**
	 * @author 김지현
	 * @return 이달 매출과 환불 금액
	 */
	@GetMapping("/api/monthSales")
	public ResponseDto<?> getMonthSales(){
		Map<String, Integer> salesMap = accountService.selectSalesAndRefundOfThisMonth();
		if(salesMap == null) {
			return new ResponseDto<Boolean>(HttpStatus.INTERNAL_SERVER_ERROR, Define.REQUEST_FAIL, false, null);
		}
		return new ResponseDto<Map<String, Integer>>(HttpStatus.OK, Define.REQUEST_SUCCESS, true, salesMap);
	}

	/**
	 * @author 김지현
	 * @return 장르 점유
	 */
	@GetMapping("/api/genre")
	public ResponseDto<?> getGenreCount(){
		List<GenreCountDto> genreCountList = novelService.selectGenreCount();
		if(genreCountList == null) {
			return new ResponseDto<Boolean>(HttpStatus.INTERNAL_SERVER_ERROR, Define.REQUEST_FAIL, false, null);
		}
		return new ResponseDto<List<GenreCountDto>>(HttpStatus.OK, Define.REQUEST_SUCCESS, true,genreCountList);
	}
	
	// faq 삭제
	@DeleteMapping("/api/faq/{id}")
	public ResponseDto<Integer> deleteFaq(@PathVariable List<Integer> id) {
		ResponseDto<Integer> response = adminService.deleteFaq(id);
		return response;
	}
	
}
