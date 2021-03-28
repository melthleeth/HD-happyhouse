package com.ssafy.happyhouse.parse;
import com.ssafy.util.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.*;

public class HappyHouseDAO {
	private static HappyHouseDAO dao = new HappyHouseDAO();
    private static DBUtil_for_parse util = DBUtil_for_parse.getUtil();

    public static HappyHouseDAO getDao() {
        return dao;
    }

    private HappyHouseDAO() {}
    
    public static void insertData (List<HappyHouseDTO> list) throws SQLException {
    	// 1. connection 얻기
        Connection con = util.getConnection();
        con.setAutoCommit(false);
        String sql = "insert into tradingdata (dong, name, regionCode, dealAmount, rentAmount,"
        		+ "buildYear, dealYear, dealMonth, dealDay, area, floor, jibun, type)"
        		+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    	
    		try {
    			for (HappyHouseDTO house : list) {
    				PreparedStatement pstmt = con.prepareStatement(sql);
	    			pstmt.setString(1, house.getDong());
	                pstmt.setString(2, house.getName());
	                pstmt.setString(3, house.getRegionCode());
	                pstmt.setString(4, house.getDealAmount());
	                pstmt.setString(5, house.getRentAmount());
	                pstmt.setString(6, house.getBuildYear());
	                pstmt.setString(7, house.getDealYear());
	                pstmt.setString(8, house.getDealMonth());
	                pstmt.setString(9, house.getDealDay());
	                pstmt.setString(10, house.getArea());
	                pstmt.setString(11, house.getFloor());
	                pstmt.setString(12, house.getJibun());
	                pstmt.setString(13, house.getType());
	                pstmt.executeUpdate();
    			}
    			System.out.println("거래정보 추가 성공");
    		} catch (RuntimeException | SQLException e) {
    			con.rollback();
    			e.printStackTrace();
    		} finally {
    			con.setAutoCommit(true);
    			util.close(con);
    		}
    	
    	System.out.println("data insert 완료");
    }

    
}
