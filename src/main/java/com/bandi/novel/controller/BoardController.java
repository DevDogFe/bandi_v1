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
import com.bandi.novel.model.User;
import com.bandi.novel.service.BoardService;
import com.bandi.novel.utils.Define;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private HttpSession session;
	
//	@GetMapping("/list")
//	public String getBoardList(Model model) {
//		List<BoardDto> list = boardService.selectBoardList();
//		List<BoardTypeDto> boardType = boardService.selectBoardType();
//		model.addAttribute("list", list);
//		model.addAttribute("boardType", boardType);
//		return "/board/boardList";
//	}
	@GetMapping("/list")
	public String getBoardList(Model model, @RequestParam(name = "type", defaultValue = "자유", required =false) String type) {
		List<BoardDto> list = boardService.selectBoardList(type);
		System.out.println(type);
		model.addAttribute("list", list);
		return "/board/boardList";
	}
	
	@GetMapping("/write")
	public String createBoard(Model model) {
		List<BoardTypeDto> boardType = boardService.selectBoardType();
		List<CategorySelectDto> categorylist = boardService.selectCategory();
		model.addAttribute("boardType", boardType);
		model.addAttribute("categorylist", categorylist);
		return "/board/boardWrite";
	}
	
	// 게시물 등록
	@PostMapping("/write")
	public String createBoardProc(BoardDto boardDto) {
		User principal = (User)session.getAttribute(Define.PRINCIPAL);
		String content = boardDto.getContent().replaceAll("\r\n", "<br>");
		boardDto.setContent(content);
		boardDto.setUserId(principal.getId());
		boardService.createBoard(boardDto);
		System.out.println(boardDto.toString());
		return "redirect:/board/list";
	}
	
	@GetMapping("/detail/{id}")
	public String getBoardDetail(Model model, @PathVariable int id) {
		BoardDetailDto boardDetail = boardService.selectBoardDetailById(id);
		model.addAttribute("boardDetail", boardDetail);
		return "/board/boardDetail";
	}
	
	@GetMapping("/update/{id}")
	public String updateBoard(@PathVariable int id, Model model) {
		BoardDetailDto boardDetail = boardService.selectBoardDetailById(id);
		boardDetail.setContent(boardDetail.getContent().replaceAll("<br>", "\r\n"));
		model.addAttribute("boardDetail" ,boardDetail);
		return "/board/boardUpdate";
	}
	
	@PostMapping("/updateProc/{id}")
	public String updateBoardProc(BoardDto boardDto) {
		boardService.updateBoard(boardDto);
		return "redirect:/board/list";
	}
	
	@GetMapping("/delete/{id}")
	public String deleteBoard(@PathVariable int id) {
		boardService.deleteBoard(id);
		return "redirect:/board/list";
	}
	
}
