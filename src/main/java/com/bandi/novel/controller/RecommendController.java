package com.bandi.novel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bandi.novel.model.User;
import com.bandi.novel.service.RecommendService;
import com.bandi.novel.utils.Define;

@Controller
public class RecommendController {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private RecommendService recommendService;
	
	@GetMapping("/index")
	public String Recommend(Model model) {
		User principal = (User) session.getAttribute(Define.PRINCIPAL);
		
		return "/index";		
	}
	

}
