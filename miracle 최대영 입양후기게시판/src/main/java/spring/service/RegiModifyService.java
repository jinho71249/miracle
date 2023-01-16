package spring.service;

import org.springframework.transaction.annotation.Transactional;

import spring.Exception.DuplicateIdException;
import spring.Exception.DuplicateTelException;
import spring.dao.UserDao;
import spring.vo.RegisterRequest;
import spring.vo.User;

public class RegiModifyService {

	private UserDao dao;

	public RegiModifyService(UserDao dao) {
		this.dao = dao;
	}
	
	@Transactional
	public void RegiModify(RegisterRequest req) {
		User user;
		user=dao.selectByTel(req.getUser_Tel());
		if(user!=null) {
			throw new DuplicateTelException("전화번호 중복"+req.getUser_Tel());
		}
		
		User newUser=new User(req.getUser_Id(), 
				req.getUser_Pwd(),
				req.getUser_Tel(),
				req.getUser_Email());
		
		dao.updateUser(newUser);
	}
	
	
	
	
}
