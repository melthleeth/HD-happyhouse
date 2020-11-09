package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.simple.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ssafy.happyhouse.model.*;
import com.ssafy.happyhouse.model.service.*;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@RestController
@Api("House Controller API V1")
@RequestMapping("/trade")
public class HouseController2 {

	@Autowired
	private HouseMapService houseMapService;
	
	@GetMapping(value="/sido", headers = {"Content-type=application/json"})
	public List<SidoGugunCodeDto> getSido() throws Exception {
		return houseMapService.getSido();
	}
	
	@GetMapping(value="/sido/{sido}", headers = {"Content-type=application/json"})
	public List<SidoGugunCodeDto> getGugunInSido(@PathVariable String sido) throws Exception {
		return houseMapService.getGugunInSido(sido);
	}
	
	@GetMapping(value="/donginfo/{gugun}", headers = {"Content-type=application/json"})
	public List<HouseDealDto> getDongInfo(@PathVariable String gugun) throws Exception {
		return houseMapService.getDongInfo(gugun);
	}
	
	@GetMapping(value="/apt/{aptName}", headers = {"Content-type=application/json"})
	public List<HouseDealDto> getAptInfo(String aptName) throws Exception {
		return houseMapService.getAptInfo(aptName);
	}
	
	@GetMapping(value="/dong/{gugun}", headers = {"Content-type=application/json"})
	List<HouseDealDto> getDongInGugun(@PathVariable String gugun) throws Exception {
		return houseMapService.getDongInGugun(gugun);
	}
	
	@GetMapping(value="/apt/{dong}", headers = {"Content-type=application/json"})
	List<HouseDealDto> getAptInDong(@PathVariable String dong) throws Exception {
		return houseMapService.getAptInDong(dong);
	}
}
