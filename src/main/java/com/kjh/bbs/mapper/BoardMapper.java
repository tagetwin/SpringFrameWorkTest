package com.kjh.bbs.mapper;

import java.util.List;

import com.kjh.bbs.dto.BoardVO;
import com.kjh.bbs.dto.Criteria;

// 쿼리문을 모두 적어주는 곳
public interface BoardMapper {
	
	public List<BoardVO> getList();
	public int insert(BoardVO board);
	public void insertSelectKey(BoardVO board);
	public BoardVO read(int bno);
	public int delete(int bno);
	public int update(BoardVO board);
	public void updateReadCount(int bno);
	public List<BoardVO> listPaging(Criteria cri);
	public int countPaging(Criteria cri);
}
