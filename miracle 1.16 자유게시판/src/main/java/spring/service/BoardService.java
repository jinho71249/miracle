package spring.service;

import java.util.List;

import spring.vo.BoardVO;

public class BoardService {
	
	// 게시글 작성
	public void write(BoardVO boardVO) throws Exception;
	
	// 게시글 목록 조회
	public List<BoardVO> list() throws Exception;

}
