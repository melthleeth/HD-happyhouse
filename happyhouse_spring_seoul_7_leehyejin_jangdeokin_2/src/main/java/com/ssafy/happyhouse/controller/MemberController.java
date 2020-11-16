package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.MemberService;

import io.swagger.annotations.ApiOperation;

//http://localhost:9999/vue/swagger-ui.html
@RestController
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;


	@ApiOperation(value = "회원가입 실행", response = String.class)
	@PostMapping(value = "/create")
	public String createMember(MemberDto member, Model model, HttpSession session) throws Exception {
		try {
			memberService.createMember(member);
			return "index";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원 가입 중 문제가 발생했습니다.");
			return "/error/error";
		}

	}
	@ApiOperation(value = "전체 회원정보 가져오기", response = String.class)
	@GetMapping(value = "/info", headers = { "Content-type=application/json" })
	public String getMemberList() throws Exception {
		
		return "member";
	}
	
	@ApiOperation(value = "회원정보 검색 - 회원이름으로", response = MemberDto.class)
	@GetMapping(value = "/info/{username}", headers = { "Content-type=application/json" })
	public MemberDto searchMember(@PathVariable String username) throws Exception {
		return memberService.searchbyNameMember(username);
	}

	@ApiOperation(value = "회원정보 검색 - 회원번호로", response = MemberDto.class)
	@GetMapping(value = "/info/{memberno}", headers = { "Content-type=application/json" })
	public MemberDto searchMember(@PathVariable int memberno) throws Exception {
		return memberService.searchMember(memberno);
	}

	@ApiOperation(value = "비밀번호 찾기 - 회원이름으로", response = String.class)
	@GetMapping(value = "/password/{username}", headers = { "Content-type=application/json" })
	public String findPassword(String username) throws Exception {
		return memberService.findPassword(username);
	}

	@ApiOperation(value = "회원정보 업데이트", response = MemberDto.class)
	@PutMapping(value = "/update", headers = { "Content-type=application/json" })
	public List<MemberDto> updateMember(@RequestParam MemberDto member) throws Exception {
		memberService.updateMember(member);
		return memberService.getMemberList();
	}
	
	@ApiOperation(value = "회원정보 삭제 - 회원번호로", response = MemberDto.class)
	@DeleteMapping(value = "/delete/{memberno}", headers = { "Content-type=application/json" })
	public List<MemberDto> deleteMember(@PathVariable int memberno) throws Exception {
		memberService.deleteMember(memberno);
		return memberService.getMemberList();
	}
}
