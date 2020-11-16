package com.ssafy.happyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class PageController {
	
	@GetMapping(value = "/index")
	public String index() {
		return "index";
	}
	@GetMapping(value = "/board")
	public String board() {
		return "board";
	}
	@GetMapping(value = "/qna")
	public String about() {
		return "qna";
	}
	@GetMapping(value = "/management")
	public String management() {
		return "member-management";
	}
	@GetMapping(value = "/signup")
	public String signup() {
		return "signup";
	}
}
