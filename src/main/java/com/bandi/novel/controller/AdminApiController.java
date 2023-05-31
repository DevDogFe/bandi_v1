package com.bandi.novel.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.bandi.novel.model.Faq;
import com.bandi.novel.model.User;
import com.bandi.novel.service.AccountService;
import com.bandi.novel.service.AdminService;
import com.bandi.novel.service.FaqService;
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
	@Autowired
	private FaqService faqService;

	
	// 카테고리 삭제
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

	
	// 장르 삭제
	@DeleteMapping("/api/genre/{id}")
	public Integer deleteGenreProc(@PathVariable Integer id) {
		int resultRow = adminService.deleteGenreById(id);
		return resultRow;
	}
	
	// 유저롤 수정 
	@PostMapping("/api/userRole")
	public Integer updateUserRoleProc(@RequestBody User user) {
		int userRolse = adminService.updateUserRole(user);
		System.out.println(user.toString());
		return userRolse;
	}
	
	/**
	 * @author 김지현
	 * @return 이달 매출과 환불 금액
	 */
	@GetMapping("/api/monthSales")
	public ResponseDto<?> getMonthSales(){
		Map<String, Integer> salesMap = accountService.selectSalesAndRefundOfThisMonth();
		if(salesMap == null) {
			return new ResponseDto<Boolean>(500, "50000", Define.REQUEST_FAIL, "50000", null);
		}
		
		return new ResponseDto<Map<String, Integer>>(200, "20000", Define.REQUEST_SUCCESS, "20000", salesMap);
	}

	/**
	 * @author 김지현
	 * @return 장르 점유
	 */
	@GetMapping("/api/genre")
	public ResponseDto<?> getGenreCount(){
		List<GenreCountDto> genreCountList = novelService.selectGenreCount();
		if(genreCountList == null) {
			return new ResponseDto<Boolean>(500, "50000", Define.REQUEST_FAIL, "50000", null);
		}
		return new ResponseDto<List<GenreCountDto>>(200, "20000", Define.REQUEST_SUCCESS, "20000", genreCountList);
	}
	// FAQ 카테고리 리스트 (효린)
	@GetMapping("/api/faq/{categoryId}")
	public List<Faq> getFaqList(@PathVariable Integer categoryId){
		
		List<Faq> list = null;
		if(categoryId == 0) {
			list = faqService.readAllFaqList();
		}else {			
			list = faqService.readFaqList(categoryId);
		}
		return list;
	}
	
	@DeleteMapping("/api/faq/{id}")
	public void deleteFaq(@PathVariable List<Integer> id) {
		adminService.deleteFaq(id);
		/*
		 * id.forEach((i)->{ System.out.println(i); });
		 */
	}
	
}
