package spring.service;

import org.springframework.transaction.annotation.Transactional;

import spring.Exception.IdNotMatchingException;
import spring.Exception.PasswordNotMatchingException;
import spring.dao.UserDao;
import spring.vo.LoginInfo;
import spring.vo.PwdSearchCommand;
import spring.vo.User;

public class PwdSearchService {

	private UserDao userDao;
	
	public PwdSearchService(UserDao userDao) {
		this.userDao=userDao;
	}
	
	@Transactional
	public String pwdSearch(PwdSearchCommand pwdSerchInfo) {
		
		User user_Id = userDao.selectById(pwdSerchInfo.getUser_Id());
		User user_Tel = userDao.selectByTel(pwdSerchInfo.getUser_Tel());
		User user_Bitrh = userDao.selectByBirth(pwdSerchInfo.getUser_Birth());
		

		if(user_Id==null) {
			throw new IdNotMatchingException();
		}
		
		//비밀번호 변경을 위해 유저아이디 리턴 
		if(!pwdSerchInfo.getUser_Id().equals(user_Id.getUser_Id()) 
			&& !pwdSerchInfo.getUser_Tel().equals(user_Tel.getUser_Tel())
			&& !pwdSerchInfo.getUser_Birth().equals(user_Bitrh.getUser_Birth())) {
			
			return "pwdSearch";
			
		}
		
		return user_Id.getUser_Id();
		
			
	}	
		
}
	

	
	

