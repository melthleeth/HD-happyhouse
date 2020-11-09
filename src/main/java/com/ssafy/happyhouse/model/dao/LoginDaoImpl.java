package com.ssafy.happyhouse.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ssafy.happyhouse.model.dto.MemberDto;
import com.ssafy.util.DBUtil;

public class LoginDaoImpl implements LoginDao {

	@Override
	public MemberDto login(String username, String password) throws SQLException {
		MemberDto memberDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select username, password \n");
			sql.append("from member \n");
			sql.append("where username = ? and password = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if(rs.next()) { // select된 row 있으면! memberDto 객체에 저장
				memberDto = new MemberDto();
				memberDto.setUsername(rs.getString("username"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			memberDto = null;
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}
		return memberDto;
	}

}
