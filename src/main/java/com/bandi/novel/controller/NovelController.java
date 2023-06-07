package com.bandi.novel.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bandi.novel.dto.AgeGenderRecommendDto;
import com.bandi.novel.dto.response.LastNovelRecordDto;
import com.bandi.novel.dto.response.MainRecommendDto;
import com.bandi.novel.dto.response.NovelDetailDto;
import com.bandi.novel.dto.response.NovelDto;
import com.bandi.novel.dto.response.NovelReplyListDto;
import com.bandi.novel.dto.response.NovleRecordSectionDto;
import com.bandi.novel.dto.response.RecommendFavoritesDto;
import com.bandi.novel.dto.response.SectionDto;
import com.bandi.novel.handler.exception.CustomRestfulException;
import com.bandi.novel.dto.response.UserPurchaseRentalRecord;
import com.bandi.novel.model.Contest;
import com.bandi.novel.model.Genre;
import com.bandi.novel.model.Novel;
import com.bandi.novel.model.NovelReply;
import com.bandi.novel.model.NovelSection;
import com.bandi.novel.model.ServiceType;
import com.bandi.novel.model.User;
import com.bandi.novel.service.ContestService;
import com.bandi.novel.service.NovelReplyService;
import com.bandi.novel.service.NovelService;
import com.bandi.novel.service.PayService;
import com.bandi.novel.service.RecommendService;
import com.bandi.novel.service.UserFavoriteService;
import com.bandi.novel.service.UserNovelRecordService;
import com.bandi.novel.utils.Define;
import com.bandi.novel.utils.GenerationUtil;
import com.bandi.novel.utils.NovelPageUtil;
import com.bandi.novel.utils.NovelReplyPageUtil;

/**
 * 웹소설관련 컨트롤러
 * 
 * @author 김지현
 *
 */
@Controller
public class NovelController {

	@Autowired
	private HttpSession session;
	@Autowired
	private NovelService novelService;
	@Autowired
	private NovelReplyService novelReplyService;
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

	/**
	 * @param model
	 * @return 작품 등록 페이지
	 */
	@GetMapping("/novel/registration")
	public String getRegistration(Model model) {

		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		List<Genre> genreList = novelService.selectGenreList();
		List<ServiceType> serviceTypeList = novelService.selectServiceTypeList();
		/**
		 * @auth 김경은
		 */
		List<Contest> contestList = contestService.selectContestByDate();
		AgeGenderRecommendDto ageGenderRecommendDto = new AgeGenderRecommendDto(principal.getId(), principal.getGender(), new GenerationUtil(principal.getGeneration()));
		List<MainRecommendDto> recommendList = recommendService.selectNovelsByAgeAndGender(ageGenderRecommendDto);

		model.addAttribute("genreList", genreList);
		model.addAttribute("serviceTypeList", serviceTypeList);
		model.addAttribute("contestList", contestList);
		model.addAttribute("recommendList", recommendList);

		return "/novel/registrationForm";
	}

	/**
	 * @param model
	 * @return 회차 등록 페이지
	 */
	@GetMapping("/section/registration/{novelId}")
	public String getSectionRegistration(Model model, @PathVariable Integer novelId) {

		Integer serviceTypeId = novelService.selectServiceTypeByNovelId(novelId);
		model.addAttribute("novelId", novelId);
		model.addAttribute("serviceTypeId", serviceTypeId);

		return "/novel/sectionRegistrationForm";
	}

	/**
	 * 작품 등록 프로세스
	 * 
	 * @param novel
	 * @return
	 */
	@PostMapping("/novel/registration")
	public String registrationProc(Integer contestId, Novel novel) {

		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		novel.setUserId(principal.getId());
		/**
		 * @auth 김경은 novelService의 insertNovel 수정함
		 */

		novelService.insertNovel(novel, contestId);

		if (novel.getServiceTypeId() == 1) {
			return "redirect:/pay";
		}
		if (novel.getServiceTypeId() == 2) {
			return "redirect:/free";
		}

		return "redirect:/contest/list";

	}

	/**
	 * 회차 등록 프로세스
	 * 
	 * @param novel
	 * @return
	 */
	@PostMapping("/section/registration")
	public String selectionRegistrationProc(NovelSection novelSection) {
		novelSection.setRentPrice(novelSection.getListPrice() / 2);

		novelService.insertNovelSelection(novelSection);

		return "redirect:/novel/detail/" + novelSection.getNovelId();
	}

