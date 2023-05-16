package com.bandi.novel.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bandi.novel.dto.BoardDto;
import com.bandi.novel.dto.CategorySelectDto;
import com.bandi.novel.model.User;
import com.bandi.novel.service.BoardService;
import com.bandi.novel.service.UserService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/list")
	public String getBoardList(Model model, User user) {
		return "/board/boardlist";
	}
	
	@GetMapping("/write")
	public String createBoard(Model model) {
		List<CategorySelectDto> categorylist = boardService.selectCategory();
		model.addAttribute("categorylist", categorylist);
		return "/board/boardwrite";
	}
	
	@PostMapping("/write")
	public String createBoardProc(User user, BoardDto boardDto) {
		
		User principal = userService.loginByUsernameAndPassword(user);
		String content = boardDto.getContent().replaceAll("\r\n", "<br>");
		boardDto.setContent(content);
		boardDto.setUserId(user.getId());
		boardService.createBoard(boardDto);
		return "redirect:/board/boardlist";
	}
}
