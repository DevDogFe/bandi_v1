package com.bandi.novel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SampleController {
	
	@GetMapping("/index")
	public String sample() {
		
		return "/index";
	}

	// 템플릿 예시
	@GetMapping("/main")
	public String main() {
		
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
	
}
