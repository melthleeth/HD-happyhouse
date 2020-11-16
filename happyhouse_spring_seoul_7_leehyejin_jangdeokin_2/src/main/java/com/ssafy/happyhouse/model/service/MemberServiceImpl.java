package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;

	@Override
	public void createMember(MemberDto member) throws Exception {
		dao.createMember(member);
	}
	
	@Override
	public List<MemberDto> getMemberList() throws Exception {
		return dao.getMemberList();
	}

	@Override
	public MemberDto searchbyNameMember(String username) throws Exception {
		return dao.searchbyNameMember(username);
	}

	@Override
	public MemberDto searchMember(int memberno) throws Exception {
		return dao.searchMember(memberno);
	}

	@Override
	public String findPassword(String username) throws Exception {
		return dao.findPassword(username);
	}
	
	@Override
	public void updateMember(MemberDto member) throws Exception {
		dao.updateMember(member);
	}

	@Override
	public MemberDto login(Map<String, String> map) throws Exception {
		if (map.get("username") == null || map.get("password") == null)
			return null;
		return dao.login(map);
	}

	@Override
	public void deleteMember(int memberno) throws Exception {
		dao.deleteMember(memberno);
	}
}
