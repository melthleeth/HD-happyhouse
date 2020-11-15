package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.MemberDto;

public interface MemberService {
	public List<MemberDto> getMemberList() throws Exception;
	public void updateMember(MemberDto member) throws Exception;
	public void createMember(MemberDto member) throws Exception;
	public void deleteMember(int memberno) throws Exception;
	public MemberDto searchbyNameMember(String username) throws Exception;
	public MemberDto searchMember(int memberno) throws Exception;
	public String findPassword(String username) throws Exception;
	
	public MemberDto login(Map<String, String> map) throws Exception;
}