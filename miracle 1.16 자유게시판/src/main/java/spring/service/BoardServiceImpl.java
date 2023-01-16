package spring.service;

import java.util.List;

import javax.inject.Inject;

import spring.dao.BoardDAO;
import spring.vo.BoardVO;

public class BoardServiceImpl {
	
	@Inject
	private BoardDAO dao;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception{
		dao.write(boardVO);
	}
	
	// 게시글 목록 조회
	@Override
	public List<BoardVO>list() throws Exception {
		
		return dao.list();
	}

}
