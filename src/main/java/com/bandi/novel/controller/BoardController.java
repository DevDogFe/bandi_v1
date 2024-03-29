package com.bandi.novel.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bandi.novel.dto.BoardDetailDto;
import com.bandi.novel.dto.BoardDto;
import com.bandi.novel.dto.BoardReplyDto;
import com.bandi.novel.dto.BoardSearchDto;
import com.bandi.novel.dto.CategorySelectDto;
import com.bandi.novel.handler.exception.CustomRestfulException;
import com.bandi.novel.model.BoardReply;
import com.bandi.novel.model.BoardType;
import com.bandi.novel.model.User;
import com.bandi.novel.service.BoardLikeService;
import com.bandi.novel.service.BoardReplyService;
import com.bandi.novel.service.BoardService;
import com.bandi.novel.utils.BoardPageUtil;
import com.bandi.novel.utils.BoardReplyPageUtil;
import com.bandi.novel.utils.Define;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private HttpSession session;
	
	@Autowired
	private BoardLikeService boardLikeService;
	
	@Autowired
	private BoardReplyService boardReplyService;

	/**
	 * 게시물 목록 조회
	 * 
	 * @param model
	 * @param boardTypeId
	 * @return
	 */
	@GetMapping({ "/list/{boardTypeId}", "/list" })
	public String getBoardList(Model model, @PathVariable(required = false) Integer boardTypeId, 
					@RequestParam(defaultValue = "1") Integer currentPage, BoardSearchDto boardSearchDto) {
		List<BoardDto> boardList = null;
		if (boardTypeId == null) {
			boardTypeId = 1;
		}
		if("".equals(boardSearchDto.getKeyword())) {
			boardSearchDto.setKeyword(null);
		} 
		if(boardSearchDto.getCategoryId() == null) {
			boardList = boardService.selectBoardList(boardTypeId);
		} else {
			boardList = boardService.searchList(boardSearchDto);
		}
		List<CategorySelectDto> categoryList = boardService.selectCategory(boardTypeId);
		List<BoardType> boardTypeList = boardService.selectBoardType();
		BoardPageUtil boardPageUtil = new BoardPageUtil(boardList.size(), 10, currentPage, 5, boardList);
		if(boardSearchDto.getCategoryId() != null) {
			model.addAttribute("categoryId", boardSearchDto.getCategoryId());
		}
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("boardList", boardPageUtil);
		model.addAttribute("boardTypeList", boardTypeList);
		model.addAttribute("boardTypeId", boardTypeId);
		return "/board/boardList";
	}


	/**
	 * 게시물 쓰기
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/write/{boardTypeId}")
	public String createBoard(Model model, @PathVariable Integer boardTypeId) {
		List<CategorySelectDto> categoryList = boardService.selectCategory(boardTypeId);

		model.addAttribute("categoryList", categoryList);
		model.addAttribute("boardTypeId", boardTypeId);
		return "/board/boardWrite";
	}

	// 게시물 쓰기
	@PostMapping("/write/{boardTypeId}")
	public String createBoardProc(BoardDto boardDto) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		String content = boardDto.getContent().replaceAll("\r\n", "<br>");
		boardDto.setContent(content);
		boardDto.setUserId(principal.getId());
		boardService.createBoard(boardDto);
		return "redirect:/board/list";
	}

	// 게시물 상세보기 
	@GetMapping("/detail/{id}")
	public String getBoardDetail(HttpServletRequest request, HttpServletResponse response, Model model, 
					@PathVariable Integer id, @RequestParam(defaultValue = "1") Integer currentPage) {
		BoardDetailDto boardDetail = boardService.selectBoardDetailById(id);
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		List<BoardReplyDto> replyList = boardReplyService.selectBoardReplyListByBoardId(id);
		BoardReplyPageUtil replyPageUtil = new BoardReplyPageUtil(replyList.size(), 10, currentPage, 5, replyList);
		if(principal != null) {
			boolean isLike = boardLikeService.selectLikeByUserIdAndBoardId(principal.getId(), id);
			model.addAttribute("isLike", isLike);
		}
		Integer userId = -1;
		if(principal != null) {
			userId = principal.getId();
		} else {
			userId = -1;
		}
		
		Cookie[] cookies = request.getCookies();
		boolean isBoardCookie = false;
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("boardCookie")) {
					isBoardCookie = true;
					if (!cookie.getValue().contains("[" + userId + "_" + id + "]")) {
						cookie.setValue(cookie.getValue() + "[" + userId + "_" + id + "]");
						cookie.setMaxAge(60 * 60 * 24);
						response.addCookie(cookie);
						boardDetail.setViews(boardDetail.getViews() + 1);
						break; 
					} else {
						isBoardCookie = false; 
						break; 
					}
				}
			}
		}
		if (!isBoardCookie) {
			Cookie boardCookie = new Cookie("boardCookie", "[" + userId + "_" + id + "]");
			boardCookie.setMaxAge(60 * 60 * 24);
			boardCookie.setPath("/");
			response.addCookie(boardCookie);
			boardService.boardViewPlus(id);
		}
		boardDetail.setViews(boardDetail.getViews() + 1);
		model.addAttribute("boardDetail", boardDetail);
		model.addAttribute("replyList", replyPageUtil);
		return "/board/boardDetail";
	}

	// 게시물 수정 
	@GetMapping("/update/{id}")
	public String updateBoard(@PathVariable Integer id, Model model) {
		BoardDetailDto boardDetail = boardService.selectBoardDetailById(id);
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		// boardDetail 에서 boardTypeId 가져와서 카테고리 리스트 불러옴
		if(boardDetail.getUserId() != principal.getId()) {
			throw new CustomRestfulException(Define.UNAUTHED, HttpStatus.BAD_REQUEST); 
		}
		List<CategorySelectDto> categoryList = boardService.selectCategory(boardDetail.getBoardTypeId());
		boardDetail.setContent(boardDetail.getContent().replaceAll("<br>", "\r\n"));
		model.addAttribute("boardDetail", boardDetail);
		model.addAttribute("categoryList", categoryList);
		return "/board/boardUpdate";
	}

	// 게시물 수정
	@PostMapping("/updateProc/{id}")
	public String updateBoardProc(BoardDto boardDto) {
		// User principal = (User) session.getAttribute(Define.PRINCIPAL);
		String content = boardDto.getContent().replaceAll("\r\n", "<br>");
		boardDto.setContent(content);
		boardService.updateBoard(boardDto);
		return "redirect:/board/list";
	}

	// 게시물 삭제
	@GetMapping("/delete/{id}")
	public String deleteBoard(@PathVariable Integer id) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		BoardDetailDto boardDto = boardService.selectBoardDetailById(id);
		if(principal.getId() != boardDto.getUserId()) {
			throw new CustomRestfulException(Define.UNAUTHED, HttpStatus.UNAUTHORIZED);
		}
		boardService.deleteBoard(id);
		return "redirect:/board/list";
	}
	
	// 게시물 댓글 쓰기
	@PostMapping("/reply")
	public String boardReplyProc(BoardReply boardReply) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		boardReply.setUserId(principal.getId());
		boardReplyService.insertBoardReply(boardReply);
		String content = boardReply.getContent().replaceAll("\r\n", "<br>");
		boardReply.setContent(content);
		return "redirect:/board/detail/" + boardReply.getBoardId();
	}
	
}
