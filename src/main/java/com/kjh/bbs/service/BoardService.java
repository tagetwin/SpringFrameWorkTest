package com.kjh.bbs.service;

import java.util.List;

import com.kjh.bbs.dto.BoardVO;
import com.kjh.bbs.dto.Criteria;

// 동시에 일어나는 쿼리 실행들을 (증감) 주요 쿼리만 적어준다. 
public interface BoardService {
	
	public List<BoardVO> selectAll();
	public int insert(BoardVO board);
	public BoardVO selectOne(int bno);
	public void update(BoardVO board);
	public int delete(int bno);
	public void insertSelectKey(BoardVO board);
	public List<BoardVO> selectPaging(Criteria cri);
	public int countPaging(Criteria cri);
}