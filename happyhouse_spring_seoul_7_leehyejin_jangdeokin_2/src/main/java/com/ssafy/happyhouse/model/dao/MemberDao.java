package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.MemberDto;

@Mapper
public interface MemberDao {
	public List<MemberDto> getMemberList() throws SQLException;
	
	public void updateMember(MemberDto member) throws SQLException;
	public void createMember(MemberDto member) throws SQLException;
	public void deleteMember(int memberno) throws SQLException;
	public List<MemberDto> searchbyName(String username) throws SQLException;
	
	public String findPassword(String username) throws SQLException;
	public MemberDto login(Map<String, String> map) throws SQLException;
}