package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.dto.MemberDto;

public interface MemberDao {
	public List<MemberDto> getMemberList() throws SQLException;
	public int updateMember(int memberno, MemberDto member) throws SQLException;
	public void createMember(MemberDto member) throws SQLException;
	public int deleteMember(int memberno) throws SQLException;
	public MemberDto searchMember(String username) throws SQLException;
	public MemberDto searchMember(int memberno) throws SQLException;
	public String findPassword(String username) throws SQLException;
}