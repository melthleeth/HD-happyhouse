package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.happyhouse.model.service.NoticeService;
import com.ssafy.happyhouse.util.PageNavigation;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(NoticeDto noticeDto, Model model, HttpSession session) {
		try {
			noticeService.writeNotice(noticeDto);
			return "/board";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글작성중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@RequestParam Map<String, String> map, Model model) {
		String spp = map.get("spp");
		map.put("spp", spp != null ? spp : "10");//sizePerPage
		try {
			List<NoticeDto> list = noticeService.listNotice(map);
			PageNavigation pageNavigation = noticeService.makePageNavigation(map);
			model.addAttribute("notices", list);
			model.addAttribute("navigation", pageNavigation);
			return "/board";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글목록을 얻어오는 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	@ResponseBody public String modify(@RequestBody NoticeDto noticeDto,  Model model) {
		try {
			noticeService.modifyNotice(noticeDto);
			return "";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글수정중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("deletenoticeno") int noticeno, Model model) {
		try {
			noticeService.deleteNotice(noticeno);
			return "";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글삭제 처리 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
}
