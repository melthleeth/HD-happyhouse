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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.MemberService;
import com.ssafy.happyhouse.model.service.NoticeService;

@Controller
@RequestMapping("/")
public class PageController {
	
	@Autowired
	private MemberService userService;
	
	@GetMapping(value = "/index")
	public String index() {
		return "index";
	}
	
	@GetMapping(value = "/bwrite")
	public String bwrite() {
		return "board/bwrite";
	}
	
	@GetMapping(value = "/qwrite")
	public String qwrite() {
		return "qna/qwrite";
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
			return "error/error";
		}
	}
	@GetMapping(value = "/signup")
	public String signup() {
		return "signup";
	}
	
//	@GetMapping(value = "/login")
//	public String login() {
//		return "user/login";
//	}
	
	@GetMapping(value = "/mypage")
	public String mypage() {
		return "mypage";
	}
	
	@GetMapping(value = "/login")
	public String login() {
		return "index";
	}
	
	@PostMapping(value = "/login")
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session, HttpServletResponse response) {
		try {
			MemberDto memberDto = userService.login(map);
			if(memberDto != null) { // 로그인이 성공하면 메인 페이지로 
				session.setAttribute("userinfo", memberDto);
			} else { // 로그인 정보가 없다면 알림창
				model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
			}
			return "index";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@GetMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
