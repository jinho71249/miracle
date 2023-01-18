package spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.vo.Adoption;
import spring.vo.Board;
import spring.vo.Comment;
import spring.vo.PwdSearchAndChange;
import spring.vo.Search;
import spring.vo.User;

public class UserDao {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<User> select(){
		return sqlSession.selectList("mybatis.mapper.miracle.select"); 
	}
	
	public int getPicTest() {
		return sqlSession.insert("mybatis.mapper.miracle.selectImg");
	}

	public User selectById(String user_Id) { 
		
		return sqlSession.selectOne("mybatis.mapper.miracle.selectById", user_Id); 
	}

	public int insertUser(User user) {
		return sqlSession.insert("mybatis.mapper.miracle.insertUser", user); 
		
	}

	public User selectByTel(String user_Tel) {

		return sqlSession.selectOne("mybatis.mapper.miracle.selectByTel", user_Tel); 
	}

	public List<Adoption> getList() {
		
		return sqlSession.selectList("mybatis.mapper.miracle.getAdoList"); 
	}

	public int getCount() {
		return sqlSession.selectOne("mybatis.mapper.miracle.getCount");
	}
	
	public User searchId(Search search) {
		return sqlSession.selectOne("mybatis.mapper.miracle.searchId",search);
		
	}

	public Adoption selectAdoByNum(int ado_Num) {
		return sqlSession.selectOne("mybatis.mapper.miracle.getAdo",ado_Num);
	}

	public int insertAdo(Adoption ado) {
		return sqlSession.insert("mybatis.mapper.miracle.insertAdo", ado);
	}
	
	public int updateUser(User user) {
		return sqlSession.update("mybatis.mapper.miracle.updateUser",user);
		
	}
	
	public String pwdChangeSelectById(User user) {
		return sqlSession.selectOne("mybatis.mapper.miracle.pwdChangeSelectById", user); 
	}
	
	public User pwdSearchAndChangeUpdate(PwdSearchAndChange pwdSAC) {
		return sqlSession.selectOne("mybatis.mapper.miracle.pwdSearchAndChangeUpdate", pwdSAC); 
	}
	public List<Board> reviewList() {
		return sqlSession.selectList("mybatis.mapper.miracle.reviewBoard");
	}

	public int reviewBoardCount() {
		return sqlSession.selectOne("mybatis.mapper.miracle.reviewBoardCount");
	}

	public Board selectBoardNum(int board_Num) {
		return sqlSession.selectOne("mybatis.mapper.miracle.selectBoardNum",board_Num);
	}

	public int boardReadCount(int board_Num) {
		
		return sqlSession.update("mybatis.mapper.miracle.boardReadCount",board_Num);
	}

	public int writeReviewBoard(Board board) {
		return sqlSession.insert("mybatis.mapper.miracle.writeReviewBoard",board);
	}

	public int updateReviewBoard(Board board) {
		return sqlSession.update("mybatis.mapper.miracle.updateReviewBoard",board);
	}

	public int reviewBoardDel(int board_Num) {
		return sqlSession.delete("mybatis.mapper.miracle.reviewBoardDel",board_Num);
	}

	public List<Board> freeList() {
		return sqlSession.selectList("mybatis.mapper.miracle.freeBoard");
	}

	public int freeBoardCount() {
		return sqlSession.selectOne("mybatis.mapper.miracle.freeBoardCount");
	}
	public int writeFreeBoard(Board board) {
		return sqlSession.insert("mybatis.mapper.miracle.writeFreeBoard",board);
	}
	public List<Comment> getCommentsByNum(int board_Num, int ado_Num) {
		if(board_Num==0) {
			return sqlSession.selectList("mybatis.mapper.miracle.getAdoComments", ado_Num);
		}
		else{
			return sqlSession.selectList("mybatis.mapper.miracle.getBoardComments", board_Num);
		}
	}

	public int insertComment(Comment comment, int i) {
		if(i==1) {
			return sqlSession.insert("mybatis.mapper.miracle.insertAdoComment", comment);
		}
		else{
			return sqlSession.insert("mybatis.mapper.miracle.insertBoardComment", comment);
		}
	}

	public int upadateComment(Comment comment, int i) {
		if(i==1) {
			return sqlSession.update("mybatis.mapper.miracle.updateAdoComment", comment);
		}
		else{
			return sqlSession.update("mybatis.mapper.miracle.updateBoardComment", comment);
		}
		
	}

	public int deleteComment(int num) {
		return sqlSession.delete("mybatis.mapper.miracle.delComment",num);
	}
	
	
	
}
