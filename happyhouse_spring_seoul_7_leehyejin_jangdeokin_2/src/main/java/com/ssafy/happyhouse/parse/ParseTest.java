package com.ssafy.happyhouse.parse;

import java.sql.SQLException;

public class ParseTest {
	// MySQL과 연결하여 데이터 삽입하는 파트
	public static void main(String[] args) throws SQLException {
		// 주의!!!!
		// 실행 전 HappyHouseDAO에서 type 번호 변경 후 실행시킬것!!
		HappyHouseParser parser = new HappyHouseDOMParser();
		HappyHouseDAO houseDAO = HappyHouseDAO.getDao();
		houseDAO.insertData(parser.getData());
	}
}
