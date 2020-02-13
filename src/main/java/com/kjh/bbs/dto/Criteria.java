package com.kjh.bbs.dto;

public class Criteria {

	private int page;
	private int perPageNum;

	// 기본 페이지 설정
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}

	// 잘못된 값이 들어오면 기본설정, 아니면 그대로 진행
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum=perPageNum;
	}

	public int getPage() {
		return page;
	}
	
	//
	public int getPageStart() {
		return (this.page-1)*perPageNum;
	}
	public int getPerPageNum() {
		return this.perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
}
