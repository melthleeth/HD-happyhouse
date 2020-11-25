package com.ssafy.happyhouse.model;

public class CommentDto {

	private int commentno; // 댓글 번호 
	private int comment_commentno; // 게시글 번호 
	private String comment_id; // 댓글 쓴 사람 
	private String comment_content; // 댓글 내용  
	private String comment_regtime; // 댓글 작성 시간 
	
	public int getCommentno() {
		return commentno;
	}
	public void setCommentno(int commentno) {
		this.commentno = commentno;
	}
	public int getComment_commentno() {
		return comment_commentno;
	}
	public void setComment_commentno(int comment_commentno) {
		this.comment_commentno = comment_commentno;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_regtime() {
		return comment_regtime;
	}
	public void setComment_regtime(String comment_regtime) {
		this.comment_regtime = comment_regtime;
	}
}
