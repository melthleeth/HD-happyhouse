package com.ssafy.happyhouse.model.dao;

import java.util.*;
import org.apache.ibatis.annotations.Mapper;
import com.ssafy.happyhouse.model.*;

@Mapper
public interface HouseMapDao {

	List<SidoGugunCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception;
	List<HouseDealDto> getDongInfo(String gugun) throws Exception;
	List<HouseDealDto> getAptInfo(String aptName) throws Exception;
	List<HouseDealDto> getDongInGugun(String gugun) throws Exception;
	List<HouseDealDto> getAptInDong(String dong) throws Exception;
	HouseDealDto getHouseInfo(int no) throws Exception;
}
