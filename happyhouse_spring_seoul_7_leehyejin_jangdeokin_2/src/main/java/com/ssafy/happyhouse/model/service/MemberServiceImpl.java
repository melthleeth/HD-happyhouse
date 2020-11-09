package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dao.MemberDao;
import com.ssafy.happyhouse.model.dao.MemberDaoImpl;
import com.ssafy.happyhouse.model.dto.MemberDto;

public class MemberServiceImpl implements MemberService {
	
	private MemberDao MemberDao;
	
	public MemberServiceImpl() {
		MemberDao = new MemberDaoImpl();
	}
	@Override
	public List<MemberDto> getMemberList() throws Exception {
		return MemberDao.getMemberList();
	}

	@Override
	public int updateMember(int memberno, MemberDto member) throws Exception {
		return MemberDao.updateMember(memberno, member);
	}

	@Override
	public void createMember(MemberDto member) throws Exception {
		MemberDao.createMember(member);
	}

	@Override
	public int deleteMember(int memberno) throws Exception {
		return MemberDao.deleteMember(memberno);
	}

	@Override
	public MemberDto searchMember(String username) throws Exception {
		return MemberDao.searchMember(username);
	}

	@Override
	public MemberDto searchMember(int memberno) throws Exception {
		return MemberDao.searchMember(memberno);
	}
	@Override
	public String findPassword(String username) throws Exception {
		return MemberDao.findPassword(username);
	}
}
