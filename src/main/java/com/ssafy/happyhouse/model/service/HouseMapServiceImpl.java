package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.*;
import com.ssafy.happyhouse.model.dao.*;

@Service
public class HouseMapServiceImpl implements HouseMapService {
	
	@Autowired
	private HouseMapDao dao;

	@Override
	public List<SidoGugunCodeDto> getSido() throws Exception {
		return dao.getSido();
	}

	@Override
	public List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception {
		return dao.getGugunInSido(sido);
	}

	@Override
	public List<HouseDealDto> getDongInGugun(String gugun) throws Exception {
		return dao.getDongInGugun(gugun);
	}

	@Override
	public List<HouseDealDto> getAptInDong(String dong) throws Exception {
		return dao.getAptInDong(dong);
	}

	@Override
	public List<HouseDealDto> getDongInfo(String dongName) throws Exception {
		return dao.getDongInfo(dongName);
	}

	@Override
	public List<HouseDealDto> getAptInfo(String aptName) throws Exception {
		return dao.getAptInfo(aptName);
	}

	@Override
	public HouseDealDto getHouseInfo(int no) throws Exception {
		return dao.getHouseInfo(no);
	}

}
