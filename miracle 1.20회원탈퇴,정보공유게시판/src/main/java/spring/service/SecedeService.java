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
		
		System.out.println("가지고온아이디"+info.getUser_Id());
		
		if(user_Id==null) {
			throw new IdNotMatchingException();  
		}
		if(!info.getUser_Pwd().equals(user_Id.getUser_Pwd())) {
			throw new PasswordNotMatchingException();
		}
		
		//유저아이디 받아와서 게시판글수 확인
		int boardCount = userDao.boardTblCount(user_Id);
		
		
		if(boardCount>=1) {
			
			//게시글수가 있으면 해당게시글의 게시판넘버를 가지고 온다
			i
			nt[] boardNum = userDao.
			
		}

		
		
		int tmp = userDao.secede(user_Id);
		
		System.out.println(tmp+"명 회원탈퇴");
		
		//session.invalidate(); //세션초기화
		//session.setAttribute("curLogin", curLogin);
			
	}
	
	
	
}
