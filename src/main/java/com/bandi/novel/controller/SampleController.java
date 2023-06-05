package com.bandi.novel.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.bandi.novel.dto.AgeGenderRecommendDto;
import com.bandi.novel.dto.response.MainRecommendDto;
import com.bandi.novel.dto.response.NovelDetailDto;
import com.bandi.novel.dto.response.NovleRecordSectionDto;
import com.bandi.novel.dto.response.RankPageDto;
import com.bandi.novel.dto.response.RecommendFavoritesDto;
import com.bandi.novel.dto.response.UserPurchaseRentalRecord;
import com.bandi.novel.model.Contest;
import com.bandi.novel.model.User;
import com.bandi.novel.service.ContestService;
import com.bandi.novel.service.NovelService;
import com.bandi.novel.service.PayService;
import com.bandi.novel.service.RecommendService;
import com.bandi.novel.service.UserFavoriteService;
import com.bandi.novel.service.UserNovelRecordService;
import com.bandi.novel.utils.Define;
import com.bandi.novel.utils.GenerationUtil;

@Controller
public class SampleController {

	@Autowired
	private HttpSession session;
	@Autowired
	private NovelService novelService;
	@Autowired
	private ContestService contestService;
	@Autowired
	private UserFavoriteService userFavoriteService;
	@Autowired
	private UserNovelRecordService userNovelRecordService;
	@Autowired
	private PayService payService;
	@Autowired
	private RecommendService recommendService;
	

	@GetMapping("/index")
	public String sample(Model model) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		if (principal != null) {
			GenerationUtil generationUtil = new GenerationUtil(principal.getGeneration());
			AgeGenderRecommendDto recommendDto = new AgeGenderRecommendDto(principal.getId(), principal.getGender(),
					generationUtil);

			List<MainRecommendDto> ageGenderList = recommendService.selectNovelsByAgeAndGender(recommendDto);

			List<MainRecommendDto> totalRecommendList = recommendService.selectTotalRecommendedNovels(recommendDto);
			model.addAttribute("ageGenderList", ageGenderList);
			model.addAttribute("totalRecommendList", totalRecommendList);

			List<RecommendFavoritesDto> genreList = recommendService.selectNovelByFavoriteGenre(principal.getId());
			model.addAttribute("genreList", genreList);
		}

