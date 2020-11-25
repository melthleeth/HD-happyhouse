package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.CommentDto;


public interface CommentService {

	public void writeComment(CommentDto commentDto) throws Exception;
	public List<CommentDto> listComment(int comment_commentno) throws Exception;
	
	public void modifyComment(CommentDto commentDto) throws Exception;
	public void deleteComment(int commentno) throws Exception;
	
}
