package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.MemberDto;

public interface MemberService {
	public List<MemberDto> getMemberList() throws Exception;
	public int updateMember(int memberno, MemberDto member) throws Exception;
	public void createMember(MemberDto member) throws Exception;
	public int deleteMember(int memberno) throws Exception;
	public MemberDto searchMember(String username) throws Exception;
	public MemberDto searchMember(int memberno) throws Exception;
	public String findPassword(String username) throws Exception;
}