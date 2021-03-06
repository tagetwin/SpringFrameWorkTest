package com.kjh.bbs;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kjh.bbs.dto.BoardVO;
import com.kjh.bbs.mapper.BoardMapper;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class DBTest {

	@Inject //
	private SqlSessionFactory sqlFactory;
	
	@Test
	public void testFactory() {
		System.out.println(">>>>>>>> sqlFactory :" + sqlFactory);
	}

	@Test
	public void testSession() {
		try (SqlSession session = sqlFactory.openSession()) {
			System.out.println(">>>>>>> session : " + session + "\n");
		} catch (Exception e) {
			e.printStackTrace(); 
		}
	}
	
	@Inject
	private BoardMapper mapper;
	
	@Test
	public void testGetlist() {
		List<BoardVO> list = mapper.getList();
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
	}
	
	@Test
	public void testWrite() {
		
		BoardVO board = new BoardVO();
		board.setContent("con");
		board.setTitle("ti");
		board.setWriter("wr");
		
		int result = mapper.insert(board);
		System.out.println(result);
	}
	
	@Test
	public void testRead() {
		int bno = 3;
//		BoardVO board =
				mapper.read(bno);
//		System.out.println(board.getBno());
//		System.out.println(board.getTitle());
//		System.out.println(board.getContent());
//		System.out.println(board.getWriter());
//		System.out.println(board.getRegDate());
//		System.out.println();
		
	}
	
	@Test
	public void testDel() {
		int bno = 11;
		mapper.delete(bno);
	}
	
	@Test
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		board.setTitle("title");
		board.setContent("content");
		board.setWriter("writer");
		mapper.insertSelectKey(board);
	}
	
//	@Test
}
