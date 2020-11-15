package com.ssafy.happyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class PageController {
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about() {
		return "about";
	}
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup() {
		return "signup";
	}
	@RequestMapping(value = "/management", method = RequestMethod.GET)
	public String management() {
		return "member-management";
	}
}
