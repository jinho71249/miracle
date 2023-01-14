package spring.service;

import java.util.Date;

import org.springframework.transaction.annotation.Transactional;

import spring.Exception.CommonException;
import spring.Exception.DuplicateIdException;
import spring.Exception.DuplicateTelException;
import spring.dao.UserDao;
import spring.vo.RegisterRequest;
import spring.vo.User;

public class UserRegisterService {
	private UserDao userDao;
	
	public UserRegisterService(UserDao userDao) {
		this.userDao=userDao;
	}
	
	@Transactional  
	public void regist(RegisterRequest req) {
		User user=userDao.selectById(req.getUser_Id());
		if(user!=null) {
			throw new DuplicateIdException("아이디 중복"+req.getUser_Id());
		}
		
		user=userDao.selectByTel(req.getUser_Tel());
		if(user!=null) {
			throw new DuplicateTelException("전화번호 중복"+req.getUser_Tel());
		}
		
		User newUser=new User(req.getUser_Id(), 
				req.getUser_Pwd(),
				req.getUser_Name(),
				req.getUser_Tel(),
				req.getUser_Birth(),
				req.getUser_Email(),
				req.getUser_Admin());
		
		
		int tmp=userDao.insertUser(newUser);
		System.out.println(tmp+"개 쿼리 삽입됨");
		
		

	}
	
}
