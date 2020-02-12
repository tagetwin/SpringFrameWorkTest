package com.kjh.bbs.service;

import java.util.List;

import com.kjh.bbs.dto.BoardVO;

// 동시에 일어나는 쿼리 실행들을 (증감) 적어준다. 
public interface BoardService {
	
	public List<BoardVO> selectAll();
	public int insert(BoardVO board);
	public BoardVO selectOne(int bno);
	public void update(BoardVO board);
	public void delete(int bno);
	
}
