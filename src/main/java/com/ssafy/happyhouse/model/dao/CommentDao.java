package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.CommentDto;

@Mapper
public interface CommentDao {

	public void writeComment(CommentDto commentDto) throws SQLException;
	public List<CommentDto> listComment(int comment_commentno) throws SQLException;
	public void modifyComment(CommentDto commentDto) throws SQLException;
	public void deleteComment(int commentno) throws SQLException;
	
}