	/**
	 * 유료소설 목록 띄우기
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/pay")
	public String getPayList(Model model, @RequestParam(defaultValue = "1") Integer currentPage,
			@RequestParam(required = false) Integer genreId, @RequestParam(required = false) String search,
			@RequestParam(defaultValue = "default") String sort) {
		if ("".equals(search)) {
			search = null;
		}
		List<NovelDto> payNovelList = novelService.selectPayNovelList(genreId, search, sort);
		List<Genre> genreList = novelService.selectGenreList();
		NovelPageUtil novelPageUtil = new NovelPageUtil(payNovelList.size(), 20, currentPage, 5, payNovelList);
		model.addAttribute("novelList", novelPageUtil);
		model.addAttribute("serviceType", "유료");
		model.addAttribute("genreList", genreList);
		model.addAttribute("map", "pay");
		model.addAttribute("sort", sort);
		return "/novel/novelList";
	}

	/**
	 * 무료소설 목록 띄우기
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/free")
	public String getFreeList(Model model, @RequestParam(defaultValue = "1") Integer currentPage,
			@RequestParam(required = false) Integer genreId, @RequestParam(required = false) String search,
			@RequestParam(defaultValue = "default") String sort) {

		if ("".equals(search)) {
			search = null;
		}

		List<NovelDto> freeNovelList = novelService.selectFreeNovelList(genreId, search, sort);
		List<Genre> genreList = novelService.selectGenreList();
		NovelPageUtil novelPageUtil = new NovelPageUtil(freeNovelList.size(), 20, currentPage, 5, freeNovelList);
		model.addAttribute("novelList", novelPageUtil);
		model.addAttribute("serviceType", "무료");
		model.addAttribute("genreList", genreList);
		model.addAttribute("map", "free");
		model.addAttribute("sort", sort);

		return "/novel/novelList";
	}

	/**
	 * 소설 조회
	 * 
	 * @param model
	 * @param novelId
	 * @return
	 */
	@GetMapping("/novel/detail/{novelId}")
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
		// novelId 기반 추천 리스트
		List<RecommendFavoritesDto> recommendList = recommendService.selectOtherRecommendedNovelByNovelId(novelId);
		// 장르기반 추천리스트
		List<RecommendFavoritesDto> genreList = recommendService.selectNovelByFavoriteGenre(principal.getId());
		// 우측 바에 마지막 으로 본 소설
		LastNovelRecordDto lastNovel = userNovelRecordService.selectLastNovelRecord(principal.getId());
		// 우측바 유저 골드 정보,
		Integer gold = payService.selectUserGold(principal.getId());

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
		model.addAttribute("genreList", genreList);
		model.addAttribute("gold", gold);
		model.addAttribute("lastNovel", lastNovel);

