package com.ssafy.happyhouse.model.service;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.CommentDto;
import com.ssafy.happyhouse.model.dao.CommentDao;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private CommentDao dao;

	@Override
	public void writeComment(CommentDto commentDto) throws Exception {
		if(commentDto.getComment_content() == null) {
			throw new Exception();
		}
		dao.writeComment(commentDto);
	}

	@Override
	public List<CommentDto> listComment(int comment_commentno) throws Exception {
		return dao.listComment(comment_commentno);
	}

	@Override
	public void modifyComment(CommentDto commentDto) throws Exception {
		dao.modifyComment(commentDto);
	}

	@Override
	public void deleteComment(int commentno) throws Exception {
		dao.deleteComment(commentno);
	}

}
