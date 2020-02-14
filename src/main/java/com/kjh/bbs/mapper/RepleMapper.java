package com.kjh.bbs.mapper;

import java.util.List;

import com.kjh.bbs.dto.RepleVO;

public interface RepleMapper {
	
	public List<RepleVO> getList(int bno);
	public void insert(RepleVO reply);
	public void delete(int rno);
	public RepleVO getReple(int rno);
}
