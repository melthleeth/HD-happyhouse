package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.*;

public interface HouseMapService {
	
	List<SidoGugunCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception;
	List<HouseDealDto> getDongInGugun(String gugun) throws Exception;
	List<HouseDealDto> getAptInDong(String dong) throws Exception;
	List<HouseDealDto> getDongInfo(String gugun) throws Exception;
	List<HouseDealDto> getAptInfo(String dong) throws Exception;
	HouseDealDto getHouseInfo(int no) throws Exception;
	
}
