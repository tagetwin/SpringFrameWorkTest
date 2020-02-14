package com.kjh.bbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kjh.bbs.dto.RepleVO;
import com.kjh.bbs.mapper.BoardMapper;
import com.kjh.bbs.mapper.RepleMapper;

@Service // 있어야 바로 오토와이어 할 수 있다.
public class BoardServiceimpl implements RepleService {

	@Inject
	private RepleMapper repleMapper;
	
	@Inject
	private BoardMapper boardMapper;
	
	@Override
	public void register(RepleVO reple) {
		boardMapper.updateRepleCount(1, reple.getBno());
		repleMapper.insert(reple);
	}

	@Override
	public List<RepleVO> getList(int bno) {
		return repleMapper.getList(bno);
	}

	@Override
	public void remove(int rno) {
		RepleVO reple = repleMapper.getReple(rno);
		boardMapper.updateRepleCount(-1, reple.getBno());
		repleMapper.delete(rno);
	}
}
