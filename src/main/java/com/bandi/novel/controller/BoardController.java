package com.bandi.novel.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bandi.novel.dto.BoardDetailDto;
import com.bandi.novel.dto.BoardDto;
import com.bandi.novel.dto.BoardTypeDto;
import com.bandi.novel.dto.CategorySelectDto;
import com.bandi.novel.model.BoardType;
import com.bandi.novel.model.User;
import com.bandi.novel.service.BoardLikeService;
import com.bandi.novel.service.BoardService;
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

	/**
	 * 게시물 목록 조회
	 * 
	 * @param model
	 * @param boardTypeId
	 * @return
	 */
	@GetMapping({ "/list/{boardTypeId}", "/list" })
	public String getBoardList(Model model, @PathVariable(required = false) Integer boardTypeId) {
		if (boardTypeId == null) {
			boardTypeId = 1;
		}
		List<CategorySelectDto> categoryList = boardService.selectCategory(boardTypeId);
		List<BoardType> boardTypeList = boardService.selectBoardType();
		List<BoardDto> boardList = boardService.selectBoardList(boardTypeId);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("list", boardList);
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

	// 게시물 등록
	@PostMapping("/write/{boardTypeId}")
	public String createBoardProc(BoardDto boardDto) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		String content = boardDto.getContent().replaceAll("\r\n", "<br>");
		boardDto.setContent(content);
		boardDto.setUserId(principal.getId());
		boardService.createBoard(boardDto);
		return "redirect:/board/list";
	}

	@GetMapping("/detail/{id}")
	public String getBoardDetail(Model model, @PathVariable Integer id) {
		BoardDetailDto boardDetail = boardService.selectBoardDetailById(id);
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		if(principal != null) {
			boolean isLike = boardLikeService.selectLikeByUserIdAndBoardId(principal.getId(), id);
			model.addAttribute("isLike", isLike);
		}
		model.addAttribute("boardDetail", boardDetail);
		return "/board/boardDetail";
	}

	@GetMapping("/update/{id}")
	public String updateBoard(@PathVariable Integer id, Model model) {
		BoardDetailDto boardDetail = boardService.selectBoardDetailById(id);
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		boardDetail.setContent(boardDetail.getContent().replaceAll("<br>", "\r\n"));
		model.addAttribute("boardDetail", boardDetail);
		return "/board/boardUpdate";
	}

	@PostMapping("/updateProc/{id}")
	public String updateBoardProc(BoardDto boardDto) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		boardService.updateBoard(boardDto);
		return "redirect:/board/list";
	}

	@GetMapping("/delete/{id}")
	public String deleteBoard(@PathVariable Integer id) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		boardService.deleteBoard(id);
		return "redirect:/board/list";
	}

}
