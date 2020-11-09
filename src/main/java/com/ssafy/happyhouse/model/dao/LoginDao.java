package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;

import com.ssafy.happyhouse.model.dto.MemberDto;

public interface LoginDao {
	public MemberDto login(String username, String password) throws SQLException;
}