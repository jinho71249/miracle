package spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.vo.User;

public class UserDao {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<User> select(){
		return sqlSession.selectList("mybatis.mapper.user.select"); 
	}
}
