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

import com.ssafy.guestbook.model.MemberDto;
import com.ssafy.happyhouse.model.*;
import com.ssafy.happyhouse.model.service.*;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@RestController
@Api("House Controller API V1")
@RequestMapping("/trade")
public class HouseController {

	@Autowired
	private HouseMapService houseMapService;
	
	@ApiOperation(value = "회원목록", notes = "회원의 <big>전체 목록</big>을 반환해 줍니다.")
	@ApiResponses({
		@ApiResponse(code = 200, message = "잘됨"),
		@ApiResponse(code = 404, message = "404"),
		@ApiResponse(code = 500, message = "500")
	})
	@GetMapping(value = "/user", headers = { "Content-type=application/json" })	
	public List<MemberDto> userList() {
//	public @ResponseBody List<MemberDto> userList() {
		return userService.userList();
	}
}
