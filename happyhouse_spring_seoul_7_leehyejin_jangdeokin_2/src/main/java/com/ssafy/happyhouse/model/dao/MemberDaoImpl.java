//package com.ssafy.happyhouse.model.dao;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//import com.ssafy.happyhouse.model.dto.MemberDto;
//import com.ssafy.util.DBUtil;
//
//public class MemberDaoImpl implements MemberDao{
//
//	@Override
//	public List<MemberDto> getMemberList() throws SQLException {
//		List<MemberDto> memberList = new ArrayList<>();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		Connection conn = null;
//		try {
//			conn = DBUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//
//			sql.append("select memberno, username, password, email, phone, address \n");
//			sql.append("from member \n");
//			
//			pstmt = conn.prepareStatement(sql.toString());
//			
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				MemberDto member = new MemberDto();
//				member.setMemberno(rs.getInt("memberno"));
//				member.setUsername(rs.getString("username"));
//				member.setPassword(rs.getString("password"));
//				member.setEmail(rs.getString("email"));
//				member.setPhone(rs.getString("phone"));
//				member.setAddress(rs.getString("address"));
//
//				memberList.add(member);
//			}
//		} finally {
//			DBUtil.close(rs);
//			DBUtil.close(pstmt);
//			DBUtil.close(conn);
//		}
//
//		return memberList;
//	}
////	UPDATE 'your_table'
////	SET col1='value1',
////
////     col2='value2',
////
////     col3='value3',
////
////     ...
////
////     WHERE col0 = 'value0';
//
//	@Override
//	public int updateMember(int memberno, MemberDto member) throws SQLException {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		int result = -1;
//		try {
//			conn = DBUtil.getConnection();
//			StringBuilder updateMember = new StringBuilder();
//			updateMember.append("update member \n");
//			updateMember.append("set email = ?, \n");
//			updateMember.append("address = ?, \n");
//			updateMember.append("phone = ? \n");
//			updateMember.append("where memberno = ?");
//			pstmt = conn.prepareStatement(updateMember.toString());
//			pstmt.setString(1, member.getEmail());
//			pstmt.setString(2, member.getAddress());
//			pstmt.setString(3, member.getPhone());
//			pstmt.setInt(4, memberno);
//			result = pstmt.executeUpdate();
//		} finally {
//			DBUtil.close(pstmt);
//			DBUtil.close(conn);
//		}
//		return result;
//	}
//
//	@Override
//	public void createMember(MemberDto member) throws SQLException {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		try {
//			conn = DBUtil.getConnection();
//			StringBuilder createMember = new StringBuilder();
//			createMember.append("insert into member (username, password, email, address, phone) \n");
//			createMember.append("values(?, ?, ?, ?, ?)");
//			pstmt = conn.prepareStatement(createMember.toString());
//			pstmt.setString(1, member.getUsername());
//			pstmt.setString(2, member.getPassword());
//			pstmt.setString(3, member.getEmail());
//			pstmt.setString(4, member.getAddress());
//			pstmt.setString(5, member.getPhone());
//			pstmt.executeUpdate();
//		} finally {
//			DBUtil.close(pstmt);
//			DBUtil.close(conn);
//		}
//	}
//
//	@Override
//	public int deleteMember(int memberno) throws SQLException {
//		int result = -1;
//		String sql = "delete from member where memberno = ?";
//		Connection conn = DBUtil.getConnection();
//		try (PreparedStatement pstmt = conn.prepareStatement(sql);) {
//			pstmt.setInt(1, memberno);
//			result = pstmt.executeUpdate();
//		}
//		return result;
//	}
//
//	@Override
//	public MemberDto searchMember(String username) throws SQLException {
//		MemberDto member = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		Connection conn = null;
//		try {
//			conn = DBUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//
//			sql.append("select memberno, username, password, email, phone, address \n");
//			sql.append("from member \n");
//			sql.append("where username = ?");
//			pstmt = conn.prepareStatement(sql.toString());
//			pstmt.setString(1, username);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				member = new MemberDto();
//				member.setMemberno(rs.getInt("memberno"));
//				member.setUsername(rs.getString("username"));
//				member.setPassword(rs.getString("password"));
//				member.setEmail(rs.getString("email"));
//				member.setPhone(rs.getString("phone"));
//				member.setAddress(rs.getString("address"));
//			}
//		} finally {
//			DBUtil.close(rs);
//			DBUtil.close(pstmt);
//			DBUtil.close(conn);
//		}
//
//		return member;
//	}
//
//	@Override
//	public MemberDto searchMember(int memberno) throws SQLException {
//		MemberDto member = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		Connection conn = null;
//		try {
//			conn = DBUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//
//			sql.append("select memberno, username, password, email, phone, address \n");
//			sql.append("from member \n");
//			sql.append("where memberno = ?");
//			pstmt = conn.prepareStatement(sql.toString());
//			pstmt.setInt(1, memberno);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				member = new MemberDto();
//				member.setMemberno(rs.getInt("memberno"));
//				member.setUsername(rs.getString("username"));
//				member.setPassword(rs.getString("password"));
//				member.setEmail(rs.getString("email"));
//				member.setPhone(rs.getString("phone"));
//				member.setAddress(rs.getString("address"));
//			}
//		} finally {
//			DBUtil.close(rs);
//			DBUtil.close(pstmt);
//			DBUtil.close(conn);
//		}
//
//		return member;
//	}
//
//	@Override
//	public String findPassword(String username) throws SQLException {
//		String password = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		Connection conn = null;
//		try {
//			conn = DBUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//
//			sql.append("select password \n");
//			sql.append("from member \n");
//			sql.append("where username = ?");
//			pstmt = conn.prepareStatement(sql.toString());
//			pstmt.setString(1, username);
//			rs = pstmt.executeQuery();
//		
//			if (rs.next()) {
//				password = rs.getString("password");
////				member = new MemberDto();
////				member.setMemberno(rs.getInt("memberno"));
////				member.setUsername(rs.getString("username"));
////				member.setPassword(rs.getString("password"));
////				member.setEmail(rs.getString("email"));
////				member.setPhone(rs.getString("phone"));
////				member.setAddress(rs.getString("address"));
//			}
//		} finally {
//			DBUtil.close(rs);
//			DBUtil.close(pstmt);
//			DBUtil.close(conn);
//		}
//
//		return password;
//	}
//}