		return "/index";
	}

	// 템플릿 예시
	@GetMapping("/main")
	public String main(Model model) {

		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		
		
		if (principal != null) {
			
			List<RecommendFavoritesDto> novelByGenreList = recommendService.selectNovelByFavoriteGenre(principal.getId());
			List<MainRecommendDto> totalRecommendList = recommendService
					.selectTotalRecommendedNovels(new AgeGenderRecommendDto(principal.getId(), principal.getGender(),
							new GenerationUtil(principal.getGeneration())));
			model.addAttribute("novelList1", novelByGenreList);
			model.addAttribute("novelList2", totalRecommendList);
		} else {
			List<RankPageDto> payNovelBest = recommendService.selectRankToFavorite(1, 6);
			model.addAttribute("novelList1", payNovelBest);
			
		}
		List<RankPageDto> totalNovelBest = recommendService.selectTotalRankToFavorite(15);
		model.addAttribute("novelList3", totalNovelBest);
		
		
		
		return "/main";
	}

	@GetMapping("/profile")
	public String profile() {

		return "/profile";
	}

	@GetMapping("/streams")
	public String streams() {

		return "/streams";
	}

	@GetMapping("/details")
	public String details() {

		return "/details";
	}

	@GetMapping("/browse")
	public String browse() {

		return "/browse";
	}

	@GetMapping("/error")
	public String handleError() {
		return "/error/notFound";
	}

	@GetMapping("/sample")
	public String getJoinForm() {

		return "/cssTest";
	}

	@GetMapping("/novelList")
	public String getNovelList() {

		return "/cssLayout/cssNovelList";
	}
	
	@GetMapping("/novelDetail/{novelId}")
	public String getNovelDetail(Model model, @PathVariable Integer novelId) {
		
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		// 소설 세부 정보
		NovelDetailDto novelDetailDto = novelService.selectNovelDetailById(novelId);
		// 즐겨찾기 카운트
		Integer favorite = userFavoriteService.selectFavoriteSumByNovelId(novelId);
		// 소설 회차 리스트
		List<NovleRecordSectionDto> sectionList = userNovelRecordService.selectNovelRecord(principal.getId(), novelId);
		// 소설 구매, 대여 여부 리스트
		List<UserPurchaseRentalRecord> paymentList = payService.selectUserPaymentRecord(principal.getId(), novelId);
		
		List<RecommendFavoritesDto> recommendList = recommendService.selectOtherRecommendedNovelByNovelId(novelId);
		

		// 즐겨찾기 여부
		if (principal != null) {
			boolean isFavorite = userFavoriteService.selectUserFavoriteByUserIdAndNovelId(principal.getId(), novelId);
			model.addAttribute("isFavorite", isFavorite);
		}
		model.addAttribute("sectionList", sectionList);
		model.addAttribute("detail", novelDetailDto);
		model.addAttribute("favorite", favorite);
		model.addAttribute("paymentList", paymentList);
		model.addAttribute("recommendList", recommendList);

		return "/cssLayout/cssNovelDetail";
	}

	@GetMapping("/boardList")
	public String getBoardList() {

		return "/cssLayout/cssBoardList";
	}

	@GetMapping("/readSection")
	public String getReadSection() {

		return "/cssLayout/cssReadSection";
	}
	
	@GetMapping("/novelRegistration")
	public String getNovelRegistration() {

		return "/cssLayout/cssNovelRegistration";
	}
	
	@GetMapping("/sectionRegistration")
	public String getSectionRegistration() {

		return "/cssLayout/cssSectionRegistration";
	}
	
	@GetMapping("/userRegistration")
	public String getUserRegistration() {

		return "/cssLayout/cssUserRegistration";
	}

	@GetMapping("/admin")
	public String getAdmin() {
		
		return "/cssLayout/cssAdminPage";
	}

	@GetMapping("/boardDetail")
	public String getDetail() {
		
		return "/cssLayout/cssdetail";
	}

	// 공모전 대문
	@GetMapping("/cssContestNovelList")
	public String getContestNovelList() {
		
		return "/cssLayout/cssContestNovelList";
	}
	
	@GetMapping("/cssContestList")
	public String getContestList() {
		
		return "/cssLayout/cssContestList";
	}
	
	// 공모전 디테일
	@GetMapping("/cssContestDetail/{id}")
	public String getContestDetail(@PathVariable Integer id, Model model) {
		
		Contest contest = contestService.selectContestById(id);
		model.addAttribute("contest",contest);
		
		return "/cssLayout/cssContestDetail";
	}
	
	@GetMapping("/cssContestRegistration")
	public String getContestRegistraion() {
		
		return "/cssLayout/cssContestRegistration";
	}
	
	// 충전 페이지	
	@GetMapping("/cssGoldCharge")
	public String getGoldCharge() {
		
		return "/cssLayout/cssGoldCharge";
	}
	
	@GetMapping("/cssUserPay")
	public String getUserPay() {
		
		return "/cssLayout/cssUserPay";
	}
	
	//	관리자 소설 타입 변경
	@GetMapping("/cssAdminNovelChange")
	public String getAdminNovelChange() {
		
		return "/cssLayout/cssAdminNovelChange";
	}
	
	@GetMapping("/sidebar")
	public String getMypageSidebar() {
		
		return "/cssLayout/cssMypageSidebar";
	}
	
	// 마이페이지 골드 충전 기록
	@GetMapping("/cssMypageGoldRecord")
	public String getMypageGoldRecord(Model model) {
		
		return "/cssLayout/cssMypageGoldRecord";
	}
	
	// 마이페이지 소설 구매 기록
	@GetMapping("/cssMypageNovelPurchase")
	public String getMypageNovelPurchase(Model model) {
		
		return "/cssLayout/cssMypageNovelPurchase";
	}
	
	// 마이페이지 소설 구매 기록
	@GetMapping("/cssMypageNovelRental")
	public String getMypageNovelRental(Model model) {
		
		return "/cssLayout/cssMypageNovelRental";
	}
	
	// 마이페이지 내작품 
	@GetMapping("/cssMypageNovelList")
	public String getMypageNovelList(Model model) {
		
		return "/cssLayout/cssMypageNovelList";
	}
	
	// 마이페이지 즐겨찾기 
	@GetMapping("/cssMypageFavoriteNovel")
	public String getMypageFavoriteNovel(Model model) {
			
		return "/cssLayout/cssMypageFavoriteNovel";
	}
	
	// 마이페이지 내 정보 
	@GetMapping("/cssMypageUserInfo")
	public String getMypageUserInfo(Model model) {
				
		return "/cssLayout/cssMypageUserInfo";
	}
	
	// 마이페이지 내 정보 수정 
	@GetMapping("/cssMypageUserUpdate")
	public String getMypageUserUpdate(Model model) {
					
		return "/cssLayout/cssMypageUserUpdate";
	}
	
	@GetMapping("/cssNovelDetail")
	public String getCssNovelDetail() {
		return "/cssLayout/cssNovelDetail";
	}
	
	@GetMapping("/cssReadSection")
	public String getCssReadSection() {
		return "/cssLayout/cssReadSection";
	}
	
}
	
