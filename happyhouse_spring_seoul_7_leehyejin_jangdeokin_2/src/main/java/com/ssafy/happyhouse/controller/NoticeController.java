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
	
	@GetMapping(value = "/qnadetail")
	public String qnadetail(@RequestParam("no") int noticeno, Model model) {
		try {
			System.out.println(noticeno);
			NoticeDto noticeDto = noticeService.getNotice(noticeno);
			model.addAttribute("notice", noticeDto);
			return "/qnadetail";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글 정보를 얻어오는 중 문제가 발생했습니다.");
			return "/error/error";
		}
	}
	
	@RequestMapping(value = "/comment", method = RequestMethod.POST)
	@ResponseBody public String writeComment(@RequestBody NoticeDto noticeDto, Model model) {
		try {
			noticeService.writeNotice(noticeDto);
			return "";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글작성중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	@ResponseBody public String write(@RequestBody NoticeDto noticeDto, Model model) {
		try {
			noticeService.writeNotice(noticeDto);
			return "";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글작성중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@RequestParam Map<String, String> map, Model model) {
		String spp = map.get("spp");
		map.put("spp", spp != null ? spp : "5");//sizePerPage
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
	
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String qna(@RequestParam Map<String, String> map, Model model) {
		String spp = map.get("spp");
		map.put("spp", spp != null ? spp : "5");//sizePerPage
		try {
			List<NoticeDto> list = noticeService.listNotice(map);
			PageNavigation pageNavigation = noticeService.makePageNavigation(map);
			model.addAttribute("notices", list);
			model.addAttribute("navigation", pageNavigation);
			return "/qna";
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
	
	@DeleteMapping(value = "/delete/{delno}")
	@ResponseBody public String delete(@PathVariable("delno") int noticeno, Model model) {
		try {
			noticeService.deleteNotice(noticeno);
			return "";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글삭제 처리 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@GetMapping(value="/modal/{no}", headers = { "Content-type=application/json" })
    @ResponseBody public NoticeDto getNotice(@PathVariable("no") int noticeno) throws Exception {
        return noticeService.getNotice(noticeno);
    }
	
}