		return "/novel/novelDetail";
	}

	/**
	 * 회차 조회
	 * 
	 * @param model
	 * @param sectionId
	 * @return
	 */
	@GetMapping("/section/read/{novelId}/{sectionId}/{serviceTypeId}")
	public String getReadSection(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable Integer novelId, @PathVariable Integer sectionId, @PathVariable Integer serviceTypeId,
			@RequestParam(defaultValue = "1") Integer currentPage) {

		List<NovelDto> leftList = null;
		if (serviceTypeId == 1) {
			leftList = novelService.selectPayNovelList(null, null, "default");
		} else if (serviceTypeId == 2) {
			leftList = novelService.selectFreeNovelList(null, null, "default");
		}
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		NovelDetailDto novelDetailDto = novelService.selectNovelDetailById(novelId);

		// 결제 여부 확인 !!!!!!! 나중에 변경
		if (serviceTypeId == 1) {
			UserPurchaseRentalRecord userPayment = payService.selectUserPaymentRecordByIds(principal.getId(), novelId,
					sectionId);

			if (userPayment.getPurchaseSectionId() == null && userPayment.getEndRental() == null) {
				// userPay 페이지에 띄울 정보
				NovelSection paySection = novelService.selectNovelSectionById(sectionId);
				int userGold = payService.selectUserGold(principal.getId());
				LastNovelRecordDto lastNovel = userNovelRecordService.selectLastNovelRecord(principal.getId());
				model.addAttribute("paySection", paySection);
				model.addAttribute("gold", userGold);
				model.addAttribute("lastNovel", lastNovel);
				model.addAttribute("serviceTypeId", serviceTypeId);
				return "/pay/userPay";
			}
		}
		// 우측 바에 마지막 으로 본 소설
		LastNovelRecordDto lastNovel = userNovelRecordService.selectLastNovelRecord(principal.getId());

		// 이전글 다음글 기능
		SectionDto novelSection = novelService.selectNovelReadSection(novelId, sectionId);
		//

		// 본 소설 저장 혹은 업데이트
		userNovelRecordService.NovelRecord(principal.getId(), novelId, sectionId);
		//
		
		// 우측바 유저 골드 정보,
		Integer gold = payService.selectUserGold(principal.getId());

		List<NovelReplyListDto> replyList = novelReplyService.selectNovelReplyListBySectionId(sectionId);
		NovelReplyPageUtil pageUtil = new NovelReplyPageUtil(replyList.size(), 10, currentPage, 5, replyList);
		novelSection.setContent(novelSection.getContent().replace("\r\n", "<br>"));
		// 조회수 올리기(쿠키에 userId와 sectionId 담아서 중복방지)
		Integer userId = -1;
		if (principal != null) {
			userId = principal.getId();
		}

		Cookie[] cookies = request.getCookies();
		boolean isSectionCookie = false;
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("sectionCookie")) {
					isSectionCookie = true;
					if (!cookie.getValue().contains("[" + userId + "_" + sectionId + "]")) {
						cookie.setValue(cookie.getValue() + "[" + userId + "_" + sectionId + "]");
						cookie.setMaxAge(60 * 60 * 24);
						response.addCookie(cookie);
						novelService.sectionViewsPlus(sectionId);
						novelSection.setViews(novelSection.getViews() + 1);
					}
				}
			}
		}

		if (!isSectionCookie) {
			Cookie sectionCookie = new Cookie("sectionCookie", "[" + userId + "_" + sectionId + "]");
			sectionCookie.setMaxAge(60 * 60 * 24);
			sectionCookie.setPath("/");
			response.addCookie(sectionCookie);
			novelService.sectionViewsPlus(sectionId);
			novelSection.setViews(novelSection.getViews() + 1);
		}
		// 조회수 up 여기까지

		// section 페이징 처리
		String section = novelSection.getContent();

		int fixLength = 180;

		// 배열의 크기를 구합니다.
		int strArraySize = (int) Math.ceil((double) section.length() / fixLength);

		// 배열을 선언합니다.
		List<String> subStringList = new ArrayList<>();
		// 문자열을 순회하여 특정 길이만큼 분할된 문자열을 배열에 할당합니다.
		for (int startIndex = 0; startIndex < section.length(); startIndex += fixLength) {
			subStringList.add(section.substring(startIndex, Math.min(startIndex + fixLength, section.length())));
		}

		Integer favorite = userFavoriteService.selectFavoriteSumByNovelId(novelId);
		List<RecommendFavoritesDto> genreList = recommendService.selectNovelByFavoriteGenre(principal.getId());
		model.addAttribute("genreList", genreList);
		model.addAttribute("favorite", favorite);
		model.addAttribute("detail", novelDetailDto);
		//
		model.addAttribute("serviceTypeId", serviceTypeId);
		model.addAttribute("numberOfPages", strArraySize);
		model.addAttribute("subStringList", subStringList);

		model.addAttribute("section", novelSection);
		model.addAttribute("replyList", pageUtil);
		// 효린
		List<RecommendFavoritesDto> favoriteList = recommendService.selectOtherRecommendedNovelByNovelId(novelId);
		model.addAttribute("favoriteList", favoriteList);
		model.addAttribute("leftList", leftList);
		
		model.addAttribute("gold", gold);
		model.addAttribute("lastNovel", lastNovel);

		return "/novel/readSection";
	}

	/**
	 * 리플 생성
	 * 
	 * @param novelReply
	 * @return
	 */
	@PostMapping("/novel/reply")
	public String replyProc(NovelReply novelReply, @RequestParam Integer serviceTypeId) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		novelReply.setUserId(principal.getId());
		novelReplyService.insertNovelReply(novelReply);
		
		if (serviceTypeId == Define.TYPE_CONTEST) {
			return "redirect:/contest/novel/read/" + novelReply.getNovelId() + "/" + novelReply.getSectionId();
		} else {
			return "redirect:/section/read/" + novelReply.getNovelId() + "/" + novelReply.getSectionId() + "/"
					+ serviceTypeId;
		}
	}

	/**
	 * 파일 등록
	 * 
	 * @param coverFile
	 * @return
	 */
	@PostMapping("/novel/cover")
	public String coverProc(MultipartFile coverFile, @RequestParam Integer novelId,
			@RequestParam Integer serviceTypeId) {
		MultipartFile file = coverFile;
		if (!file.isEmpty()) {
			if (file.getSize() > Define.MAX_FILE_SIZE) {
				throw new CustomRestfulException("파일의 용량이 20MB를 초과하였습니다.", HttpStatus.BAD_REQUEST);
			}
			try {
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
				novelService.updateCover(novelId, fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (serviceTypeId == Define.TYPE_CONTEST) {
			return "redirect:/contest/novel/detail/" + novelId;
		} else {
			return "redirect:/novel/detail/" + novelId;
		}
	}

}
