package spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.vo.Adoption;
import spring.vo.Appl;
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

	public int upCountAdoBoard(int ado_Num) {
		return sqlSession.update("mybatis.mapper.miracle.upCountAdoBoard",ado_Num);
	}

	public int delAdoBoardByNum(int ado_Num) {
		return sqlSession.delete("mybatis.mapper.miracle.delAdoBoard",ado_Num);
	}

	public int updateAdoBoard(Adoption adoption) {
		
		return sqlSession.update("mybatis.mapper.miracle.modiAdoBoard", adoption);
	}

	public int insertAppl(Appl appl) {
		return sqlSession.insert("mybatis.mapper.miracle.insertAppl", appl);
	}

	public int setAlarm(Appl appl) {
		return sqlSession.update("mybatis.mapper.miracle.setAlarm", appl);
		
	}

	public int offAlarm(User user) {
		return sqlSession.update("mybatis.mapper.miracle.offAlarm", user);
		
	}

	public List<Comment> getCommentsByNum(int board_Num, int ado_Num) {
		if(board_Num==0) {//?????????????????????
			return sqlSession.selectList("mybatis.mapper.miracle.getAdoComments", ado_Num);
		}
		else {
			return sqlSession.selectList("mybatis.mapper.miracle.getBoardComments", board_Num);
		}
	}

	public int insertComment(Comment comment, int i) {
		if(i==1) {
			return sqlSession.insert("mybatis.mapper.miracle.insertAdoComment", comment);
		}
		else {
			return sqlSession.insert("mybatis.mapper.miracle.insertBoardComment", comment);
		}
		
	}

	public int upadateComment(Comment comment, int i) {
		if(i==1) {
			return sqlSession.update("mybatis.mapper.miracle.updateAdoComment", comment);
		}
		else {
			return sqlSession.update("mybatis.mapper.miracle.updateBoardComment", comment);
		}
	}

	public int deleteComment(int num) {
		return sqlSession.delete("mybatis.mapper.miracle.delComment",num);
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
	
	//	?????????????????????------------------------------------
	public List<Board> getInfoBoardList(){
		return sqlSession.selectList("mybatis.mapper.miracle.getInfoBoardList");
	}
	
	public int infoBoardCount() {
		return sqlSession.selectOne("mybatis.mapper.miracle.infoBoardCount");
	}
	
	public int writeInfoBoard(Board board) {
		return sqlSession.insert("mybatis.mapper.miracle.writeInfoBoard",board);
	}
	
	public int updateinfoBoard(Board board) {
		return sqlSession.update("mybatis.mapper.miracle.updateinfoBoard",board);
	}
	
	
	public int infoBoardDel(int board_Num) {
		return sqlSession.delete("mybatis.mapper.miracle.infoBoardDel",board_Num);
	
	}

	public List<Adoption> selectAdoById(String id) {
		return sqlSession.selectList("mybatis.mapper.miracle.selectAdoListById", id); 
	}

	public List<Appl> selectApplListById(String id) {
		return sqlSession.selectList("mybatis.mapper.miracle.selectApplListById", id); 
	}
	
	public List<Appl> selectApplByAdoNum(int ado_Num) {
		return sqlSession.selectList("mybatis.mapper.miracle.selectApplListByAdoNum", ado_Num); 
	}

	public Appl selectApplByNum(int appl_Num) {
		return sqlSession.selectOne("mybatis.mapper.miracle.selectApplByNum", appl_Num); 
		
	}

	public List<Board> selectReviewListById(String id) {
		return sqlSession.selectList("mybatis.mapper.miracle.selectReviewListById", id); 
	}

	public List<Board> selectInfoListById(String id) {
		return sqlSession.selectList("mybatis.mapper.miracle.selectInfoListById", id); 
	}

	public List<Board> selectFreeListById(String id) {
		return sqlSession.selectList("mybatis.mapper.miracle.selectFreeListById", id); 
	}

//	????????? ?????? ?????? ??????
	public int reviewBoardDelCom(int board_Num) {
		return sqlSession.delete("mybatis.mapper.miracle.reviewBoardDelCom",board_Num);
	}
	// ???????????? ?????? ???????????? 
	public int secede(User user) {
		return sqlSession.delete("mybatis.mapper.miracle.secede",user);
	}

	public int deleteBoard(User user_Id) {
		return sqlSession.delete("mybatis.mapper.miracle.deleteBoard",user_Id);
	}

	public int deleteBoardDelCom(User user_Id) {
		return sqlSession.delete("mybatis.mapper.miracle.deleteBoardDelCom",user_Id);
	}

	public int deleteAdoBoard(User user_Id) {
		return sqlSession.delete("mybatis.mapper.miracle.deleteAdoBoard",user_Id);
	}

	public int deleteAdoBoardDelCom(User user_Id) {
		return sqlSession.delete("mybatis.mapper.miracle.deleteAdoBoardDelCom",user_Id);
	}

	public int deleteAppl(User user_Id) {
		return sqlSession.delete("mybatis.mapper.miracle.deleteAppl",user_Id);
	}

	public int deleteAdoBoardDelComByAdoNum(int ado_Num) {
		return sqlSession.delete("mybatis.mapper.miracle.deleteAdoBoardDelComByAdoNum", ado_Num);
	}

	public int deleteApplByAdoNum(int ado_Num) {
		return sqlSession.delete("mybatis.mapper.miracle.deleteApplByAdoNum", ado_Num);
	}

	public List<Adoption> getListProtect() {
		return sqlSession.selectList("mybatis.mapper.miracle.getListProtect");
	}

	public int getCountProtect() {
		return sqlSession.selectOne("mybatis.mapper.miracle.getCountProtect");
	}

	public List<Adoption> getListEnd() {
		return sqlSession.selectList("mybatis.mapper.miracle.getListEnd");
	}

	public int getCountEnd() {
		return sqlSession.selectOne("mybatis.mapper.miracle.getCountEnd");
	}
	
	public List<Adoption> getListDead() {
		return sqlSession.selectList("mybatis.mapper.miracle.getListDead");
	}

	public int getCountDead() {
		return sqlSession.selectOne("mybatis.mapper.miracle.getCountDead");
	}
	
	public List<Adoption> getListTP() {
		return sqlSession.selectList("mybatis.mapper.miracle.getListTP");
	}

	public int getCountTP() {
		return sqlSession.selectOne("mybatis.mapper.miracle.getCountTP");
	}
	
	
	
	
	
	
	
	
	
}
