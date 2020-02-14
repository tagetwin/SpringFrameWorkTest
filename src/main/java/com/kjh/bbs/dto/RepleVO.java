package com.kjh.bbs.dto;

import java.util.Date;

public class RepleVO {

	private int rno;
	private String writer;
	private String content;
	private Date regDate;
	private int bno;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	@Override
	public String toString() {
		return "RepleVO [rno=" + rno + ", writer=" + writer + ", content=" + content + ", regDate=" + regDate + ", bno="
				+ bno + "]";
	}
}
