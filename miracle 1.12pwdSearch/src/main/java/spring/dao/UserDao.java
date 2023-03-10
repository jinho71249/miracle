package spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.vo.Adoption;
import spring.vo.PwdSearchAndChange;
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
	
	public User selectByBirth(String user_Birth) {
		return sqlSession.selectOne("mybatis.mapper.miracle.selectByBirth", user_Birth); 
	}
	
	//비밀번호 찾기 입력후 user정보 가지오고오는 쿼리 
	public String pwdChangeSelectById(User user) {
		return sqlSession.selectOne("mybatis.mapper.miracle.pwdChangeSelectById", user); 
	}
	
	public User pwdSearchAndChangeUpdate(PwdSearchAndChange pwdSAC) {
		return sqlSession.selectOne("mybatis.mapper.miracle.pwdSearchAndChangeUpdate", pwdSAC); 
	}
	
	
	
}
