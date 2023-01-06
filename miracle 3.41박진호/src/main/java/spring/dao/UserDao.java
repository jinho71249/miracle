package spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.vo.Adoption;
import spring.vo.User;

public class UserDao {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<User> select(){
		return sqlSession.selectList("mybatis.mapper.miracle.select"); 
	}
	
	public int getPicTest(String file) {
		return sqlSession.insert("mybatis.mapper.miracle.selectImg", file);
	}
	
	
	
	
	
}
