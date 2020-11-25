package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.simple.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.ssafy.happyhouse.model.*;
import com.ssafy.happyhouse.model.service.*;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@RestController
@Api("House Controller API V1")
@RequestMapping("/housedata")
public class HouseController {

	@Autowired
	private HouseMapService houseMapService;
	
	//@ResponseBody
	// step 1: 도/광역시 정보 불러오기
	@GetMapping(value="/step1", headers = {"Content-type=application/json"})
	public List<SidoGugunCodeDto> getSido() throws Exception {
		System.out.println("get sido okay, size: " + houseMapService.getSido().size());
		return houseMapService.getSido();
	}

	// step 2: 도/광역시에서 고른 값으로 구/군 정보 불러오기
	@GetMapping(value="/step2/{sido}", headers = {"Content-type=application/json"})
	public List<SidoGugunCodeDto> getGugunInSido(@PathVariable String sido) throws Exception {
		System.out.println("get gugun okay, sido: " + sido + ", " + houseMapService.getGugunInSido(sido).size());
		return houseMapService.getGugunInSido(sido);
	}

	// step 3: 구/군에서 고른 값으로 동 정보 불러오기
	@GetMapping(value="/step3/{gugun}", headers = {"Content-type=application/json"})
	List<HouseDealDto> getDongInGugun(@PathVariable String gugun) throws Exception {
		System.out.println("get dong okay, gugun: " + gugun + ", " + houseMapService.getDongInGugun(gugun).size());
		return houseMapService.getDongInGugun(gugun);
	}

	// step 4 (fin.): 동에 해당하는 정보
	@GetMapping(value="/step4/{dong}", headers = {"Content-type=application/json"})
	List<HouseDealDto> getAptInDong(@PathVariable String dong) throws Exception {
		System.out.println("get final result okay, dong: " + dong + ", " + houseMapService.getAptInDong(dong).size());
		return houseMapService.getAptInDong(dong);
	}
	
	// 상세검색
	// 아파트 이름으로 검색
	@GetMapping(value="/search/apt/{value}", headers = {"Content-type=application/json"})
	public List<HouseDealDto> getAptInfo(@PathVariable String value) throws Exception {
		System.out.println("search by apt name okay, value: " + value);
		return houseMapService.getAptInfo(value);
	}
	
	// 동 이름으로 검색
	@GetMapping(value="/search/dong/{value}", headers = {"Content-type=application/json"})
	public List<HouseDealDto> getDongInfo(@PathVariable String value) throws Exception {
		System.out.println("search by dong name okay, value: " + value);
		return houseMapService.getDongInfo(value);
	}
	
	
	// 매물 상세정보 모달창과 연결
	@GetMapping(value="/modal/{no}", headers = {"Content-type=application/json"})
	public HouseDealDto getHouseInfo(@PathVariable int no) throws Exception {
		return houseMapService.getHouseInfo(no);
	}
	
}
