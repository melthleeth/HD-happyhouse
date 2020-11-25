package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ssafy.happyhouse.model.CommentDto;
import com.ssafy.happyhouse.model.service.CommentService;

@RestController
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	@PostMapping(value = "/write", headers = { "Content-type=application/json" })
	 public List<CommentDto> write(@RequestBody CommentDto commentDto, Model model) throws Exception {
		commentService.writeComment(commentDto);
		return commentService.listComment(commentDto.getComment_commentno());
	}
	
	
	@GetMapping(value = "/list/{no}", headers = { "Content-type=application/json" })
	public List<CommentDto> list(@PathVariable("no") int comment_commentno, Model model) throws Exception {
		return commentService.listComment(comment_commentno);
	}
	
	@PutMapping(value = "/modify", headers = { "Content-type=application/json" })
	public List<CommentDto> modify(@RequestBody CommentDto commentDto,  Model model) throws Exception {
		commentService.modifyComment(commentDto);
		return commentService.listComment(commentDto.getComment_commentno());
	}
	
	@DeleteMapping(value = "/delete/{commentno}")
	public List<CommentDto> delete(@PathVariable int commentno, Model model) throws Exception {
		commentService.deleteComment(commentno);
		return commentService.listComment(-1);
	}
}
