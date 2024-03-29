package com.bandi.novel.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bandi.novel.dto.response.MyFavoriteDto;
import com.bandi.novel.dto.response.PurchaseRecordDto;
import com.bandi.novel.dto.response.RentalRecordDto;
import com.bandi.novel.model.User;
import com.bandi.novel.model.UserGoldCharge;
import com.bandi.novel.service.NovelService;
import com.bandi.novel.service.PayService;
import com.bandi.novel.utils.Define;

/**
 * 유저 정보 관련 컨트롤러
 * @author 김지현
 *
 */
@Controller
public class UserInfoController {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private NovelService novelService;
	@Autowired
	private PayService payService;
	
	// 내정보
	@GetMapping("/myInfo")
	private String getMyInfo(Model model) {
		
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		List<MyFavoriteDto> favoriteList = novelService.selectUserFavoriteNovelList(principal.getId(), 3);
		List<MyFavoriteDto> myNovelList = novelService.selectMyNovels(principal.getId(), 3);
		
		Integer gold = payService.selectUserGold(principal.getId());
		
		List<UserGoldCharge> goldChargeList = payService.selectGoldCharge(principal.getId());
		List<PurchaseRecordDto> purchaseList = payService.selectPurchaseRecord(principal.getId());
		List<RentalRecordDto> rentalList = payService.selectRentalRecord(principal.getId());
		model.addAttribute("purchaseList", purchaseList);
		model.addAttribute("rentalList", rentalList);
		model.addAttribute("gold", gold);
		model.addAttribute("goldChargeList", goldChargeList);
		
		model.addAttribute("favoriteList", favoriteList);
		model.addAttribute("myNovelList", myNovelList);
		
		return "/user/userInfo";
	}
	
	// 소설 구매 내역
	@GetMapping("/purchase")
	public String getPurchaseHistory(Model model) {
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		List<PurchaseRecordDto> purchaseList = payService.selectPurchaseRecord(principal.getId());
		model.addAttribute("purchaseList", purchaseList);
		
		return "/user/purchaseHistory";
	}
	
	// 소설 대여 내역
	@GetMapping("/rental")
	public String getrentalHistory(Model model) {
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		List<RentalRecordDto> rentalList = payService.selectRentalRecord(principal.getId());
		model.addAttribute("rentalList", rentalList);
		
		return "/user/rentalHistory";
	}
	
	// 골드 충전 내역
	@GetMapping("/goldCharge")
	public String getGoldChargeHistory(Model model) {
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		Integer gold = payService.selectUserGold(principal.getId());
		
		List<UserGoldCharge> goldChargeList = payService.selectGoldCharge(principal.getId());
		
		model.addAttribute("gold", gold);
		model.addAttribute("goldChargeList", goldChargeList);
		
		return "/user/goldChargeHistory";
	}
	
	// 내서재 구매한 회차, 대여한 회차 내역
	@GetMapping("/myFavorite")
	public String getUserFavorite(Model model) {
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		List<MyFavoriteDto> favoriteList = novelService.selectUserFavoriteNovelList(principal.getId(), null);
		model.addAttribute("favoriteList", favoriteList);
		
		return "/user/userFavorite";
	}
	
	@GetMapping("/myNovel")
	public String getUserNovel(Model model) {
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		List<MyFavoriteDto> myNovelList = novelService.selectMyNovels(principal.getId(), null);
		model.addAttribute("myNovelList", myNovelList);
		
		return "/user/userNovel";
	}

}
