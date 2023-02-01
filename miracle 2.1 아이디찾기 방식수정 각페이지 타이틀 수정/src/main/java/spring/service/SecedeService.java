package spring.service;

import javax.servlet.http.HttpSession;

import org.springframework.transaction.annotation.Transactional;

import spring.Exception.IdNotMatchingException;
import spring.Exception.PasswordNotMatchingException;
import spring.dao.UserDao;
import spring.vo.LoginInfo;
import spring.vo.User;

public class SecedeService {

	private UserDao userDao;

	public SecedeService(UserDao userDao) {
		this.userDao = userDao;
	}

	@Transactional
	public void secede(LoginInfo info, HttpSession session) {
		
		User user_Id =userDao.selectById(info.getUser_Id()); 
		
		//String user_Id2 = info.getUser_Id();
		User user=(User)session.getAttribute("curLogin");
		
		
		System.out.println("가지고온아이디"+info.getUser_Id());
		
		if(user_Id==null||!user.getUser_Id().equals(info.getUser_Id())) {
			throw new IdNotMatchingException();  
		}
		if(!info.getUser_Pwd().equals(user_Id.getUser_Pwd())||!user.getUser_Pwd().equals(info.getUser_Pwd())) {
			throw new PasswordNotMatchingException();
		}
		
		
		
		int delBoardCom = userDao.deleteBoardDelCom(user_Id); 
		int delBoard = userDao.deleteBoard(user_Id);
		
		int delAdoBoardCom = userDao.deleteAdoBoardDelCom(user_Id);
		int delAppl = userDao.deleteAppl(user_Id);
		int delAdo = userDao.deleteAdoBoard(user_Id);
		
		
		

		
		int tmp = userDao.secede(user_Id);
		System.out.println(tmp+"명 회원탈퇴");
		
		//session.invalidate(); //세션초기화
		//session.setAttribute("curLogin", curLogin);
			
	}
	
	
	
}
