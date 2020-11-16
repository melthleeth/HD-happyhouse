package com.ssafy.happyhouse.controller;

import java.util.Map;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.MemberService;

import io.swagger.annotations.ApiOperation;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private MemberService userService;
	
	@ApiOperation(value = "로그인 default", response = String.class)
	@GetMapping(value = "/login")
	public String login() {
		return "user/login";
	}
	
	@ApiOperation(value = "로그인 - map에 들어온 회원정보로", response = String.class)
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
	
	@ApiOperation(value = "로그아웃 (= 세션 만료)", response = String.class)
	@GetMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
