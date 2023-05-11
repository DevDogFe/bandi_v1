package com.bandi.novel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SampleController {
	
	@GetMapping("/index")
	public String sample() {
		
		return "/index";
	}

}
