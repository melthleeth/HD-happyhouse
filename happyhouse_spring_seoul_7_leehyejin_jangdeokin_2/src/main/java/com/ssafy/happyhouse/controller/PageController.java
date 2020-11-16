package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.MemberService;

@Controller
@RequestMapping("/")
public class PageController {
	
	@Autowired
	private MemberService userService;
	
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
	public String management(Model model, HttpSession session, HttpServletResponse response) {
		try {
			List<MemberDto> list = userService.getMemberList();
			model.addAttribute("memberlist", list);
			return "member-management";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원 목록을 얻어오는 중 문제가 발생했습니다.");
			return "/error/error";
		}
	}
	@GetMapping(value = "/signup")
	public String signup() {
		return "signup";
	}
	
	@GetMapping(value = "/login")
	public String login() {
		return "user/login";
	}
	
	@PostMapping(value = "/login")
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session, HttpServletResponse response) {
		try {
			MemberDto memberDto = userService.login(map);
			if(memberDto != null) {
				session.setAttribute("userinfo", memberDto);
				
			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			return "error/error";
		}
		return "index";
	}
	
	@GetMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
