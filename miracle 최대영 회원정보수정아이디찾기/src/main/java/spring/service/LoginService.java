package spring.service;

import javax.servlet.http.HttpSession;

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
	public void login(LoginInfo info, HttpSession session) {
		User curLogin=userDao.selectById(info.getUser_Id()); 
		if(curLogin==null) {
			throw new IdNotMatchingException();
		}
		
		if(!info.getUser_Pwd().equals(curLogin.getUser_Pwd())) {
			throw new PasswordNotMatchingException();
		}
		session.setAttribute("curLogin", curLogin);
			
	}
	

}
