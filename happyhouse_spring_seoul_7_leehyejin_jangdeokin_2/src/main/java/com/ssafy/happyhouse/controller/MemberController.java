package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.MemberService;

@RestController
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@GetMapping(value="/info", headers = {"Content-type=application/json" })
	public List<MemberDto> getMemberList() throws Exception {
		return memberService.getMemberList();
	}
	
	@PutMapping(value="/update", headers = {"Content-type=application/json"})
	public List<MemberDto> updateMember(@RequestBody MemberDto member) throws Exception {
		memberService.updateMember(member);
		return memberService.getMemberList();
	}

	@PostMapping(value="/create", headers = {"Content-type=application/json"})
	public List<MemberDto> createMember(@RequestBody MemberDto member) throws Exception {
		memberService.createMember(member);
		return memberService.getMemberList();
	}

	@DeleteMapping(value="/delete/{memberno}", headers = {"Content-type=application/json"})
	public List<MemberDto> deleteMember(@PathVariable int memberno) throws Exception {
		memberService.deleteMember(memberno);
		return memberService.getMemberList();
	}

	@GetMapping(value="/info/{username}", headers = {"Content-type=application/json"})
	public MemberDto searchMember(@PathVariable String username) throws Exception {
		return memberService.searchMember(username);
	}

	@GetMapping(value="/info/{memberno}", headers = {"Content-type=application/json"})
	public MemberDto searchMember(@PathVariable int memberno) throws Exception {
		return memberService.searchMember(memberno);
	}
	
	@GetMapping(value="/password/{username}", headers = {"Content-type=application/json"})
	public String findPassword(String username) throws Exception {
		return memberService.findPassword(username);
	}
}
