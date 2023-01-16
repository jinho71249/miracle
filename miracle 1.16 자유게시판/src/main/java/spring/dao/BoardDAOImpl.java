package spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import spring.vo.BoardVO;

public class BoardDAOImpl  implements BoardDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception{
		sqlSession.insert("boardMapper.insert",boardVO);
		
	}
	
	// 게시글 목록 조회
	@Override
	public List<BoardVO> list() throws Exception {
		
		return sqlSession.selectList("boardMapper.list");
	}

}
