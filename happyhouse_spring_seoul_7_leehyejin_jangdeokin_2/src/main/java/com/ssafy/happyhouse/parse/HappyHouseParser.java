package com.ssafy.happyhouse.parse;

import java.util.*;

public interface HappyHouseParser {
	String FILE_TYPE1 = "apt_trade.xml"; // public static final이 생략되어있음
	String FILE_TYPE2 = "apt_rent.xml";
	String FILE_TYPE3 = "house_trade.xml";
	String FILE_TYPE4 = "house_rent.xml";
	
	List<HappyHouseDTO> getData();
}
