package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ssafy.happyhouse.model.dao.MemberDao;
import com.ssafy.happyhouse.model.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao dao;
	
//	public MemberServiceImpl() {
//		MemberDao = new MemberDaoImpl();
//	}
	@Override
	public List<MemberDto> getMemberList() throws Exception {
		return dao.getMemberList();
	}

	@Override
	public int updateMember(int memberno, MemberDto member) throws Exception {
		return dao.updateMember(memberno, member);
	}

	@Override
	public void createMember(MemberDto member) throws Exception {
		dao.createMember(member);
	}

	@Override
	public int deleteMember(int memberno) throws Exception {
		return dao.deleteMember(memberno);
	}

	@Override
	public MemberDto searchMember(String username) throws Exception {
		return dao.searchMember(username);
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
	public MemberDto login(Map<String, String> map) throws Exception{
		if (map.get("username") == null || map.get("password") == null) return null;
		return dao.login(map);
	}
}
