package com.ssafy.happyhouse.model;

public class NoticeDto {

	private int noticeno; // 게시글 번호 
	private String userid; // 게시글 글쓴이 (관리자로 고정)
	private String subject; // 게시글 제목 
	private String content; // 게시글 내용 
	private String regtime; // 작성 시간 
	private int count; // 조회수 

	public int getNoticeno() {
		return noticeno;
	}

	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegtime() {
		return regtime;
	}

	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}

	public int getCount() {
		return count;
	}
	
	public void setCount(int count) {
		this.count = count;
	}
}
