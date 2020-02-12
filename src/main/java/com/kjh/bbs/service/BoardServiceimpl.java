package com.kjh.bbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kjh.bbs.dto.BoardVO;
import com.kjh.bbs.mapper.BoardMapper;

@Service // 있어야 바로 오토와이어 할 수 있다.
public class BoardServiceimpl implements BoardService {

	@Inject
	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> selectAll() {

		return mapper.getList();
	}

	@Override
	public int insert(BoardVO board) {

		int result = mapper.insert(board);
				
		return result;
	}

	
	@Override
	@Transactional
	public BoardVO selectOne(int bno) {

		try
		{
			BoardVO board = mapper.read(bno);
			mapper.updateReadCount(bno);
			 return board;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	@Override
	public void update(BoardVO board) {
		
		mapper.update(board);
		
	}

	@Override
	public int delete(int bno) {
		
		int result = mapper.delete(bno);
		return result;
		
	}
}
