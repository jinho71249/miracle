package spring.service;

import org.springframework.transaction.annotation.Transactional;

import com.mchange.v2.c3p0.impl.NewProxyStatement;

import spring.Exception.IdNotMatchingException;
import spring.Exception.PasswordNotMatchingException;
import spring.dao.UserDao;
import spring.vo.LoginInfo;
import spring.vo.User;

public class LoginService {
	private UserDao userDao;
	
	public LoginService(UserDao userDao) {
		this.userDao=userDao;
	}
	
	@Transactional
	public String login(LoginInfo info) {
		User user=userDao.selectById(info.getUser_Id());
		if(user==null) {
			throw new IdNotMatchingException();
		}
		
		if(!info.getUser_Pwd().equals(user.getUser_Pwd())) {
			throw new PasswordNotMatchingException();
		}
			
		
		return user.getUser_Id();
	}
	

}
