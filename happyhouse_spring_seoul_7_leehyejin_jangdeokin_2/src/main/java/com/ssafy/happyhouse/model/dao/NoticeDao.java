package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.NoticeDto;

@Mapper
public interface NoticeDao {

	public void writeNotice(NoticeDto noticeDto) throws SQLException;
	public List<NoticeDto> listNotice(Map<String, Object> map) throws SQLException;
	public int getTotalCount(Map<String, String> map) throws SQLException;
	
	public NoticeDto getNotice(int noticeno) throws SQLException;
	public void modifyNotice(NoticeDto noticeDto) throws SQLException;
	public void deleteNotice(int noticeno) throws SQLException;
	
}
